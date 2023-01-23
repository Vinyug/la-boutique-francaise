<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class RegisterController extends AbstractController
{
    private $entityManager;

    // constructeur doctrine. La variable est la norme d'appelation symfony
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/inscription', name: 'app_register')]
    public function index(Request $request, UserPasswordHasherInterface $passwordHasher): Response
    {

        // instancier un User
        $user = new User();
        // création d'un form
        $form = $this->createForm(RegisterType::class, $user);

        // enregistrer les valeurs saisies en bdd
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            // récupère les datas des inputs
            $user = $form->getData();
            // dd() est un var_dump and die
            // dd($user);
            
            // Hasher password
            $password = $passwordHasher->hashPassword($user, $user->getPassword());
            $user->setPassword($password);

            // figer les datas (pour une création)
            $this->entityManager->persist($user);
            // execute et transmet en bdd
            $this->entityManager->flush();
        }

        return $this->render('register/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
