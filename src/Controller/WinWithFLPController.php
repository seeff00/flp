<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class WinWithFLPController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/business/win_with_flp', name: 'app_win_with_flp')]
    public function index(): Response
    {
        return $this->render('win_with_flp/index.html.twig', [
            'controller_name' => 'WinWithFLPController',
            'translations' => $this->translations,
        ]);
    }
}