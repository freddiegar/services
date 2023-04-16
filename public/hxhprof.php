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
) {
    // @see https://github.com/longxinH/xhprof
    // @see https://github.com/perftools/xhgui
    // @see https://www.php.net/manual/en/xhprof.constants.php
    // XHPROF_FLAGS_NO_BUILTINS Do not profile builtins
    // XHPROF_FLAGS_CPU         Gather CPU times for functions
    // XHPROF_FLAGS_MEMORY      Gather memory usage for functions
    xhprof_enable(XHPROF_FLAGS_NO_BUILTINS | XHPROF_FLAGS_CPU | XHPROF_FLAGS_MEMORY, [
        'ignored_functions' => [
            'call_user_func',
            'call_user_func_array',
        ],
    ]);
}
