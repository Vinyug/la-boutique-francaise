<?php

namespace App\Controller\Admin;

use App\Entity\Order;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class OrderCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    // Modifier les actions sur les orders (edit, delete,...)
    public function configureActions(Actions $actions): Actions
    {
        return $actions
            // Ajoute l'action de consulter l'order 
            ->add('index', 'detail');
    }

    // custom les fields du back-office order
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            DateTimeField::new('createdAt', 'Passée le'),
            TextField::new('user.fullname', 'Utilisateur'),
            MoneyField::new('total')->setCurrency('EUR'),
            BooleanField::new('isPaid', 'Payée')
        ];
    }
}
