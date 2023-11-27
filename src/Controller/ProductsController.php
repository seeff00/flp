<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
//use Symfony\Component\HttpKernel\Attribute\MapRequestPayload;
use App\Translations\Loader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductsController extends AbstractController
{
    private array $translations;

    public function __construct()
    {
        $this->translations = Loader::getAll();
    }

    #[Route('/products', name: 'app_products')]
    public function index(ProductRepository $pr, Request $request): Response // EntityManagerInterface $entityManager
    {
        $page = $request->query->get('page');;
        $limit = $request->query->get('limit');;
        $category = $request->query->get('category');;

        if ($page == 0) {
            $page = 1;
        }

        if ($limit == 0) {
            $limit = 5;
        }

        if ($category == 0) {
            $category = 1;
        }

        $offset = 0;
        if ($page > 1) {
            $offset = ($page - 1) * $limit;
        }

//        $r = $pr->findWithRelations();
//        print_r($r);
//        exit;

        $p = $pr->findBy(['category' => $category]);
        $products = $pr->findBy(['category' => $category], null, $limit, $offset);
//        $p = $entityManager->getRepository(Product::class)->findBy(['category' => $category]);
//        $products = $entityManager->getRepository(Product::class)->findBy(['category' => $category], null, $limit, $offset);

        if (!$products) {
            throw $this->createNotFoundException(
                'No product found for category 1'
            );
        }


//        print_r($products[4]->getProductImages());
//        exit;

        return $this->render('products/index.html.twig', [
            'controller_name' => 'ProductsController',
            'translations' => $this->translations,
            'products' => $products,
            'number_of_pages' => ceil(count($p) / $limit),
            'limit' => $limit,
            'category_id' => $category,
        ]);
    }
}
