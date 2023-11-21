<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AloeVeraController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/aloe_vera', name: 'app_aloe_vera')]
    public function index(): Response
    {
        return $this->render('aloe_vera/index.html.twig', [
            'controller_name' => 'AloeVeraController',
            'translations' => $this->translations,
        ]);
    }
}
