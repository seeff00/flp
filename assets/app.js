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
    // const request-modal = document.getElementById('request-modal')
    // const orderInput = document.getElementById('request')
    // request-modal.addEventListener('shown.bs.modal', () => {
    //     orderInput.focus()
    // })

    // grecaptcha.ready(function() {
    //     // do request for recaptcha token
    //     // response is promise with passed token
    //     grecaptcha.execute('6LdX9CcpAAAAAHsbVpU56Az2rSTDJf4q7oCvys3z', {action:'validate_captcha'})
    //         .then(function(token) {
    //             // add token value to form
    //             document.getElementById('g-recaptcha-response').value = token;
    //         });
    // });

    // function onClick(e) {
    //     e.preventDefault();
    // $('.request-modal form').on('submit', function (e) {
    //     e.preventDefault();
    //     e.stopPropagation();
    //     const $form = $(this);
    //     grecaptcha.ready(function() {
    //         grecaptcha.execute('6LdX9CcpAAAAAHsbVpU56Az2rSTDJf4q7oCvys3z', {action: 'submit'}).then(function(token) {
    //             // Add your logic to submit to your backend server here.
    //             console.log($($form).serializeArray());
    //         });
    //     });
    // });

    $('.request-modal form').on('submit', function (e) {
        e.preventDefault();
        e.stopPropagation();

        const $form = $(this);
        let $message = $(e.target).parent().find('.message')
        grecaptcha.ready(function() {
            grecaptcha.execute('6LdX9CcpAAAAAHsbVpU56Az2rSTDJf4q7oCvys3z', {action:'validate_captcha'})
                .then(function(token) {
                    let $formData = $($form).serializeArray();
                    $($formData).each(function (key, value) {
                        if (value.name === "g-recaptcha-response"){
                            $formData[key].value = token;
                        }
                    });

                    if (token !== undefined && token !== "") {
                        $.ajax({
                            type: "POST",
                            url: "/products",
                            data: $formData
                        }).done(function (data) {
                            if (data.data !== undefined && data.data.id > 0) {
                                $message.css("background-color", "#50d975");
                                $form[0].reset();
                            } else {
                                $message.css("background-color", "#dc3545");
                            }

                            $message.html(data.message);
                            $message.fadeIn(1000);
                            setTimeout(function () {
                                $message.fadeOut(1200);
                            }, 5000);
                        }).fail(function(jqXHR, textStatus, errorThrown) {
                            $message.css("background-color", "#dc3545");
                            $message.html("Възникна грешка! Моля опитайте отново след 5мин. или може да се свържете с нас през нашите контакти!");
                        });
                    }
                });
        });
    });

    $('.request-modal .modal-dialog .btn-close').on('click', function (e){
        $('.modal').modal('hide');
    });

    $('.product-modal .modal-dialog .btn-close').on('click', function (e){
        $('.modal').modal('hide');
    });

    $('.pop').on('click', function () {
        console.log('clicked');
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $(this).parent().find('#imagemodal').modal('show');
    });
});