<?php
session_start();
require $_SERVER['DOCUMENT_ROOT'] . '/data/const.php';
require $_SERVER['DOCUMENT_ROOT'] . '/db/database.php';
require $_SERVER['DOCUMENT_ROOT'] . '/render/render.php';

require $_SERVER['DOCUMENT_ROOT'] . '/data/authorization.php';
if (
    isset($_SESSION['isAuth']) &&
    isset($_SESSION['isAdmin']) &&
    $_SESSION['isAuth'] &&
    (int)$_SESSION['isAdmin'] === 1
) {
    header('location: /admin/orders/');
}

include $_SERVER['DOCUMENT_ROOT'] . '/templates/html/header.php';
include $_SERVER['DOCUMENT_ROOT'] . '/templates/html/admin/authorization.php';
include $_SERVER['DOCUMENT_ROOT'] . '/templates/html/footer.php';
