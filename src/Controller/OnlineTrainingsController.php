<?php

namespace App\Controller;

use App\Entity\ProductCategory;
use App\Translations\Loader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OnlineTrainingsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/online_trainings', name: 'app_online_trainings')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $categories = $entityManager->getRepository(ProductCategory::class)->findAll();

        return $this->render('online_trainings/index.html.twig', [
            'controller_name' => 'OnlineTrainingsController',
            'translations' => $this->translations,
            'categories' => $categories,
        ]);
    }
}
