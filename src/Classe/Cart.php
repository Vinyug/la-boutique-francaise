<?php

namespace App\Classe;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

// Permettre de stocker les produits dans la session
class Cart
{
    private $session;
    private $entityManager;

    // construct une session et doctrine
    public function __construct(SessionInterface $session, EntityManagerInterface $entityManager)
    {
        $this->session = $session;
        $this->entityManager = $entityManager;
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

    // supprimer un élément du panier de la session
    public function delete($id)
    {
        // cherche la session cart
        $cart = $this->session->get('cart', []);
        
        unset($cart[$id]);

        return $this->session->set('cart', $cart);
    }

    // supprimer une unité au panier
    public function decrease($id)
    {
        // cherche la session cart
        $cart = $this->session->get('cart', []);
     
        // Vérifier si la quantité de notre produit = 1
        if($cart[$id] > 1) {
            $cart[$id]--;
        } else {
            unset($cart[$id]);
        }

        $this->session->set('cart', $cart);
    }

    public function getFull() 
    {
        $cartComplete = [];

        // requête pour récupérer les datas product selon produits dans panier
        if($this->get()) {
            foreach($this->get() as $id => $quantity) {
                $product_object = $this->entityManager->getRepository(Product::class)->findOneById($id);
                
                if(!$product_object) {
                    $this->delete($id);
                    continue;
                }

                $cartComplete[] = [
                    'product' => $product_object,
                    'quantity' => $quantity
                ]; 
            }
        }
        return $cartComplete;
    }
}