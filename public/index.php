<?php

// die('<pre>' . print_r($_SERVER, true) . '</pre>');

if (empty($_SERVER['HTTP_SEC_FETCH_MODE'])) {
    phpinfo();
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

echo sprintf('Hello %s', $greetings[array_rand($greetings)]);
