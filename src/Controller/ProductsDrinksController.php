<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsDrinksController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/drinks', name: 'app_products_drinks')]
    public function index(): Response
    {
        return $this->render('products_drinks/index.html.twig', [
            'controller_name' => 'ProductsDrinksController',
            'translations' => $this->translations,
        ]);
    }
}
