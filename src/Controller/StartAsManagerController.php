<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StartAsManagerController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/start_as_manager', name: 'app_start_as_manager')]
    public function index(): Response
    {
        return $this->render('start_as_manager/index.html.twig', [
            'controller_name' => 'StartAsManagerController',
            'translations' => $this->translations,
        ]);
    }
}
