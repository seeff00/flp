<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class NetworkMarketingController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/business/network_marketing', name: 'app_network_marketing')]
    public function index(): Response
    {
        return $this->render('network_marketing/index.html.twig', [
            'controller_name' => 'NetworkMarketingController',
            'translations' => $this->translations,
        ]);
    }
}
