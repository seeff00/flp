<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MarketingPlanController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/business/marketing_plan', name: 'app_marketing_plan')]
    public function index(): Response
    {
        return $this->render('marketing_plan/index.html.twig', [
            'controller_name' => 'MarketingPlanController',
            'translations' => $this->translations,
        ]);
    }
}
