<?php

namespace App\Classe;

use Symfony\Component\HttpFoundation\Session\SessionInterface;

// Permettre de stocker les produits dans la session
class Cart
{
    private $session;

    // construct une session
    public function __construct(SessionInterface $session)
    {
        $this->session = $session;
    }

    // ajouter id au panier
    public function add($id)
    {
        // cherche la session cart
        $cart = $this->session->get('cart', []);

        if(!empty($cart[$id])) {
            $cart[$id]++;
        } else {
            $cart[$id] = 1;
        }

        $this->session->set('cart', $cart);
    }

    // récupérer le panier de la session
    public function get()
    {
        return $this->session->get('cart');
    }

    // supprimer le panier de la session
    public function remove()
    {
        return $this->session->remove('cart');
    }
}