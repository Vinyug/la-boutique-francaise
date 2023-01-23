<?php

namespace App\Classe;

use App\Entity\Category;

// Creation de cette class sans CLI puisque qu'il n'y a pas de relation avec une entity
class Search
{
    /**
     * @var string
     */
    public $string = '';
    
    /**
     * @var Category[]
     */
    public $categories = [];

}