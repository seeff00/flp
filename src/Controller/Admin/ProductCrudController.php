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
            IdField::new('id', 'ИД')->onlyOnIndex(),
            TextField::new('title', 'Заглавие'),
            TextField::new('sub_title', 'Под заглавие'),
            TextareaField::new('description', 'Описание')->renderAsHtml()->onlyWhenCreating(),
            TextareaField::new('description', 'Описание')->renderAsHtml()->onlyWhenUpdating(),
            TextField::new('description', 'Описание')->onlyOnIndex()->setMaxLength(100),
            TextareaField::new('ingredients', 'Съставки')->renderAsHtml()->onlyWhenUpdating(),
            TextareaField::new('ingredients', 'Съставки')->renderAsHtml()->onlyWhenCreating(),
            TextField::new('ingredients', 'Съставки')->onlyOnIndex()->setMaxLength(100),
            TextareaField::new('recommendedUse', 'Употреба')->renderAsHtml()->onlyWhenCreating(),
            TextareaField::new('recommendedUse', 'Употреба')->renderAsHtml()->onlyWhenUpdating(),
            TextField::new('recommendedUse', 'Употреба')->onlyOnIndex()->setMaxLength(100),
            TextareaField::new('storageConditions', 'Съхранение')->renderAsHtml()->onlyWhenCreating(),
            TextareaField::new('storageConditions', 'Съхранение')->renderAsHtml()->onlyWhenUpdating(),
            TextField::new('storageConditions', 'Съхранение')->onlyOnIndex()->setMaxLength(100),
            TextareaField::new('mainCharacteristics', 'Характеристики')->renderAsHtml()->onlyWhenCreating(),
            TextareaField::new('mainCharacteristics', 'Характеристики')->renderAsHtml()->onlyWhenUpdating(),
            TextField::new('mainCharacteristics', 'Характеристики')->onlyOnIndex()->setMaxLength(100),
            TextField::new('code', 'Код'),
            TextField::new('amount', 'Количество'),
            AssociationField::new('measurement', 'Мерна единица')->autocomplete(),
            AssociationField::new('category', 'Категория')->autocomplete(),
            AssociationField::new('images', 'Изображения')->autocomplete()->onlyWhenCreating(),
            AssociationField::new('images', 'Изображения')->autocomplete()->onlyWhenUpdating(),
            AssociationField::new('images', 'Изображения')->hideOnIndex(),
            MoneyField::new('price', 'Цена')->setCurrency('BGN'),
        ];
    }

}
