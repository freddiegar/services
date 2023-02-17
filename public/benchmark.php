<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
\set_time_limit(120); // 2 minutes

if (!empty($_GET['f']) && function_exists($_GET['f']) && in_array($_GET['f'], ['test_concat_detail'], true)) {
    call_user_func_array($_GET['f'], []);

    die;
}

$options = [];

// Show or hide the server name and IP address
$showServerName = false;

// Optional: mysql performance test
$options['db.host'] = 'db';
$options['db.name'] = 'prestashop';
$options['db.user'] = 'prestashop';
$options['db.pass'] = '';

// -----------------------------------------------------------------------------
// Main
// -----------------------------------------------------------------------------
// check performance
try {
    $benchmarkResult = test_benchmark($options);
} catch (Exception $e) {
    die(\sprintf('%s::%s:%s => %s', \PHP_VERSION, $e->getFile(), $e->getLine(), $e->getMessage()));
}

// html output
print "<!DOCTYPE html>\n<html><head>\n";
print '<style>
       table a:link {
        color: #666;
        font-weight: bold;
        text-decoration:none;
    }
    table a:visited {
        color: #999999;
        font-weight:bold;
        text-decoration:none;
    }
    table a:active,
    table a:hover {
        color: #bd5a35;
        text-decoration:underline;
    }
    table {
        font-family:Arial, Helvetica, sans-serif;
        color:#666;
        font-size:12px;
        text-shadow: 1px 1px 0px #fff;
        background:#eaebec;
        margin:20px;
        border:#ccc 1px solid;
        -moz-border-radius:3px;
        -webkit-border-radius:3px;
        border-radius:3px;
        -moz-box-shadow: 0 1px 2px #d1d1d1;
        -webkit-box-shadow: 0 1px 2px #d1d1d1;
        box-shadow: 0 1px 2px #d1d1d1;
    }
    table th {
        padding:8px 15px 8px 8px;
        border-top:1px solid #fafafa;
        border-bottom:1px solid #e0e0e0;
        text-align: left;
        background: #ededed;
        background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
        background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
    }
    table th:first-child {
        text-align: left;
        padding-left:10px;
    }
    table tr:first-child th:first-child {
        -moz-border-radius-topleft:3px;
        -webkit-border-top-left-radius:3px;
        border-top-left-radius:3px;
    }
    table tr:first-child th:last-child {
        -moz-border-radius-topright:3px;
        -webkit-border-top-right-radius:3px;
        border-top-right-radius:3px;
    }
    table tr {
        padding-left:10px;
    }
    table td:first-child {
        text-align: left;
        padding-left:10px;
        border-left: 0;
    }
    table td {
        padding:8px;
        border-top: 1px solid #ffffff;
        border-bottom:1px solid #e0e0e0;
        border-left: 1px solid #e0e0e0;
        background: #fafafa;
        background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
        background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
    }
    table tr.even td {
        background: #f6f6f6;
        background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
        background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
    }
    table tr:last-child td {
        border-bottom:0;
    }
    table tr:last-child td:first-child {
        -moz-border-radius-bottomleft:3px;
        -webkit-border-bottom-left-radius:3px;
        border-bottom-left-radius:3px;
    }
    table tr:last-child td:last-child {
        -moz-border-radius-bottomright:3px;
        -webkit-border-bottom-right-radius:3px;
        border-bottom-right-radius:3px;
    }
    table tr:hover td {
        background: #f2f2f2;
        background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
        background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);
    }
    </style>
    </head>
    <body>';

$log = getcwd() . DIRECTORY_SEPARATOR . 'benchmark.log';

if (!\file_exists($log) || \file_get_contents($log) === '') {
    \file_put_contents($log, "V\tM\tS\tC\tL\tI\tCT\tMT\tT\n");
}

\file_put_contents($log, \sprintf(
    "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
    \substr($benchmarkResult['sysinfo']['php_version'], 0, 6),
    $benchmarkResult['benchmark']['math'],
    $benchmarkResult['benchmark']['string'],
    $benchmarkResult['benchmark']['concat'],
    $benchmarkResult['benchmark']['loops'],
    $benchmarkResult['benchmark']['ifelse'],
    $benchmarkResult['benchmark']['calculation_total'],
    $benchmarkResult['benchmark']['mysql_total'] ?? 0,
    $benchmarkResult['benchmark']['total']
), \FILE_APPEND);

print print_benchmark_result($benchmarkResult, $showServerName);

print "\n</body></html>";
exit;

// -----------------------------------------------------------------------------
// Benchmark functions
// -----------------------------------------------------------------------------

