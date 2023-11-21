<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CheckPointsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/check_points', name: 'app_check_points')]
    public function index(): Response
    {
        return $this->render('check_points/index.html.twig', [
            'controller_name' => 'CheckPointsController',
            'translations' => $this->translations,
        ]);
    }
}
