import './styles/app.scss';
import 'bootstrap';
import bsCustomFileInput from 'bs-custom-file-input';
import './bootstrap';

const $ = require('jquery');

global.$ = global.jQuery = $;

bsCustomFileInput.init();

window.bootstrap = require('bootstrap');

// const productsCarousel = document.querySelector('.product-carousel')
// let g = $('#products-carousel-1');
// console.log(g);
// $(productsCarousel).each(function(i, obj) {
//     console.log(i);
// })

// const pCarousel = new bootstrap.Carousel(productsCarousel, {
//     interval:0,
//     touch: false
// })

$(function() {
    // const homeCarousel = document.querySelector('#home-carousel')
    // const carousel = new bootstrap.Carousel(homeCarousel, {
    //     interval: 5000,
    //     touch: false,
    //     keyboard: false,
    // })
    const myModal = document.getElementById('basicExampleModal')
    const myInput = document.getElementById('request')
    myModal.addEventListener('shown.bs.modal', () => {
        myInput.focus()
    })

    const orderModal = document.getElementById('orderModal')
    const orderInput = document.getElementById('request')
    orderModal.addEventListener('shown.bs.modal', () => {
        orderInput.focus()
    })


    // $('.btn.request').on('shown.bs.modal', function () {
    //     $('#basicExampleModal').trigger('focus')
    //     // console.log("Test");
    // })

    $('.pop').on('click', function () {
        console.log('clicked');
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $(this).parent().find('#imagemodal').modal('show');
    });
});