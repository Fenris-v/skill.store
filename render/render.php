<?php

namespace render;

/**
 * Отвечает за вывод меню из массива
 * @param array $menu - массив с меню
 */
function renderMenu(array $menu): void
{
    foreach ($menu as $elem): ?>
        <li>
            <a
                class="main-menu__item <?= $_SERVER['REQUEST_URI'] === $elem['url'] ? 'active' : '' ?>"
                href="<?= $elem['url'] ?>"><?= $elem['name'] ?>
            </a>
        </li>
    <?php endforeach;
}
