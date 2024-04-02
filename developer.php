<?php declare(strict_types=1);
                                                        // PROFILE:
$network = new \LinkedIn();
$profiles = $network->search(\JOB::DEVELOPER)->top(10); // Hello World!

foreach ($profiles as $profile) {                       // - I'm PHP Backend developer (Problem Solver)
    if ($profile->name() !== 'XXXXXXXXXXXXXXXX') {      // - I build applications with:
        continue;                                       //   TOP performance (scalable and extendable)
    }                                                   //   BEST security practices (OWASP & PCI Standars)
                                                        // - Open-source contributor
    return $profile;                                    // - Linux + Vim + Coffee === Perfection
}
