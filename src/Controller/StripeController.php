<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StripeController extends AbstractController
{
    #[Route('/commande/create-session/{reference}', name: 'app_stripe_create_session')]
    public function index(EntityManagerInterface $entityManager ,Cart $cart, $reference): Response
    {
        $products_for_stripe = [];
        $YOUR_DOMAIN = 'http://domainesymfony.com';

        $order = $entityManager->getRepository(Order::class)->findOneByReference($reference);
        
        // si référence inexistante redirect
        if(!$order) {
            return $this->redirectToRoute('app_order');
        }

        // récupérer les produits OrderDetails()
        // itérer pour le paiement
        foreach($order->getOrderDetails()->getValues() as $product) {
            $product_object = $entityManager->getRepository(Product::class)->findOneByName($product->getProduct());
            $products_for_stripe[] = [
                'price_data' => [
                    'currency' => 'EUR',
                    'unit_amount' => $product->getPrice(),
                    'product_data' => [
                        'name' => $product->getProduct(),
                        'images' => [$YOUR_DOMAIN."/assets/images/".$product_object->getIllustration()],
                    ]
                ],
                'quantity' => $product->getQuantity(),
            ];
        }
        
        // Ajouter les infos carrier
        $products_for_stripe[] = [
            'price_data' => [
                'currency' => 'EUR',
                'unit_amount' => $order->getCarrierPrice() * 100,
                'product_data' => [
                    'name' => $order->getCarrierName(),
                    'images' => [$YOUR_DOMAIN],
                ]
            ],
            'quantity' => 1,
        ];

        // API STRIPE
        $stripeSecretKey = 'sk_test_51MUXUUJqdSb49JUaaB5JPWokX4rJc53jpJjzBBrLwJacMN1YbMG7dTM3KqbcPV3OgiWiVuU2Q7KS4gDyt6VIWqjP00s6gXjr3v';
            
        Stripe::setApiKey($stripeSecretKey);
        
        $checkout_session = Session::create([
            'customer_email' => $this->getUser()->getEmail(), // permet de get l'email user dans l'input du module stripe
            'line_items' => [
                $products_for_stripe
            ],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/commande/merci/{CHECKOUT_SESSION_ID}.html',
            'cancel_url' => $YOUR_DOMAIN . '/commande/erreur/{CHECKOUT_SESSION_ID}.html',
        ]);

        // Injection de l'id du checkout_session dans la commande
        // permet de rediriger vers la page de succes_url si tout s'est bien passé
        $order->setStripeSessionId($checkout_session->id);
        $entityManager->flush();

        $url_strip = $checkout_session->url;
        return $this->redirect($url_strip);
    }
}
