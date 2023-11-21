<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsBodyCareController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/body_care', name: 'app_products_body_care')]
    public function index(): Response
    {
        return $this->render('products_body_care/index.html.twig', [
            'controller_name' => 'ProductsBodyCareController',
            'translations' => $this->translations,
        ]);
    }
}
