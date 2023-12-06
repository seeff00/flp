<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\ProductRequest;
use App\Repository\ProductRepository;
//use Symfony\Component\HttpKernel\Attribute\MapRequestPayload;
use App\Repository\ProductRequestRepository;
use App\Translations\Loader;
use DateTime;
use DateTimeImmutable;
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

    #[Route('/products', name: 'app_products', methods: ["GET"])]
    public function index(ProductRepository $pr, Request $request): Response // EntityManagerInterface $entityManager
    {
        $page = $request->query->get('page');
        $limit = $request->query->get('limit');
        $category = $request->query->get('cid');

        if ($page == 0) {
            $page = 1;
        }

        if ($limit == 0) {
            $limit = 9;
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

        $numberOfProducts = $pr->count(['category' => $category]);
//        $p = $pr->findBy(['category' => $category]);
        $products = $pr->findBy(['category' => $category], null, $limit, $offset);
//        $p = $entityManager->getRepository(Product::class)->findBy(['category' => $category]);
//        $products = $entityManager->getRepository(Product::class)->findBy(['category' => $category], null, $limit, $offset);

//        if (!$products) {
//            throw $this->createNotFoundException(
//                'No product found for category 1'
//            );
//        }

        $productsImages = [];
        foreach ($products as $product) {
            foreach ($product->getImages() as $image) {
                $productsImages[$product->getId()][] = $image->getImageName();
            }
        }

//        print_r($productsImages);
//        exit;

        return $this->render('products/index.html.twig', [
            'controller_name' => 'ProductsController',
            'translations' => $this->translations,
            'products' => $products,
            'productsImages' => $productsImages,
            'number_of_pages' => ceil($numberOfProducts / $limit),
            'limit' => $limit,
            'category_id' => $category,
        ]);
    }

    #[Route('/products', name: 'app_products_request', methods: ["POST"])]
    public function createProductRequest(EntityManagerInterface $entityManager, Request $request) : Response {
        $name = $request->request->get('name');
        if (!$name) {
            return $this->json(['message'=>"'Име, Фамилия' е задължително поле"]);
        }

        $phone = $request->request->get('phone');
        $email = $request->request->get('email');
        if (!$email) {
            return $this->json(['message'=>"'Имейл' е задължително поле"]);
        }

        $message = $request->request->get('message');
        if (!$message) {
            return $this->json(['message'=>"'Съобщение' е задължително поле"]);
        }

        $pid = $request->request->get('pid');

        $captcha = $request->request->get('g-recaptcha-response');
        $secret   = '6LdX9CcpAAAAAAtvpb-y7bqUFIF55A-gFaBVq5cH';
        $response = file_get_contents(
            "https://www.google.com/recaptcha/api/siteverify?secret=" . $secret . "&response=" . $captcha . "&remoteip=" . $_SERVER['REMOTE_ADDR']
        );

        $response = json_decode($response);
        if ($response->success === false) {
            return $this->json(['data' => $response, 'message' => "Възникна грешка! Моля опитайте да поръчате през нашите контакти или опитайте по-късно!"]);
        }

        $productRequest = new ProductRequest();
        $productRequest->setClientName($name);
        $productRequest->setPhone($phone);
        $productRequest->setEmail($email);
        $productRequest->setMessage($message);
        $productRequest->setProductId($pid);
        $productRequest->setCreatedAt(new DateTimeImmutable());

        $entityManager->persist($productRequest);

        $entityManager->flush();


        return $this->json(['data'=>$productRequest, 'message' => "Заявката беше изпратена успешно"]);
    }
}
