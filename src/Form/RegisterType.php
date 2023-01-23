<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class RegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // 2ème param est un composant pour typer les inputs
            // 3ème param pour remplacer le contenu des tags/attributs par autre chose
            ->add('firstname', TextType::class, [
                'label' => 'Votre prénom',
                'constraints' => new Length(min: 2, max: 30),
                'attr' => [
                    'placeholder' => 'Saisir votre prénom'
                ]
            ])
            ->add('lastname', TextType::class, [
                'label' => 'Votre nom',
                'constraints' => new Length(min: 2, max: 30),
                'attr' => [
                    'placeholder' => 'Saisir votre nom'
                ]
            ])
            ->add('email', EmailType::class, [
                'label' => 'Votre email',
                'constraints' => new Length(min: 6, max: 60),
                'attr' => [
                    'placeholder' => 'Saisir votre email'
                ]
            ])
            // repeatedtype permet de faire plusieurs inputs
            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Le mot de passe et la confirmation doivent être identique.',
                'label' => 'Votre mot de passe',
                'constraints' => new Length(min: 8, max: 30),
                'required' => true,
                'first_options' => [
                    'label' => 'Mot de passe',
                    'attr' => [
                        'placeholder' => 'Saisir votre mot de passe'
                    ],
                ], 
                'second_options' => [
                    'label' => 'Confirmer mot de passe',
                    'attr' => [
                        'placeholder' => 'Saisir votre confirmation de mot de passe'
                    ],
                ] 
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'S\'inscrire'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
