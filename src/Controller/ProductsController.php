<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\ProductCategory;
use App\Entity\ProductRequest;
use App\Repository\ProductRepository;
//use Symfony\Component\HttpKernel\Attribute\MapRequestPayload;
use App\Repository\ProductRequestRepository;
use App\Translations\Loader;
use DateTime;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
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
    public function index(EntityManagerInterface $entityManager, Request $request): Response // EntityManagerInterface $entityManager
    {
        $page = $request->query->get('page');
        $limit = $request->query->get('limit');
        $cid = $request->query->get('cid');

        if ($page == 0) {
            $page = 1;
        }

        if ($limit == 0) {
            $limit = 9;
        }

        if ($cid == 0) {
            $cid = 1;
        }

        $offset = 0;
        if ($page > 1) {
            $offset = ($page - 1) * $limit;
        }

        // Fetch products
        $numberOfProducts = $entityManager->getRepository(Product::class)->count(['category' => $cid]);
        $products = $entityManager->getRepository(Product::class)->findBy(['category' => $cid], null, $limit, $offset);

        // Fetch categories
        $categories = $entityManager->getRepository(ProductCategory::class)->findAll();
        $currentCategory = $entityManager->getRepository(ProductCategory::class)->findOneBy(['id'=>$cid]);

        // Fetch products images
        $productsImages = [];
        foreach ($products as $product) {
            foreach ($product->getImages() as $image) {
                $productsImages[$product->getId()][] = $image->getImageName();
            }
        }

        return $this->render('products/index.html.twig', [
            'controller_name' => 'ProductsController',
            'translations' => $this->translations,
            'products' => $products,
            'productImages' => $productsImages,
            'number_of_pages' => ceil($numberOfProducts / $limit),
            'limit' => $limit,
            'cid' => $cid,
            'categories' => $categories,
            'currentCategory' => $currentCategory,
        ]);
    }

    #[Route('/products', name: 'app_products_request', methods: ["POST"])]
    public function createProductRequest(EntityManagerInterface $entityManager, Request $request) : Response {
        $captcha = $request->request->get('g-recaptcha-response');
        $secret = $_ENV['GOOGLE_RECAPTCHA_SECRET'];
        $response = file_get_contents(
            "https://www.google.com/recaptcha/api/siteverify?secret=" . $secret . "&response=" . $captcha . "&remoteip=" . $_SERVER['REMOTE_ADDR']
        );

        $response = json_decode($response);
        if ($response->success === false) {
            return $this->json(['data' => $response, 'message' => "Възникна грешка! Моля опитайте да поръчате през нашите контакти или опитайте по-късно!"]);
        }

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

    #[Route('/products/{id}', name: 'app_product', methods: ["GET"])]
    public function preview(EntityManagerInterface $entityManager, Request $request, int $id): Response // EntityManagerInterface $entityManager
    {
        if (empty($id)) {
            $referer = $request->headers->get('referer');
            $rr = new RedirectResponse($referer);
            $rr->send();
            return new Response();
        }

        $product = $entityManager->getRepository(Product::class)->findOneBy(['id' => $id]);

        $productImages = [];
        foreach ($product->getImages() as $image) {
            $productImages[$product->getId()][] = $image->getImageName();
        }

//print_r($productImages);
//        exit;
        return $this->render('products/product.html.twig', [
            'controller_name' => 'ProductsController',
            'translations' => $this->translations,
            'product' => $product,
            'productImages' => $productImages,
            'categories' => $entityManager->getRepository(ProductCategory::class)->findAll(),
            'currentCategory' => $product->getCategory()
        ]);
    }
}
