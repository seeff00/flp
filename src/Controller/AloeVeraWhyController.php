<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AloeVeraWhyController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/aloe_vera/why', name: 'app_aloe_vera_why')]
    public function index(): Response
    {
        return $this->render('aloe_vera_why/index.html.twig', [
            'controller_name' => 'AloeVeraWhyController',
            'translations' => $this->translations,
        ]);
    }
}
