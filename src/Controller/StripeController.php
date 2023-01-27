<?php

namespace App\Controller;

use App\Classe\Cart;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StripeController extends AbstractController
{
    #[Route('/commande/create-session', name: 'app_stripe_create_session')]
    public function index(Cart $cart)
    {
        $products_for_stripe = [];
        $YOUR_DOMAIN = 'http://127.0.0.1:80';

        // récupérer les produits OrderDetails()
        // itérer pour le paiement
        foreach($cart->getFull() as $product) {
            $products_for_stripe[] = [
                'price_data' => [
                    'currency' => 'EUR',
                    'unit_amount' => $product['product']->getPrice(),
                    'product_data' => [
                        'name' => $product['product']->getName(),
                        'images' => [$YOUR_DOMAIN."/assets/images/".$product['product']->getIllustration()],
                    ]
                ],
                'quantity' => $product['quantity'],
            ];
        }

        // API STRIPE
        $stripeSecretKey = 'sk_test_51MUXUUJqdSb49JUaaB5JPWokX4rJc53jpJjzBBrLwJacMN1YbMG7dTM3KqbcPV3OgiWiVuU2Q7KS4gDyt6VIWqjP00s6gXjr3v';
            
        Stripe::setApiKey($stripeSecretKey);
        
        $checkout_session = Session::create([
            'line_items' => [
                $products_for_stripe
            ],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/success.html',
            'cancel_url' => $YOUR_DOMAIN . '/cancel.html',
        ]);

        $url_strip = $checkout_session->url;

        return $this->redirect($url_strip);
    }
}
