<?php

namespace database;

use mysqli;

/**
 * Функия создает соединение с базой данных
 * @return mysqli - соединение с базой данных
 */
function connect(): mysqli
{
    $dbName = 'store_db';
    $user = 'root';
    $password = 'pass123';
    $host = 'localhost';

    static $connect = null;

    if (null === $connect) {
        $connect = mysqli_connect($host, $user, $password, $dbName);
        if (!$connect) {
            echo 'Код ошибки errno: ' . mysqli_connect_errno();
            exit;
        }
    }

    return $connect;
}

/**
 * Закрывает соединение с базой данных
 * @param $connect - соединение, которое нужно закрыть
 */
function closeConnect(mysqli $connect): void
{
    mysqli_close($connect);
}

/**
 * Возвращает массив с пунктами меню и ссылками
 * @return array - массив с меню
 */
function getMainMenu(): array
{
    $result = mysqli_query(
        connect(),
        "SELECT name, url FROM menu"
    );

    return getResult($result);
}

/**
 * Получение данных из ответа от базы данных
 * @param $result - результат выполнения запроса
 * @return array - массив с данными
 */
function getResult($result): array
{
    if (mysqli_num_rows($result) === 1) {
        return mysqli_fetch_assoc($result);
    } elseif (mysqli_num_rows($result) > 1) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}
