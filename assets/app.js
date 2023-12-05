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

    // const productsCount = $('.product').length;
    // $(productsCount).each(function(i,x){
    //    console.log(i);
    // });

    // const myModal = document.getElementById('basicExampleModal')
    // const myInput = document.getElementById('request')
    // myModal.addEventListener('shown.bs.modal', () => {
    //     myInput.focus()
    // })
    //
    // const requestModal = document.getElementById('requestModal')
    // const orderInput = document.getElementById('request')
    // requestModal.addEventListener('shown.bs.modal', () => {
    //     orderInput.focus()
    // })

    // document.getElementById("sendProductRequest").onclick = function () {
    //     console.log("Clicked")
    // };

    $('#sendProductRequest').on('click', function (e) {
        console.log("Clicked")
    });

    $('.pop').on('click', function () {
        console.log('clicked');
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $(this).parent().find('#imagemodal').modal('show');
    });
});