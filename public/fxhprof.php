<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
if (\extension_loaded('xhprof')) {
    $xhprof = '/var/www/html/xhprof';
    $version = \str_replace('.', '', \substr(\PHP_VERSION, 0, 3));
    $xhprofns = 'xhprof-' . $version;
    $dirlogs = \sprintf('%s/logs', $xhprof);

    if (!\is_dir($dirlogs)) {
        \mkdir($dirlogs, 0775, true);
    }

    include_once $xhprof . '/xhprof/xhprof_lib/utils/xhprof_lib.php';

    include_once $xhprof . '/xhprof/xhprof_lib/utils/xhprof_runs.php';

    $xhprofid = (new XHProfRuns_Default())->save_run(xhprof_disable(), $xhprofns);

    $xhprofurl = \sprintf('https://xhprof.development.local/index.php?run=%s&source=%s', $xhprofid, $xhprofns);

    echo '<a href="' . $xhprofurl . '" target="_blank">------@------</a>';
}
