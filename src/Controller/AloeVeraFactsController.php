<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AloeVeraFactsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/aloe_vera/facts', name: 'app_aloe_vera_facts')]
    public function index(): Response
    {
        return $this->render('aloe_vera_facts/index.html.twig', [
            'controller_name' => 'AloeVeraFactsController',
            'translations' => $this->translations,
        ]);
    }
}
