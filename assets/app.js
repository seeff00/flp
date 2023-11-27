import './styles/app.scss';
import 'bootstrap';
import bsCustomFileInput from 'bs-custom-file-input';
import './bootstrap';

bsCustomFileInput.init();

window.bootstrap = require('bootstrap');

const homeCarousel = document.querySelector('#home-carousel')
const carousel = new bootstrap.Carousel(homeCarousel, {
    interval: 5000,
    touch: false
})