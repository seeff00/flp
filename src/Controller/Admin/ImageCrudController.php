<?php

namespace App\Controller\Admin;

use App\Entity\Image;
use App\Entity\Owner;
use App\Form\ImageType;
use DateTimeInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class ImageCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Image::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('imageFile', 'Изображение')
                ->setFormType(VichImageType::class)
                ->onlyWhenCreating(),
            TextField::new('imageFile', 'Изображение')
                ->setFormType(VichImageType::class)
                ->onlyWhenUpdating(),
            ImageField::new('imageName', 'Изображение')
                ->setUploadDir('/uploads/attachments')
                ->onlyOnIndex()
                ->setBasePath('/uploads/attachments'),
            DateTimeField::new('updated_at', 'Редактиран на')->setFormat(DateTimeInterface::ATOM )
        ];
    }
}