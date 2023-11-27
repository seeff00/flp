<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title', 'Заглавие'),
            TextField::new('sub_title', 'Под заглавие'),
            TextEditorField::new('description', 'Описание'),
            TextField::new('code', 'Код'),
            NumberField::new('amount', 'Количество'),
            AssociationField::new('measurement', 'Мерна единица')->autocomplete(),
            AssociationField::new('category', 'Категория')->autocomplete(),
//            AssociationField::new('productImages', 'Изображения')->autocomplete(),
            MoneyField::new('price', 'Цена')->setCurrency('BGN'),
        ];
    }

}
