<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FrequentlyAskedQuestionsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/frequently_asked_questions', name: 'app_frequently_asked_questions')]
    public function index(): Response
    {
        return $this->render('frequently_asked_questions/index.html.twig', [
            'controller_name' => 'FrequentlyAskedQuestionsController',
            'translations' => $this->translations,
        ]);
    }
}
