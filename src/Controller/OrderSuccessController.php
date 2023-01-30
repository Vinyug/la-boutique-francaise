<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Classe\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderSuccessController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/commande/merci/{stripeSessionId}', name: 'app_order_validate')]
    public function index(Cart $cart, $stripeSessionId): Response
    {
        // retirer le .html à la variable 
        $stripeSessionId = str_replace('.html', '', $stripeSessionId);

        $order = $this->entityManager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);

        // redirection si problème
        if(!$order || $order->getUser() != $this->getUser()) {
            return $this->redirectToRoute('app_home');
        }
        
        if(!$order->getIsPaid()) {
            // vider la session cart
            $cart->remove();

            // modifier status isPaid = 1
            $order->setIsPaid(1);
            $this->entityManager->flush();

            // envoyer un email pour confirmer sa commande
            $mail = new Mail();
            $content = 
            "Bonjour".$order->getUser()->getFirstname()."<br/>
            Merci pour votre commande.<br/><br/>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum quis ipsum esse quaerat vel facere optio libero aspernatur amet. Provident saepe, explicabo aspernatur exercitationem sit laboriosam magni rerum totam ad.";

            $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), 'Votre commande La Boutique Française est bien validée.', $content);
        }

        // afficher les informations de la commande de l'utilisateur


        return $this->render('order_success/index.html.twig', [
            'order' => $order
        ]);
    }
}
