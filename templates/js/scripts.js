'use strict';

const toggleHidden = (...fields) => {

    fields.forEach((field) => {

        field.hidden = field.hidden !== true;
    });
};

const labelHidden = (form) => {

    form.addEventListener('focusout', (evt) => {

        const field = evt.target;
        const label = field.nextElementSibling;

        if (field.tagName === 'INPUT' && field.value && label) {

            label.hidden = true;

        } else if (label) {

            label.hidden = false;

        }
    });
};

const toggleDelivery = (elem) => {

    const delivery = elem.querySelector('.js-radio');
    const deliveryYes = elem.querySelector('.shop-page__delivery--yes');
    const deliveryNo = elem.querySelector('.shop-page__delivery--no');
    const fields = deliveryYes.querySelectorAll('.custom-form__input');

    delivery.addEventListener('change', (evt) => {

        if (evt.target.id === 'dev-no') {

            fields.forEach(inp => {
                if (inp.required === true) {
                    inp.required = false;
                }
            });


            toggleHidden(deliveryYes, deliveryNo);

            deliveryNo.classList.add('fade');
            setTimeout(() => {
                deliveryNo.classList.remove('fade');
            }, 1000);

        } else {

            fields.forEach(inp => {
                if (inp.required === false) {
                    inp.required = true;
                }
            });

            toggleHidden(deliveryYes, deliveryNo);

            deliveryYes.classList.add('fade');
            setTimeout(() => {
                deliveryYes.classList.remove('fade');
            }, 1000);
        }
    });
};

/**
 * CATEGORIES
 */
const filterWrapper = document.querySelector('.filter__list');
if (filterWrapper) {

    filterWrapper.addEventListener('click', evt => {

        const filterList = filterWrapper.querySelectorAll('.filter__list-item');

        filterList.forEach(filter => {

            if (filter.classList.contains('active')) {

                filter.classList.remove('active');

            }

        });

        const filter = evt.target;

        filter.classList.add('active');

    });

}

/**
 * ITEMS
 */
const shopList = document.querySelector('.shop__list');
if (shopList) {

    shopList.addEventListener('click', (evt) => {

        const prod = evt.path || (evt.composedPath && evt.composedPath());

        if (prod.some(pathItem => pathItem.classList && pathItem.classList.contains('shop__item'))) {

            const shopOrder = document.querySelector('.shop-page__order');

            toggleHidden(document.querySelector('.intro'), document.querySelector('.shop'), shopOrder);

            window.scroll(0, 0);

            shopOrder.classList.add('fade');
            setTimeout(() => shopOrder.classList.remove('fade'), 1000);

            const form = shopOrder.querySelector('.custom-form');
            labelHidden(form);

            toggleDelivery(shopOrder);

            const buttonOrder = shopOrder.querySelector('.button');
            const popupEnd = document.querySelector('.shop-page__popup-end');

            buttonOrder.addEventListener('click', (evt) => {

                form.noValidate = true;

                const inputs = Array.from(shopOrder.querySelectorAll('[required]'));

                inputs.forEach(inp => {

                    if (!!inp.value) {

                        if (inp.classList.contains('custom-form__input--error')) {
                            inp.classList.remove('custom-form__input--error');
                        }

                    } else {

                        inp.classList.add('custom-form__input--error');

                    }
                });

                if (inputs.every(inp => !!inp.value)) {

                    evt.preventDefault();

                    toggleHidden(shopOrder, popupEnd);

                    popupEnd.classList.add('fade');
                    setTimeout(() => popupEnd.classList.remove('fade'), 1000);

                    window.scroll(0, 0);

                    const buttonEnd = popupEnd.querySelector('.button');

                    buttonEnd.addEventListener('click', () => {


                        popupEnd.classList.add('fade-reverse');

                        setTimeout(() => {

                            popupEnd.classList.remove('fade-reverse');

                            toggleHidden(
                                popupEnd,
                                document.querySelector('.intro'),
                                document.querySelector('.shop')
                            );

                        }, 1000);

                    });

                } else {
                    window.scroll(0, 0);
                    evt.preventDefault();
                }
            });
        }
    });
}

