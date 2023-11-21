<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsCombinedPackagesController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/combined_packages', name: 'app_products_combined_packages')]
    public function index(): Response
    {
        return $this->render('products_combined_packages/index.html.twig', [
            'controller_name' => 'ProductsCombinedPackagesController',
            'translations' => $this->translations,
        ]);
    }
}
