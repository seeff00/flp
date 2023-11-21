<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class YourAchievementsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/your_achievements', name: 'app_your_achievements')]
    public function index(): Response
    {
        return $this->render('your_achievements/index.html.twig', [
            'controller_name' => 'YourAchievementsController',
            'translations' => $this->translations,
        ]);
    }
}
