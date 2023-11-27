<?php

namespace App\Controller\Admin;

use App\Entity\Image;
use App\Entity\Measurement;
use App\Entity\Product;
use App\Entity\ProductCategory;
use App\Entity\ProductsImages;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
//        return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        return $this->redirect($adminUrlGenerator->setController(UserCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Flp');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Табло', 'fa fa-home');
        yield MenuItem::linkToCrud('Потребители', 'fas fa-user', User::class);
        yield MenuItem::linkToCrud('Продукти', 'fas fa-list', Product::class);
        yield MenuItem::linkToCrud('Продуктови категорий', 'fas fa-list', ProductCategory::class);
        yield MenuItem::linkToCrud('Изображения', 'fas fa-list', Image::class);
        yield MenuItem::linkToCrud('Мерни единици', 'fas fa-list', Measurement::class);
        yield MenuItem::linkToCrud('Продуктови изображения','fas fa-list',ProductsImages::class);
    }
}
