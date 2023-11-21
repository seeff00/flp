<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsSupplementsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/supplements', name: 'app_products_supplements')]
    public function index(): Response
    {
        return $this->render('products_supplements/index.html.twig', [
            'controller_name' => 'ProductsSupplementsController',
            'translations' => $this->translations,
        ]);
    }
}
