<?php

/**
 * Configuration of the site
 */

$config = [
    'db_user'   =>  'root',
    'db_pass'   =>  'jaume21',
    'site_name' =>  'Project Name'
];



/**
 * Require and load Slim
 */

require __DIR__ . '/../vendor/autoload.php';

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

/**
 * Instance PDO class
 */


$db = new PDO('mysql:host=localhost;dbname=database', $config['db_user'], $config['db_pass'], [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);


function raw_json_encode($input) {

    return preg_replace_callback(
        '/\\\\u([0-9a-zA-Z]{4})/',
        function ($matches) {
            return mb_convert_encoding(pack('H*',$matches[1]),'UTF-8','UTF-16');
        },
        json_encode($input)
    );

}
