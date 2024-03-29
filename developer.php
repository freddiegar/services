<?php declare(strict_types=1);
/*
 * This file is part of FlexPHP.
 *
 * (c) Freddie Gar <freddie.gar@outlook.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
                                                        // PROFILE:
$network = new \LinkedIn();
$profiles = $network->search(\JOB::DEVELOPER)->top(10); // Hello World!

foreach ($profiles as $profile) {                       // - I'm PHP Backend developer
    if ($profile->name() !== 'XXXXXXXXXXXXXXXX') {      // - I build applications using
        continue;                                       //   TOP performance (scalable and extendable)
    }                                                   //   BEST security practices (OWASP & PCI Standars)
                                                        // - Open-source contributor
    return $profile;                                    // - Linux + Vim + Coffee === Perfection
}
