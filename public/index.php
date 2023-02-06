<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
if (!empty($_SERVER['HTTP_SEC_FETCH_MODE'])) {
    \phpinfo();
    die;
}

$greetings = [
    'beautyful girl!',
    'beauty?',
    'world!',
    'bro',
    ':D',
    'baby',
    '... bye',
    'or Hi?',
    'Jon',
    'Jane',
    'Champion!',
    ', I\'m Batman',
];

print \sprintf('Hello %s', $greetings[\array_rand($greetings)]);
