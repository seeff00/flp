<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BusinessOpportunitiesController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/business/opportunities', name: 'app_business_opportunities')]
    public function index(): Response
    {
        return $this->render('business_opportunities/index.html.twig', [
            'controller_name' => 'BusinessOpportunitiesController',
            'translations' => $this->translations,
        ]);
    }
}
