<?php

namespace App\Controller;

use App\Classe\Mail;
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
        // notification d'inscription par mail
        $notification = null;

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
            
            // verification si user est déjà existant
            $search_email = $this->entityManager->getRepository(User::class)->findOneByEmail($user->getEmail());

            if(!$search_email) {
                // Hasher password
                $password = $passwordHasher->hashPassword($user, $user->getPassword());
                $user->setPassword($password);

                // figer les datas (pour une création)
                $this->entityManager->persist($user);
                // execute et transmet en bdd
                $this->entityManager->flush();

                // mail de confirmation
                $mail = new Mail();
                $content = "Bonjour".$user->getFirstname()."<br/>Bienvenue sur la première boutique dédiée au made in France.<br/><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum quis ipsum esse quaerat vel facere optio libero aspernatur amet. Provident saepe, explicabo aspernatur exercitationem sit laboriosam magni rerum totam ad.";
                $mail->send($user->getEmail(), $user->getFirstname(), 'Bienvenue sur la Boutique Française', $content);

                $notification = "Votre inscription s'est correctement déroulée. Vous pouvez dès à présent vous connecter à votre compte";
            } else {
                $notification = "L'email que vous avez renseigné existe déjà.";
            }
            

        }

        return $this->render('register/index.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification
        ]);
    }
}
