<?php

namespace App\Controller;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderValidateController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/commande/merci/{stripeSessionId}', name: 'app_order_validate')]
    public function index($stripeSessionId): Response
    {
        $order = $this->entityManager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);

        // dd($order);

        // redirection si problème
        if(!$order || $order->getUser() != $this->getUser()) {
            return $this->redirectToRoute('app_home');
        }
        
        if(!$order->getIsPaid()) {
            // modifier status isPaid = 1
            $order->setIsPaid(1);
            $this->entityManager->flush();

            // envoyer un email pour confirmer sa commande
        }

        // afficher les informations de la commande de l'utilisateur


        return $this->render('order_validate/index.html.twig', [
            'order' => $order
        ]);
    }
}
