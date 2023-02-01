<?php

namespace App\Classe;

use Mailjet\Client;
use Mailjet\Resources;

class Mail 
{
    // renseigner la clé api
    private $api_key = "api_key";
    // renseigner la clé api secrete
    private $api_key_secret = "api_key_secret";
    
    public function send($to_email, $to_name, $subject, $content) 
    {
        $mj = new Client($this->api_key, $this->api_key_secret, true,['version' => 'v3.1']);
        $body = [
            'Messages' => [
                [
                    'From' => [
                        // renseigner le mail associé à MailJet
                        'Email' => "mail",
                        'Name' => "La Boutique Française"
                    ],
                    'To' => [
                        [
                            'Email' => $to_email,
                            'Name' => $to_name
                        ]
                    ],
                    'TemplateID' => 4545677,
                    'TemplateLanguage' => true,
                    'Subject' => "$subject",
                    'Variables' => [
                        'content' => $content,
                    ]
                ]
            ]
        ];
        
        $response = $mj->post(Resources::$Email, ['body' => $body]);
        $response->success();
    }
}
