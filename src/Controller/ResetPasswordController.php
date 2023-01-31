<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\ResetPassword;
use App\Entity\User;
use App\Form\ResetPasswordType;
use DateTime;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class ResetPasswordController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManger) 
    {
        $this->entityManager = $entityManger;
    }

    #[Route('/mot-de-passe-oublie', name: 'app_reset_password')]
    public function index(Request $request): Response
    {
        if($this->getUser()) {
            return $this->redirectToRoute('app_home');
        }

        // injecter Request permet de capturer un input
        if($request->get('email')) {
            // requête qui cherche si le mail existe en BDD
            $user = $this->entityManager->getRepository(User::class)->findOneByEmail($request->get('email'));            
            
            if($user) {
                // enregistrer la demande de reset avec user, token et createdAt
                $reset_password = new ResetPassword();
                $reset_password->setUser($user);
                $reset_password->setToken(uniqid());
                $reset_password->setCreatedAt(new DateTimeImmutable());
                $this->entityManager->persist($reset_password);
                $this->entityManager->flush();

                // génération d'une url avec le token du user
                $url = $this->generateUrl('app_update_password', [
                    'token' => $reset_password->getToken()
                ]);

                // envoyer un email pour mettre à jour le mot de passe
                $mail = new Mail();
                $content = 
                "Bonjour ".$user->getFirstname()." ".$user->getLastname().", </br></br>
                Vous avez demandé à réinitialiser votre mot de passe sur La Boutique Française. </br>
                Merci de bien vouloir cliquer sur le lien suivant pour <a href='".$url."'>mettre à jour votre nouveau mot de passe</a>.";
                $mail->send($user->getEmail(), $user->getFirstname().' '.$user->getLastname(), 'La Boutique Française - Réinitialiser votre mot de passe', $content);

                $this->addFlash('notice', 'Vous aller recevoir un mail pour réinitialiser votre mot de passe'); 
            } else {
                $this->addFlash('notice', 'Cette adresse email est inconnu.'); 
            }
        }

        return $this->render('reset_password/index.html.twig');
    }
    
    #[Route('/modifier-mon-mot-de-passe/{token}', name: 'app_update_password')]
    public function update(Request $request, $token, UserPasswordHasherInterface $passwordHasher): Response
    {
        $reset_password = $this->entityManager->getRepository(ResetPassword::class)->findOneByToken($token);
        
        if(!$reset_password) {
            return $this->redirectToRoute('app_reset_password');
        }
        
        // vérifier si le createdAt = now - 2h
        $now = new DateTime();
        if($now > $reset_password->getCreatedAt()->modify('+ 2 hour')) {
            // token expiré
            $this->addFlash('notice', 'Votre demande de réinitialisation de mot de passe a expirée. Merci de la renouveller.');
            return $this->redirectToRoute('app_reset_password');
        }
        
        // token toujours valable
        // rendre une vue  avec mot de passe
        $form = $this->createForm(ResetPasswordType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $new_pwd = $form->get('new_password')->getData();
            
            // encodage du mot de passe
            $password = $passwordHasher->hashPassword($reset_password->getUser(), $new_pwd);
            $reset_password->getUser()->setPassword($password);

            // flush en bdd
            $this->entityManager->flush();

            // redirection vers la page de connexion
            $this->addFlash('notice', 'Votre mot de passe a bien été mis à jour!');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('reset_password/update.html.twig', [
            'form' => $form->createView()
        ]);
        
    }
}
