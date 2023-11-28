<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmailController extends Controller
{
    function EnviarEmail()
    {
        require '../vendor/autoload.php';
        session_start();
        $sessao = $_SESSION['infos'];

        $link = 'link.com.br';
        $token = '123456';

        var_dump($sessao);

        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("compassalgoritimo@gmail.com", "Algoritmo - Compass");
        $email->setSubject("PROPOSTA RECEBIDA!");
        $email->addTo($sessao[0], $sessao[1]);
        $email->addContent(
            "text/html",
            " Olá! Você recebeu uma proposta da ACL Cargo. Para realizar a assinatura, Acesse o link $link e insira o token a seguir: $token."
        );
        $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
        try {
            $response = $sendgrid->send($email);
            print $response->statusCode() . "\n";
            print_r($response->headers());
            print $response->body() . "\n";
        } catch (Exception $e) {
            echo 'Caught exception: ' . $e->getMessage() . "\n";
        }
    }

    function enviarErro()
    {
        session_start();
        $dados = $_SESSION['dados'];
        $Erro = $_GET['Erro'];

        $nome_cliente = $dados[0];
        $email_criador = $dados[1];
        $ref = $dados[2];

        require '../vendor/autoload.php';

        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("compassalgoritimo@gmail.com", "Algoritmo - Compass");
        $email->setSubject("ERRO NA PROPOSTA: O cliente $nome_cliente verificou um erro na proposta $ref.");
        $email->addTo('isa.prates@booat.com.br', 'isa');
        $email->addContent(
            "text/html",
            "O cliente $nome_cliente, apontou um erro na proposta com a seguinte referência: $ref. Verifique as inconsistências na proposta, e reenvie para assinar. Erro enviado: $Erro."
        );

        $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
        try {
            $response = $sendgrid->send($email);
            print $response->statusCode() . "\n";
            print_r($response->headers());
            print $response->body() . "\n";
        } catch (Exception $e) {
            echo 'Caught exception: ' . $e->getMessage() . "\n";
        }

    }
}
