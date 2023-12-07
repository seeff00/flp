<?php

namespace App\Controller;

use App\Entity\ProductCategory;
use App\Translations\Loader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class YourAchievementsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/useful_materials/your_achievements', name: 'app_your_achievements')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $categories = $entityManager->getRepository(ProductCategory::class)->findAll();

        return $this->render('your_achievements/index.html.twig', [
            'controller_name' => 'YourAchievementsController',
            'translations' => $this->translations,
            'categories' => $categories,
        ]);
    }
}
