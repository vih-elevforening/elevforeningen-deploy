api = 2
core = 7.x

includes[] = drupal-org-core.make

; Commons
projects[commons][type] = profile
projects[commons][version] = 3.38
projects[commons][patch][2316867] = https://www.drupal.org/files/issues/commons_disrupts-2316867-1.patch

; Additional modules
includes[] = drupal-org.make
