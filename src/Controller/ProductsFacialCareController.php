<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsFacialCareController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products/facial_care', name: 'app_products_facial_care')]
    public function index(): Response
    {
        return $this->render('products_facial_care/index.html.twig', [
            'controller_name' => 'ProductsFacialCareController',
            'translations' => $this->translations,
        ]);
    }
}
