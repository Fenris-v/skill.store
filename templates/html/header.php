<?php
include $_SERVER['DOCUMENT_ROOT'] . '/data/const.php';
include $_SERVER['DOCUMENT_ROOT'] . '/db/database.php';
include $_SERVER['DOCUMENT_ROOT'] . '/render/render.php';
$menu = database\getMainMenu();
?>

    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>Fashion</title>

        <meta name="description" content="Fashion - интернет-магазин">
        <meta name="keywords" content="Fashion, интернет-магазин, одежда, аксессуары">

        <meta name="theme-color" content="#393939">

        <link rel="preload" href="/templates/img/intro/coats-2018.jpg" as="image">
        <link rel="preload" href="/templates/fonts/opensans-400-normal.woff2" as="font">
        <link rel="preload" href="/templates/fonts/roboto-400-normal.woff2" as="font">
        <link rel="preload" href="/templates/fonts/roboto-700-normal.woff2" as="font">

        <link rel="icon" href="/templates/img/favicon.png">
        <link rel="stylesheet" href="/templates/css/style.css">

        <script src="/templates/js/lib/jquery.min.js"></script>
        <script src="/templates/js/lib/jquery-ui.js"></script>
        <script src="/templates/js/scripts.js" defer=""></script>
    </head>
<body>
<header class="page-header container">
    <a class="page-header__logo" href="/">
        <img src="/templates/img/logo.svg" alt="Fashion">
    </a>
    <nav class="page-header__menu">
        <ul class="main-menu main-menu--header">
            <?php render\renderMenu($menu); ?>
        </ul>
    </nav>
</header>

<?php
database\closeConnect(database\connect());
