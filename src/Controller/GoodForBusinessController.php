<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GoodForBusinessController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/good_for_business', name: 'app_good_for_business')]
    public function index(): Response
    {
        return $this->render('good_for_business/index.html.twig', [
            'controller_name' => 'GoodForBusinessController',
            'translations' => $this->translations,
        ]);
    }
}