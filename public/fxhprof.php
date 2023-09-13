<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
if (\extension_loaded('xhprof')
    && !empty($_SERVER['SCRIPT_URL'])
    && strpos($_SERVER['SCRIPT_URL'], '_debugbar') === false
    && strpos($_SERVER['HTTP_USER_AGENT'] ?? '', 'curl') === false
) {
    $xhprof = '/var/www/html/xhprof';
    $version = str_replace('.', '', substr(\PHP_VERSION, 0, 3));
    $xhprofns = 'xhprof-' . $version;
    $dirlogs = sprintf('%s/logs', $xhprof);

    if (!is_dir($dirlogs)) {
        mkdir($dirlogs, 0775, true);
    }

    include_once $xhprof . '/xhprof/xhprof_lib/utils/xhprof_lib.php';

    include_once $xhprof . '/xhprof/xhprof_lib/utils/xhprof_runs.php';

    $xhprofid = (new XHProfRuns_Default())->save_run(xhprof_disable(), $xhprofns);

    $xhprofurl = sprintf('https://xhprof.development.local/index.php?run=%s&source=%s', $xhprofid, $xhprofns);

    $xhproflog = '/var/www/html/logs/' . $xhprofns . '.log';

    $jsonServer = json_encode($_SERVER);
    $jsonHeaders = json_encode(apache_response_headers());

    if (!is_file($xhproflog) && $handler = fopen($xhproflog, 'a')) {
        fclose($handler);
    }

    if (is_writable($xhproflog)) {
        file_put_contents($xhproflog, date('Y-m-d H:i:s ') . $xhprofid . ' $_SERVER ' . $jsonServer . "\n", \FILE_APPEND);
        file_put_contents($xhproflog, date('Y-m-d H:i:s ') . $xhprofid . ' $_HEADER ' . $jsonHeaders . "\n", \FILE_APPEND);
    }

    if (strpos(strtolower($jsonHeaders), 'application\/json') !== false
        || (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest')
        || (!empty($_SERVER['SCRIPT_URL']) && strpos($_SERVER['SCRIPT_URL'], 'v1/challenge') !== false)
    ) {
        exit;
    }

    print '<a href="' . $xhprofurl . '" target="_blank">------@------</a>';
}
