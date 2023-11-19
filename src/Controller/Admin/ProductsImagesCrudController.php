<?php

namespace App\Controller\Admin;

use App\Entity\ProductsImages;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductsImagesCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ProductsImages::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            AssociationField::new('product')->autocomplete(),
            AssociationField::new('image')->autocomplete(),
        ];
    }

}
