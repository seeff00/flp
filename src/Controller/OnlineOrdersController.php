<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OnlineOrdersController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/online_orders', name: 'app_online_orders')]
    public function index(): Response
    {
        return $this->render('online_orders/index.html.twig', [
            'controller_name' => 'OnlineOrdersController',
            'translations' => $this->translations,
        ]);
    }
}
