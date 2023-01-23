<?php

namespace App\Controller;

use App\Classe\Search;
use App\Entity\Product;
use App\Form\SearchType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityMananger)
    {
        $this->entityManager = $entityMananger;
    }
    
    // render all products
    #[Route('/nos-produits', name: 'app_products')]
    public function index(Request $request): Response
    {
        // render form filtre
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);

        // Traiter la requête de filtre
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            // call une requête dans le repository selon conditions du filtre demandées
            $products = $this->entityManager->getRepository(Product::class)->findWithSearch($search);
        } else {
            // avec doctrine on demande de chercher dans le repository toutes les produits
            $products = $this->entityManager->getRepository(Product::class)->findAll();
        }

        return $this->render('product/index.html.twig', [
            'products' => $products,
            'form' => $form->createView()
        ]);
    }
    
    // render one product
    #[Route('/produit/{slug}', name: 'app_product')]
    public function show($slug): Response
    {
        
        // avec doctrine on demande de chercher dans le repository un produit selon slug
        $product = $this->entityManager->getRepository(Product::class)->findOneBySlug($slug);

        // redirection
        if(!$product) {
            return $this->redirectToRoute('app_products');
        }

        return $this->render('product/show.html.twig', [
            'product' => $product
        ]);
    }
}
