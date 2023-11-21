<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsCosmeticsSonyaController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/cosmetics_sonya', name: 'app_products_cosmetics_sonya')]
    public function index(): Response
    {
        return $this->render('products_cosmetics_sonya/index.html.twig', [
            'controller_name' => 'ProductsCosmeticsSonyaController',
            'translations' => $this->translations,
        ]);
    }
}
