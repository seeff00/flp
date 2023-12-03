<?php

namespace App\Controller\Admin;

use App\Entity\Measurement;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class MeasurementCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Measurement::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', 'Заглавие'),
        ];
    }

}
