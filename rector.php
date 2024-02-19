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
use Rector\Set\ValueObject\SetList;

// @see https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md

return RectorConfig::configure()
    ->withPhpSets()
    ->withPreparedSets(deadCode: true, codeQuality: true, codingStyle: true)

    ->withSkip([
        \Rector\CodeQuality\Rector\Catch_\ThrowWithPreviousExceptionRector::class,
        \Rector\CodeQuality\Rector\Class_\CompleteDynamicPropertiesRector::class,
        // \Rector\CodeQuality\Rector\FuncCall\ArrayKeysAndInArrayToArrayKeyExistsRector::class,
        \Rector\CodeQuality\Rector\FuncCall\CompactToVariablesRector::class,
        \Rector\CodeQuality\Rector\Identical\FlipTypeControlToUseExclusiveTypeRector::class,
        \Rector\CodeQuality\Rector\If_\ExplicitBoolCompareRector::class,
        \Rector\CodeQuality\Rector\Ternary\SwitchNegatedTernaryRector::class,
        \Rector\CodeQuality\Rector\Isset_\IssetOnPropertyObjectToPropertyExistsRector::class, // @see https://github.com/rectorphp/rector/issues/6642
        \Rector\CodingStyle\Rector\Catch_\CatchExceptionNameMatchingTypeRector::class,
        \Rector\CodingStyle\Rector\String_\UseClassKeywordForClassNameResolutionRector::class,
        // \Rector\CodingStyle\Rector\ClassConst\VarConstantCommentRector::class,
        // \Rector\CodingStyle\Rector\ClassMethod\RemoveDoubleUnderscoreInMethodNameRector::class,
        // \Rector\CodingStyle\Rector\ClassMethod\UnSpreadOperatorRector::class,
        \Rector\CodingStyle\Rector\Closure\StaticClosureRector::class,
        \Rector\CodingStyle\Rector\Encapsed\EncapsedStringsToSprintfRector::class,
        \Rector\CodingStyle\Rector\Encapsed\WrapEncapsedVariableInCurlyBracesRector::class,
        \Rector\CodingStyle\Rector\PostInc\PostIncDecToPreIncDecRector::class,
        // \Rector\CodingStyle\Rector\Switch_\BinarySwitchToIfElseRector::class,
        \Rector\DeadCode\Rector\StaticCall\RemoveParentCallWithoutParentRector::class,
        \Rector\DeadCode\Rector\ClassMethod\RemoveUnusedConstructorParamRector::class,
        \Rector\Strict\Rector\Empty_\DisallowedEmptyRuleFixerRector::class,
        \Rector\Php55\Rector\String_\StringClassNameToClassConstantRector::class,
        \Rector\Php74\Rector\Closure\ClosureToArrowFunctionRector::class,
        \Rector\Php74\Rector\LNumber\AddLiteralSeparatorToNumberRector::class,
        \Rector\Php81\Rector\FuncCall\NullToStrictStringFuncCallArgRector::class,
    ]);
