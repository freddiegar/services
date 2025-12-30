<?php declare(strict_types=1);

/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
require_once realpath('/home/freddie/.config/composer/vendor/autoload.php');

use Rector\Config\RectorConfig;

// @see https://getrector.com/find-rule
// @see https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md

$config = RectorConfig::configure()
    ->withPhpSets()
    ->withPreparedSets(deadCode: true, codeQuality: true, codingStyle: true)

    ->withSkip([
        \Rector\CodeQuality\Rector\Catch_\ThrowWithPreviousExceptionRector::class,
        \Rector\CodeQuality\Rector\Class_\CompleteDynamicPropertiesRector::class,
        \Rector\CodeQuality\Rector\FuncCall\CompactToVariablesRector::class,
        \Rector\CodeQuality\Rector\FuncCall\SimplifyRegexPatternRector::class, // Simple is a conspiration
        \Rector\CodeQuality\Rector\Identical\FlipTypeControlToUseExclusiveTypeRector::class,
        \Rector\CodeQuality\Rector\If_\ExplicitBoolCompareRector::class,
        \Rector\CodeQuality\Rector\Isset_\IssetOnPropertyObjectToPropertyExistsRector::class, // @see https://github.com/rectorphp/rector/issues/6642
        \Rector\CodeQuality\Rector\Ternary\SwitchNegatedTernaryRector::class,
        \Rector\CodingStyle\Rector\Catch_\CatchExceptionNameMatchingTypeRector::class,
        \Rector\CodingStyle\Rector\ClassMethod\MakeInheritedMethodVisibilitySameAsParentRector::class,
        \Rector\CodingStyle\Rector\Closure\StaticClosureRector::class,
        \Rector\CodingStyle\Rector\Encapsed\EncapsedStringsToSprintfRector::class,
        \Rector\CodingStyle\Rector\Encapsed\WrapEncapsedVariableInCurlyBracesRector::class,
        \Rector\CodingStyle\Rector\PostInc\PostIncDecToPreIncDecRector::class,
        \Rector\CodingStyle\Rector\String_\UseClassKeywordForClassNameResolutionRector::class,
        \Rector\CodingStyle\Rector\Use_\SeparateMultiUseImportsRector::class, // Sometimes break my test (ACS)
        \Rector\DeadCode\Rector\ClassMethod\RemoveUnusedConstructorParamRector::class,
        \Rector\DeadCode\Rector\StaticCall\RemoveParentCallWithoutParentRector::class,
        \Rector\Strict\Rector\Empty_\DisallowedEmptyRuleFixerRector::class,
    ]);

$path = getcwd() . \DIRECTORY_SEPARATOR . 'composer.json';

if (!file_exists($path)) {
    return $config;
}

$data = json_decode(file_get_contents($path), true);

$vendor = $data['require'] ?? [];
$vendor += $data['require-dev'] ?? [];

$extraSkips = [];
$phpVersion = \PHP_VERSION;

if (isset($vendor['php'])) {
    [$phpVersion] = explode(' ', str_replace(['^', '~', '>', '='], '', $vendor['php']));

    if (\strlen($phpVersion) === 3 ) {
        $phpVersion .= '.0';
    }
}

// echo 'PHP: ' . $phpVersion . PHP_EOL;

if (version_compare($phpVersion, '5.5.0', '>=')) {
    $extraSkips = array_merge($extraSkips, [
        \Rector\Php55\Rector\String_\StringClassNameToClassConstantRector::class,
    ]);
}

// if (version_compare($phpVersion, '7.0.0', '>=')) {
//     $extraSkips = array_merge($extraSkips, [
//         // \Rector\Php70\Rector\StaticCall\StaticCallOnNonStaticToInstanceCallRector::class,
//     ]);
// }

if (version_compare($phpVersion, '7.4.0', '>=')) {
    $extraSkips = array_merge($extraSkips, [
        \Rector\Php74\Rector\Closure\ClosureToArrowFunctionRector::class,
        // \Rector\Php74\Rector\LNumber\AddLiteralSeparatorToNumberRector::class, @deprecated
    ]);
}

if (version_compare($phpVersion, '8.0.0', '>=')) {
    $extraSkips = array_merge($extraSkips, [
        \Rector\Php80\Rector\Switch_\ChangeSwitchToMatchRector::class, // Sometimes break my test
        // \Rector\Php80\Rector\FunctionLike\MixedTypeRector::class, // Break contracts __construct's Mailable by example -> deprecated
    ]);
}

