<?php
session_start();
require $_SERVER['DOCUMENT_ROOT'] . '/data/const.php';
require $_SERVER['DOCUMENT_ROOT'] . '/db/database.php';
require $_SERVER['DOCUMENT_ROOT'] . '/render/render.php';
include $_SERVER['DOCUMENT_ROOT'] . '/templates/html/header.php';
include $_SERVER['DOCUMENT_ROOT'] . '/templates/html/admin/products/products.php';
include $_SERVER['DOCUMENT_ROOT'] . '/templates/html/footer.php';
