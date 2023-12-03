<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', 'Заглавие'),
            TextField::new('sub_title', 'Под заглавие'),
            TextareaField::new('description', 'Описание')->renderAsHtml(),
            TextField::new('code', 'Код'),
            NumberField::new('amount', 'Количество'),
            AssociationField::new('measurement', 'Мерна единица')->autocomplete(),
            AssociationField::new('category', 'Категория')->autocomplete(),
            AssociationField::new('images', 'Изображения')->autocomplete(),
//            TextField::new('images', 'Изображение')
//                ->setFormType(VichImageType::class)
//                ->onlyWhenUpdating(),
//            ImageField::new('images', 'Изображение')
//                ->setUploadDir('/uploads/attachments')
//                ->onlyOnIndex()
//                ->setBasePath('/uploads/attachments'),
            MoneyField::new('price', 'Цена')->setCurrency('BGN'),
        ];
    }

}
