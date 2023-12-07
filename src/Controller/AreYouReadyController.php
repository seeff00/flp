<?php

namespace App\Controller;

use App\Entity\ProductCategory;
use App\Translations\Loader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AreYouReadyController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/business/are_you_ready', name: 'app_are_you_ready')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $categories = $entityManager->getRepository(ProductCategory::class)->findAll();

        return $this->render('are_you_ready/index.html.twig', [
            'controller_name' => 'AreYouReadyController',
            'translations' => $this->translations,
            'categories' => $categories,
        ]);
    }
}