const pageOrderList = document.querySelector('.page-order__list');
if (pageOrderList) {

    pageOrderList.addEventListener('click', evt => {


        if (evt.target.classList && evt.target.classList.contains('order-item__toggle')) {
            var path = evt.path || (evt.composedPath && evt.composedPath());
            Array.from(path).forEach(element => {

                if (element.classList && element.classList.contains('page-order__item')) {

                    element.classList.toggle('order-item--active');

                }

            });

            evt.target.classList.toggle('order-item__toggle--active');

        }

        if (evt.target.classList && evt.target.classList.contains('order-item__btn')) {

            const status = evt.target.previousElementSibling;

            if (status.classList && status.classList.contains('order-item__info--no')) {
                let id = $(evt.target).parents('.order-item.page-order__item').data('id');
                changeStatusAjax(true, id);
                status.textContent = 'Выполнено';
            } else {
                let id = $(evt.target).parents('.order-item.page-order__item').data('id');
                changeStatusAjax(false, id);
                status.textContent = 'Не выполнено';
            }

            status.classList.toggle('order-item__info--no');
            status.classList.toggle('order-item__info--yes');

        }

    });

}

const checkList = (list, btn) => {

    btn.hidden = list.children.length !== 1;

};
const addList = document.querySelector('.add-list');
if (addList) {

    const form = document.querySelector('.custom-form');
    labelHidden(form);

    const addButton = addList.querySelector('.add-list__item--add');
    const addInput = addList.querySelector('#product-photo');

    checkList(addList, addButton);

    addInput.addEventListener('change', evt => {

        const template = document.createElement('LI');
        const img = document.createElement('IMG');

        template.className = 'add-list__item add-list__item--active';
        template.addEventListener('click', evt => {
            addList.removeChild(evt.target);
            addInput.value = '';
            checkList(addList, addButton);
        });

        const file = evt.target.files[0];
        const reader = new FileReader();

        reader.onload = (evt) => {
            img.src = evt.target.result;
            template.appendChild(img);
            addList.appendChild(template);
            checkList(addList, addButton);
        };

        reader.readAsDataURL(file);

    });

    const button = document.querySelector('.button');
    const popupEnd = document.querySelector('.page-add__popup-end');

    button.addEventListener('click', (evt) => {

        evt.preventDefault();

        form.hidden = true;
        popupEnd.hidden = false;

    })

}

const productsList = document.querySelector('.page-products__list');
if (productsList) {

    productsList.addEventListener('click', evt => {

        const target = evt.target;

        if (target.classList && target.classList.contains('product-item__delete')) {

            productsList.removeChild(target.parentElement);

        }

    });

}

// jquery range maxmin
let param = window.location.search.replace('?', '').split('&');
let data = [];
param.forEach((item) => {
    item = item.split('=');
    data[item[0]] = item[1];
});

let pMin = $('#min').data('min');
let pMax = $('#max').data('max');
let min = data['min'] ? data['min'] : pMin;
let max = data['max'] ? data['max'] : pMax;
if (document.querySelector('.shop-page')) {
    let rangeLine = $('.range__line');
    rangeLine.slider({
        min: pMin,
        max: pMax,
        values: [min, max],
        range: true,
        stop: function () {
            $('.min-price').text(rangeLine.slider('values', 0).toLocaleString('ru-RU') + ' руб.');
            $('.max-price').text(rangeLine.slider('values', 1).toLocaleString('ru-RU') + ' руб.');

            $('#min').val(rangeLine.slider('values', 0));
            $('#max').val(rangeLine.slider('values', 1));
        },
        slide: function () {

            $('.min-price').text(rangeLine.slider('values', 0).toLocaleString('ru-RU') + ' руб.');
            $('.max-price').text(rangeLine.slider('values', 1).toLocaleString('ru-RU') + ' руб.');
        }
    });
}

let changeStatusAjax = (completed, id) => {
    let param = 'status=' + completed + '&id=' + id;
    $.ajax({
        url: '/db/changeOrderStatus.php',
        type: 'POST',
        data: param
    });
}

