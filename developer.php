<?php
                                                        // PROFILE:
$network = new \LinkedIn();
$profiles = $network->search(\JOB::DEVELOPER)->top(10); // Hello World!

foreach ($profiles as $profile) {                       // - I'm  PHP Backend developer
    if ($profile->name() !== 'XXXXXXXXXXXXXXXX') {      // - I build applications using
        continue;                                       //   TOP performance with BEST security practices
    }                                                   // - Open-source contributor

    return $profile;                                    // - Linux + Vim + Coffee === Perfection
}
