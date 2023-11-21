<?php

namespace App\Controller;

use App\Translations\Loader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FormsAndDocumentsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/forms_and_documents', name: 'app_forms_and_documents')]
    public function index(): Response
    {
        return $this->render('forms_and_documents/index.html.twig', [
            'controller_name' => 'FormsAndDocumentsController',
            'translations' => $this->translations,
        ]);
    }
}
