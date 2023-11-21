<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsBodyWeightController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/body_weight', name: 'app_products_body_weight')]
    public function index(): Response
    {
        return $this->render('products_body_weight/index.html.twig', [
            'controller_name' => 'ProductsBodyWeightController',
            'translations' => $this->translations,
        ]);
    }
}
