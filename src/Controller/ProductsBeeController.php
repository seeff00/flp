<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsBeeController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/bee', name: 'app_products_bee')]
    public function index(): Response
    {
        return $this->render('products_bee/index.html.twig', [
            'controller_name' => 'ProductsBeeController',
            'translations' => $this->translations,
        ]);
    }
}
