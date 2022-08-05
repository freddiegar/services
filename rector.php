<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
require_once \realpath('/home/freddie/.composer/vendor/autoload.php');

use Rector\Config\RectorConfig;
use Rector\Core\Configuration\Option;
use Rector\Php74\Rector\Property\TypedPropertyRector;
use Rector\Set\ValueObject\SetList;

// @see https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md

return static function (RectorConfig $configurator): void {
    $configurator->import(SetList::CODE_QUALITY);
    $configurator->import(SetList::CODING_STYLE);
    $configurator->import(SetList::DEAD_CODE);
    $configurator->import(SetList::PHP_74);

    $parameters = $configurator->parameters();

    $parameters->set(Option::SKIP, [
        \Rector\CodeQuality\Rector\Catch_\ThrowWithPreviousExceptionRector::class,
        \Rector\CodeQuality\Rector\Class_\CompleteDynamicPropertiesRector::class,
        \Rector\CodeQuality\Rector\FuncCall\ArrayKeysAndInArrayToArrayKeyExistsRector::class,
        \Rector\CodeQuality\Rector\FuncCall\CompactToVariablesRector::class,
        \Rector\CodeQuality\Rector\Identical\FlipTypeControlToUseExclusiveTypeRector::class,
        \Rector\CodeQuality\Rector\If_\ExplicitBoolCompareRector::class,
        \Rector\CodeQuality\Rector\Ternary\SwitchNegatedTernaryRector::class,
        \Rector\CodingStyle\Rector\Catch_\CatchExceptionNameMatchingTypeRector::class,
        \Rector\CodingStyle\Rector\ClassConst\VarConstantCommentRector::class,
        \Rector\CodingStyle\Rector\ClassMethod\RemoveDoubleUnderscoreInMethodNameRector::class,
        \Rector\CodingStyle\Rector\ClassMethod\UnSpreadOperatorRector::class,
        \Rector\CodingStyle\Rector\Closure\StaticClosureRector::class,
        \Rector\CodingStyle\Rector\Encapsed\EncapsedStringsToSprintfRector::class,
        \Rector\CodingStyle\Rector\Encapsed\WrapEncapsedVariableInCurlyBracesRector::class,
        \Rector\CodingStyle\Rector\PostInc\PostIncDecToPreIncDecRector::class,
        \Rector\CodingStyle\Rector\Switch_\BinarySwitchToIfElseRector::class,
        \Rector\DeadCode\Rector\ClassMethod\RemoveUnusedConstructorParamRector::class,
        \Rector\Php55\Rector\String_\StringClassNameToClassConstantRector::class,
        \Rector\Php74\Rector\Closure\ClosureToArrowFunctionRector::class,
        \Rector\Php74\Rector\LNumber\AddLiteralSeparatorToNumberRector::class,
    ]);

    $services = $configurator->services();

    // Translate from @var to scalar value
    // - /**
    // -  * @var boolean
    // -  */
    // - public $foo;
    // + public bool $foo;
    $services->set(TypedPropertyRector::class);
};
