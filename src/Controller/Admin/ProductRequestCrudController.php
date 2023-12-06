<?php

namespace App\Controller\Admin;

use App\Entity\ProductRequest;
use DateTimeInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductRequestCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ProductRequest::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->onlyOnIndex(),
            TextField::new('client_name','Име на клиент'),
            TextField::new('phone','Телефон'),
            TextField::new('email','E-mail'),
            TextEditorField::new('message','Съобщение'),
            TextEditorField::new('comment','Коментар'),
            IdField::new('productId', 'Продукт ИД'),
            NumberField::new('count', 'Брой'),
            MoneyField::new('price', 'Цена')->setCurrency('BGN'),
            DateTimeField::new('createdAt','Създадена заявка')->setFormat(DateTimeInterface::ATOM ),
            DateTimeField::new('executedAt','Изпълнена заявка')->setFormat(DateTimeInterface::ATOM ),
        ];
    }

}