let goodsContainer = $('.shop__list');
let sendAjax = (params) => {
    $.ajax({
        url: '/render/renderAjax.php',
        type: 'GET',
        data: params,
        success: (response) => {
            response = $.parseJSON(response);
            goodsContainer.empty();
            goodsContainer.html(response['goods']);
            $('.res-sort').text(response['count']);
            $('.shop__paginator.paginator').html(response['pages']);

            paginationClick();
            itemClick();
        }
    });
}

let changeUrl = (currentPage = '') => {
    let newPage = currentPage !== '' ? currentPage : $('.paginator__item.active').text();
    let page = 'page=' + newPage + '&';
    let isNewChecked = $('#new:checked').length === 1 ? 'new=on&' : '';
    let isSaleChecked = $('#sale:checked').length === 1 ? 'sale=on&' : '';
    let min = 'min=' + $('#min').val() + '&';
    let max = 'max=' + $('#max').val() + '&';
    let sortSelect = $('#sort option:selected').val();
    let typeSortSelect = $('#typeSort option:selected').val();
    let sort,
        sortCol;
    if (sortSelect === 'price' || sortSelect === 'name') {
        sort = 'sort=' + sortSelect + '&';
    } else {
        sort = ''
    }
    if (typeSortSelect === 'asc' || typeSortSelect === 'desc') {
        sortCol = 'type=' + typeSortSelect + '&';
    } else {
        sortCol = '';
    }
    let params = page + isNewChecked + isSaleChecked + min + max + sort + sortCol;

    let baseUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
    let newUrl = baseUrl + '?' + params;
    history.pushState(null, null, newUrl);

    sendAjax(params);
}

let paginationClick = () => {
    $('.paginator__item').on('click', (e) => {
        e.preventDefault();
        if (!$(e.target).hasClass('active')) {
            if (window.location.search.indexOf('new=on') === -1) {
                $('#new').prop('checked', false);
            }
            if (window.location.search.indexOf('sale=on') === -1) {
                $('#sale').prop('checked', false);
            }
            changeUrl(e.target.innerText);
        }
    });
}

let itemClick = () => {
    let price;
    let id;
    let orderSum = $('.order__price');
    $('.shop__item.product').on('click', (e) => {
        let item;
        if (!$(e.target).hasClass('shop__item')) {
            item = $(e.target).parents('.shop__item');
        } else {
            item = $(e.target);
        }
        let container = $(item).parents('.shop__list');
        let delivery = parseInt(container.data('delivery'));
        let min = parseInt(container.data('min'));
        price = parseInt(item.data('price'));
        id = parseInt(item.data('id'));
        if (price >= min) {
            orderSum.text('Всего ' + price + ' руб.')
        } else {
            price += delivery;
            orderSum.text(item.data('price') + ' руб. Стоимость доставки - ' + delivery + '. Всего ' + price + ' руб.');
        }

        let buy = $('.custom-form .button');
        buy.attr('data-sum', price);
        buy.attr('data-id', id);

        orderSum.attr('data-sum', price);
    });
}

$(document).ready(() => {
    itemClick();

    $('.custom-form.js-order button[type="submit"]').on('click', (e) => {
        e.preventDefault();
        let inputs = $('.custom-form.js-order').serializeArray();
        let sum = $(e.target).data('sum');
        let id = $(e.target).data('id');
        let params = $.param(inputs);
        params += '&id=' + id + '&sum=' + sum;
        console.log(params);
        $.ajax({
            url: '/data/validateForm.php',
            type: 'POST',
            data: params,
            success: (response) => {
                if (response === 'error') {
                    $('.order__error').text('Необходимо заполнить поля отмеченные звездочкой');
                } else {
                    $('.shop-page__wrapper').html(response);
                }
            }
        });
    });

    paginationClick();

    $('#sort').on('change', () => {
        changeUrl(1);
    });

    $('#typeSort').on('change', () => {
        changeUrl(1);
    });

    $('.submit_filter').on('click', (e) => {
        e.preventDefault();
        changeUrl(1);

    });
});