function test_benchmark($settings)
{
    $result = [];
    $result['sysinfo']['time'] = \date('Y-m-d H:i:s');
    $result['sysinfo']['php_version'] = \PHP_VERSION;
    $result['sysinfo']['platform'] = \PHP_OS;
    $result['sysinfo']['server_name'] = $_SERVER['SERVER_NAME'];
    $result['sysinfo']['server_addr'] = $_SERVER['SERVER_ADDR'];
    $result['sysinfo']['xdebug'] = \in_array('xdebug', \get_loaded_extensions());

    $timeStart = \microtime(true);

    test_math($result);
    test_string($result);
    test_concat($result);
    test_loops($result);
    test_ifelse($result);

    $result['benchmark']['calculation_total'] = timer_diff($timeStart);

    if (\PHP_VERSION_ID >= 70000 && !empty($settings['db.pass'])) {
        test_mysql($result, $settings);
    }

    $result['benchmark']['total'] = timer_diff($timeStart);

    return $result;
}

function test_math(&$result, $count = 99999): void
{
    $timeStart = \microtime(true);

    $mathFunctions = ['abs', 'acos', 'asin', 'atan',  'floor', 'exp', 'sin', 'tan', 'is_finite', 'is_nan', 'sqrt'];

    for ($i = 0; $i < $count; $i++) {
        foreach ($mathFunctions as $function) {
            \call_user_func_array($function, [$i]);
        }
    }

    $result['benchmark']['math'] = timer_diff($timeStart);
}

function test_string(&$result, $count = 99999): void
{
    $timeStart = \microtime(true);
    $stringFunctions = ['addslashes', 'chunk_split', 'metaphone', 'strip_tags', 'md5', 'sha1', 'strtoupper', 'strtolower', 'strrev', 'strlen', 'soundex', 'ord'];

    $string = 'the quick brown fox jumps over the lazy dog';

    for ($i = 0; $i < $count; $i++) {
        foreach ($stringFunctions as $function) {
            \call_user_func_array($function, [$string]);
        }
    }

    $result['benchmark']['string'] = timer_diff($timeStart);
}

function test_concat_echo_single(): void
{
    echo '$name, What is your current age in $year?';
}

function test_concat_echo_quotes(string $name, int $year): void
{
    echo "$name, What is your current age in $year?";
}

function test_concat_sprintf(string $name, int $year): void
{
    echo sprintf("%s,What is your current age in %s?", $name, $year);
}

function test_concat_sprintf_int(string $name, int $year): void
{
    echo sprintf("%s,What is your current age in %d?", $name, $year);
}

function test_concat_printf(string $name, int $year): void
{
    printf('%s,What is your current age in %d?', $name, $year);
}

function test_concat(&$result, $count = 99999): void
{
    $timeStart = \microtime(true);
    $stringFunctions = ['test_concat_echo_single', 'test_concat_echo_quotes', 'test_concat_sprintf', 'test_concat_sprintf_int', 'test_concat_printf'];

    $name = 'Jon';
    $year = 2023;

    foreach ($stringFunctions as $function) {
        for ($i = 0; $i < $count; $i++) {
            \ob_start();
            \call_user_func_array($function, [$name, $year]);
            $content = \ob_get_clean();
            \ob_flush();
            unset($content);
        }
    }

    $result['benchmark']['concat'] = timer_diff($timeStart);
}

function test_concat_detail(): void
{
    $stringFunctions = ['test_concat_echo_single', 'test_concat_echo_quotes', 'test_concat_sprintf', 'test_concat_sprintf_int', 'test_concat_printf'];

    $name = 'Jon';
    $year = 2023;
    $result = [];
    $count = 99999;

    foreach ($stringFunctions as $function) {
        $timeStart = \microtime(true);
        for ($i = 0; $i < $count; $i++) {
            \ob_start();
            \call_user_func_array($function, [$name, $year]);
            $content = \ob_get_clean();
            \ob_flush();
            unset($content);
        }
        $result[$function] = timer_diff($timeStart);
    }

    var_dump($result);
}

function test_loops(&$result, $count = 999999): void
{
    $timeStart = \microtime(true);

    for ($i = 0; $i < $count; ++$i) {
    }

    $i = 0;

    while ($i < $count) {
        ++$i;
    }

    $result['benchmark']['loops'] = timer_diff($timeStart);
}

function test_ifelse(&$result, $count = 999999): void
{
    $timeStart = \microtime(true);

    for ($i = 0; $i < $count; $i++) {
        if ($i == -1) {
        } elseif ($i == -2) {
        } else {
            if ($i == -3) {
            }
        }
    }

    $result['benchmark']['ifelse'] = timer_diff($timeStart);
}

