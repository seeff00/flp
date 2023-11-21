<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsPersonalHygieneController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/personal_hygiene', name: 'app_products_personal_hygiene')]
    public function index(): Response
    {
        return $this->render('products_personal_hygiene/index.html.twig', [
            'controller_name' => 'ProductsPersonalHygieneController',
            'translations' => $this->translations,
        ]);
    }
}
