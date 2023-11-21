<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsEssentialOilsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/essential_oils', name: 'app_products_essential_oils')]
    public function index(): Response
    {
        return $this->render('products_essential_oils/index.html.twig', [
            'controller_name' => 'ProductsEssentialOilsController',
            'translations' => $this->translations,
        ]);
    }
}
