<?php

namespace App\Form;

use App\Entity\Address;
use App\Entity\Carrier;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        // permet de définir que les options des datas accessibles sont celles de l'user
        $user = $options['user'];

        $builder
            ->add('addresses', EntityType::class, [
                'label' => 'Choississez votre adresse de livraison',
                'required' => true,
                'class' => Address::class,
                // Définir les choix selon méthode
                'choices' => $user->getAddresses(),
                // select radio
                'multiple' => false,
                'expanded' => true
            ])
            ->add('carriers', EntityType::class, [
                'label' => 'Choississez votre transporteur',
                'required' => true,
                'class' => Carrier::class,
                // select radio
                'multiple' => false,
                'expanded' => true
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Valider ma commande',
                'attr' => [
                    'class' => 'btn btn-success btn-block'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
            // permet de choisir uniquement les datas de l'user
            'user' => array(),
        ]);
    }
}