function test_mysql(&$result, $settings)
{
    $timeStart = \microtime(true);

    $link = \mysqli_connect($settings['db.host'], $settings['db.user'], $settings['db.pass']);

    if (!$link) {
        print 'Unable to connect to mysql';

        return;
    }
    $result['benchmark']['mysql_connect'] = timer_diff($timeStart);

    \mysqli_select_db($link, $settings['db.name']);
    $result['benchmark']['mysql_select_db'] = timer_diff($timeStart);

    $dbResult = \mysqli_query($link, 'SELECT VERSION() as version;');
    $arr_row = \mysqli_fetch_array($dbResult);
    $result['sysinfo']['mysql_version'] = $arr_row['version'];
    $result['benchmark']['mysql_query_version'] = timer_diff($timeStart);

    $query = "SELECT BENCHMARK(1000000, AES_ENCRYPT('hello', UNHEX('F3229A0B371ED2D9441B830D21A390C3')));";
    \mysqli_query($link, $query);
    $result['benchmark']['mysql_query_benchmark'] = timer_diff($timeStart);

    \mysqli_close($link);

    $result['benchmark']['mysql_total'] = timer_diff($timeStart);

    return $result;
}

function timer_diff($timeStart)
{
    return \number_format(\microtime(true) - $timeStart, 9);
}

function print_benchmark_result($data, $showServerName = true)
{
    $result = '<table cellspacing="0">';
    $result .= '<thead><tr><th>System Info</th><th></th></tr></thead>';
    $result .= '<tbody>';
    $result .= '<tr class="even"><td>Time</td><td>' . h($data['sysinfo']['time']) . '</td></tr>';

    if (!empty($data['sysinfo']['xdebug'])) {
        // You are running the benchmark with xdebug enabled. This has a major impact on runtime performance.
        $result .= '<tr class="even"><td>Xdebug</td><td><span style="color: darkred">'
            . h('Warning: Xdebug is enabled!')
            . '</span></td></tr>';
    }

    $result .= '<tr class="even"><td>PHP Version</td><td>' . h($data['sysinfo']['php_version']) . '</td></tr>';
    $result .= '<tr class="even"><td>Platform</td><td>' . h($data['sysinfo']['platform']) . '</td></tr>';

    if ($showServerName == true) {
        $result .= '<tr class="even"><td>Server name</td><td>' . h($data['sysinfo']['server_name']) . '</td></tr>';
        $result .= '<tr class="even"><td>Server address</td><td>' . h($data['sysinfo']['server_addr']) . '</td></tr>';
    }

    $result .= '</tbody>';

    $result .= '<thead><tr><th>Benchmark</th><th></th></tr></thead>';
    $result .= '<tbody>';
    $result .= '<tr><td>Math</td><td>' . h($data['benchmark']['math']) . '</td></tr>';
    $result .= '<tr><td>String</td><td>' . h($data['benchmark']['string']) . '</td></tr>';
    $result .= '<tr><td>Concat</td><td>' . h($data['benchmark']['concat']) . '</td></tr>';
    $result .= '<tr><td>Loops</td><td>' . h($data['benchmark']['loops']) . '</td></tr>';
    $result .= '<tr><td>If Else</td><td>' . h($data['benchmark']['ifelse']) . '</td></tr>';
    $result .= '<tr class="even"><td>Calculation Total</td><td>' . h($data['benchmark']['calculation_total']) . '</td></tr>';
    $result .= '</tbody>';

    if (isset($data['sysinfo']['mysql_version'])) {
        $result .= '<thead><tr><th>MySQL</th><th></th></tr></thead>';
        $result .= '<tbody>';
        $result .= '<tr><td>MySQL Version</td><td>' . h($data['sysinfo']['mysql_version']) . '</td></tr>';
        $result .= '<tr><td>MySQL Connect</td><td>' . h($data['benchmark']['mysql_connect']) . '</td></tr>';
        $result .= '<tr><td>MySQL Select DB</td><td>' . h($data['benchmark']['mysql_select_db']) . '</td></tr>';
        $result .= '<tr><td>MySQL Query Version</td><td>' . h($data['benchmark']['mysql_query_version']) . '</td></tr>';
        $result .= '<tr><td>MySQL Benchmark</td><td>' . h($data['benchmark']['mysql_query_benchmark']) . '</td></tr>';
        $result .= '<tr class="even"><td>MySQL Total</td><td>' . h($data['benchmark']['mysql_total']) . '</td></tr>';
        $result .= '</tbody>';
    }

    $result .= '<thead><tr><th>Total</th><th>' . h($data['benchmark']['total']) . '</th></tr></thead>';
    $result .= '</table>';

    return $result;
}

function h($v)
{
    return \htmlentities($v);
}
