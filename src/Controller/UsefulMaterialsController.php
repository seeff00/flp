<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UsefulMaterialsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials', name: 'app_useful_materials')]
    public function index(): Response
    {
        return $this->render('useful_materials/index.html.twig', [
            'controller_name' => 'UsefulMaterialsController',
            'translations' => $this->translations,
        ]);
    }
}
