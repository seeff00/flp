<?php

namespace App\Controller\Admin;

use App\Entity\ProductCategory;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ProductCategory::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', 'ИД')->onlyOnIndex(),
            TextField::new('title', 'Заглавие'),
            TextareaField::new('description', 'Описание')->renderAsHtml()->onlyWhenCreating()->setRequired(false),
            TextareaField::new('description', 'Описание')->renderAsHtml()->onlyWhenUpdating()->setRequired(false),
            TextField::new('description', 'Описание')->onlyOnIndex()->setMaxLength(100),
            TextField::new('color', 'Цвят'),
        ];
    }

}
