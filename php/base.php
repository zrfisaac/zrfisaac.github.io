#!/usr/bin/php
<?php
// [ zrfisaac ]

// [ about ]
// - author : Isaac Caires
// . - email : zrfisaac@gmail.com
// . - site : zrfisaac.github.io
// version : zrfisaac.php.base : 1.0.0

// [ php ]

// - library
date_default_timezone_set('UTC');

// - variable
$v_end_error = false;
$v_end_message = '';

// : - about
echo "# [ about ]\n";
echo "# - author : Isaac Caires\n";
echo "# . - email : zrfisaac@gmail.com\n";
echo "# . - site : zrfisaac.github.io\n";
echo "# - version : zrfisaac.php.base.v01 : 3.1.9\n";
echo "\n";

// : - main
if (!$v_end_error) {
    echo "# [ main ]\n";
    try {
        // : - routine
        echo "# - routine\n";
    } catch (Exception $e) {
        $v_end_error = true;
        $v_end_message = $e->getMessage();
    }
    echo "\n";
}

// : - end
echo "# [ end ]\n";
if ($v_end_error) {
    echo "# - error\n";
} else {
    echo "# - success\n";
}
if ($v_end_message != '') {
    echo "# . - message : " . $v_end_message . "\n";
}
//fgets(STDIN);
?>