if (version_compare($phpVersion, '8.1.0', '>=')) {
    $extraSkips = array_merge($extraSkips, [
        // \Rector\Php81\Rector\Array_\FirstClassCallableRector::class, @deprecated
        \Rector\Php81\Rector\Array_\ArrayToFirstClassCallableRector::class, // Routes in Laravel are weirds to read, avoid (['method', 'params']) -> method(params)
        \Rector\Php81\Rector\FuncCall\NullToStrictStringFuncCallArgRector::class, // Routes in Laravel are weirds to read, avoid (string) casting convert
        \Rector\Php81\Rector\Class_\MyCLabsClassToEnumRector::class,
        \Rector\Php81\Rector\MethodCall\MyCLabsMethodCallToEnumConstRector::class, // MPI fails
        // \Rector\CodingStyle\Rector\FunctionLike\FunctionLikeToFirstClassCallableRector::class, // MS fails -> @deprecated
    ]);
}

if (version_compare($phpVersion, '8.3.0', '>=')) {
    $extraSkips = array_merge($extraSkips, [
        \Rector\Php83\Rector\ClassMethod\AddOverrideAttributeToOverriddenMethodsRector::class, // For now ignores
    ]);
}

if (version_compare($phpVersion, '8.4.0', '>=')) {
    $extraSkips = array_merge($extraSkips, [
        \Rector\Php84\Rector\MethodCall\NewMethodCallWithoutParenthesesRector::class, // For now ignores
    ]);
}

// @see https://phpunit.de/supported-versions.html
if (isset($vendor['phpunit/phpunit'])) {
    [$phpunitVersion] = explode(' ', str_replace(['^', '~', '>', '='], '', $vendor['phpunit/phpunit']));
    // echo 'PHPUnit version detected: ' .  $vendor['phpunit/phpunit'] . ' -> ' . $phpunitVersion . PHP_EOL;

    switch (true) {
        case $phpunitVersion < 10:
            $phpunitSetList = \Rector\PHPUnit\Set\PHPUnitSetList::PHPUNIT_90;

            break;
        case $phpunitVersion < 11:
            $phpunitSetList = \Rector\PHPUnit\Set\PHPUnitSetList::PHPUNIT_100;
            $extraSkips = array_merge($extraSkips, [
                \Rector\PHPUnit\PHPUnit100\Rector\Class_\ParentTestClassConstructorRector::class, // Break Unit test files in ACS
            ]);

            break;
        case $phpunitVersion < 12:
        default:
            $phpunitSetList = \Rector\PHPUnit\Set\PHPUnitSetList::PHPUNIT_110;

            break;
    }

    $config->withSets([
        $phpunitSetList,
    ]);
}

// @see https://laravelversions.com/en
if (isset($vendor['laravel/framework'])) {
    [$laravelVersion] = explode(' ', str_replace(['^', '~', '>', '='], '', $vendor['laravel/framework']));
    // echo 'Laravel version detected: ' .  $vendor['laravel/framework'] . ' -> ' . $laravelVersion . PHP_EOL;

    switch (true) {
        case $laravelVersion < 9:
            $laravelSetList = \RectorLaravel\Set\LaravelSetList::LARAVEL_80;

            break;
        case $laravelVersion < 10:
            $laravelSetList = \RectorLaravel\Set\LaravelSetList::LARAVEL_90;
            $extraSkips = array_merge($extraSkips, [
                \RectorLaravel\Rector\Class_\AddExtendsAnnotationToModelFactoriesRector::class, // Keep clean phpdocs please
            ]);

            break;
        case $laravelVersion < 11:
            $laravelSetList = \RectorLaravel\Set\LaravelSetList::LARAVEL_100;

            break;
        case $laravelVersion < 12:
        default:
            $laravelSetList = \RectorLaravel\Set\LaravelSetList::LARAVEL_110;
            $extraSkips = array_merge($extraSkips, [
                \RectorLaravel\Rector\Class_\ModelCastsPropertyToCastsMethodRector::class, // Fails with json_encode Cast
            ]);

            break;
    }

    $config->withSets([
        // @see https://github.com/driftingly/rector-laravel/
        $laravelSetList,
    ]);
}

if (!empty($extraSkips)) {
    $config->withSkip($extraSkips);
}

$fileSkips = [
    '/app/ThreeDS/Authentication/AuthenticateProcess.php', // MPI
    '/app/Filters/Joins/Joins.php', // MPI
    '/app/Domain/Transaction/DTO/Vtex/TransactionData.php', // PL
    '/app/WebService/InvoiceRest.php', // MS
];

foreach ($fileSkips as $file) {
    $filepath = getcwd() . $file;

    if (!file_exists($filepath)) {
        continue;
    }

    $config->withSkipPath($filepath);
}

return $config;
