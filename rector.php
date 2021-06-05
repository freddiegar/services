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

use Rector\Core\Configuration\Option;
use Rector\Php74\Rector\Property\TypedPropertyRector;
use Rector\Set\ValueObject\SetList;
use Symfony\Component\DependencyInjection\Loader\Configurator\ContainerConfigurator;

// @see https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md

return static function (ContainerConfigurator $containerConfigurator): void {
    $containerConfigurator->import(SetList::CODE_QUALITY);
    $containerConfigurator->import(SetList::CODING_STYLE);
    $containerConfigurator->import(SetList::DEAD_CODE);
    $containerConfigurator->import(SetList::DEFLUENT);
    $containerConfigurator->import(SetList::PHP_74);

    $parameters = $containerConfigurator->parameters();

    $parameters->set(Option::SKIP, [
        \Rector\CodeQuality\Rector\Class_\CompleteDynamicPropertiesRector::class,
        \Rector\CodeQuality\Rector\Catch_\ThrowWithPreviousExceptionRector::class,
        \Rector\CodeQuality\Rector\FuncCall\CompactToVariablesRector::class,
        \Rector\CodeQuality\Rector\FuncCall\ArrayKeysAndInArrayToArrayKeyExistsRector::class,
        \Rector\CodeQuality\Rector\Ternary\SwitchNegatedTernaryRector::class,
        \Rector\CodingStyle\Rector\ClassConst\VarConstantCommentRector::class,
        \Rector\CodingStyle\Rector\Encapsed\EncapsedStringsToSprintfRector::class,
        \Rector\CodingStyle\Rector\Switch_\BinarySwitchToIfElseRector::class,
        \Rector\CodingStyle\Rector\Encapsed\WrapEncapsedVariableInCurlyBracesRector::class,
        \Rector\DeadCode\Rector\ClassMethod\RemoveUnusedConstructorParamRector::class,
        \Rector\Php55\Rector\String_\StringClassNameToClassConstantRector::class,
    ]);

    $services = $containerConfigurator->services();

    // Translate from @var to scalar value
    // - /**
    // -  * @var boolean
    // -  */
    // - public $foo;
    // + public bool $foo;
    $services->set(TypedPropertyRector::class);
};
