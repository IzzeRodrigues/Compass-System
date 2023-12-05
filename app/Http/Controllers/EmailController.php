<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmailController extends Controller
{
    function EnviarEmail()
    {
        require '../vendor/autoload.php';
        @session_start();
        $sessao = $_SESSION['infos'];
        $id = $sessao['ID'];

        $link = "http://localhost:8000/pegarPropostaAssinatura?ID=$id";
        $token = $sessao['Token'];

        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("compassalgoritimo@gmail.com", "Algoritmo - Compass");
        $email->setSubject("PROPOSTA RECEBIDA!");
        $email->addTo($sessao['Email'], $sessao['Nome']);
        $email->addContent(
            "text/html",
            " Olá! Você recebeu uma proposta da ACL Cargo. Para realizar a assinatura, Acesse o link $link e insira o token a seguir: $token."
        );
        $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
        try {
            $response = $sendgrid->send($email);
            print $response->statusCode() . "\n";
            // print_r($response->headers());
            // print $response->body() . "\n";
            if ($response->statusCode() == 202)
            {
                unset($_SESSION['proposta']);
                $_SESSION['AvisoEnvioEmail'] = "Proposta enviada ao cliente.";
                // var_dump($_SESSION['AvisoEnvioEmail']);
                return redirect()->route('gerproposta');
            }
            else
            {
                $_SESSION['AvisoEnvioEmail'] = "Ocorreu um erro na tentativa de envio. Tente novamente.";
                // var_dump($_SESSION['AvisoEnvioEmail']);
                return redirect()->route('gerproposta');
            }
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
        $neg = $dados[3];

        require '../vendor/autoload.php';

        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("compassalgoritimo@gmail.com", "Algoritmo - Compass");
        $email->setSubject("ERRO NA PROPOSTA: O cliente $nome_cliente verificou um erro na proposta $neg.");
        $email->addTo('isa.prates@booat.com.br', 'isa');
        $email->addContent(
            "text/html",
            "O cliente $nome_cliente, apontou um erro na proposta de seguinte referência: $neg, negociada em conjunto com $ref. Verifique as inconsistências na proposta, e reenvie para assinar. Erro enviado: $Erro."
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
    function enviaPronto(){
        require '../vendor/autoload.php';    

        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("compassalgoritimo@gmail.com", "Algoritmo - Compass");
        $email->setSubject("PROPOSTA ASSINADA COM SUCESSO!");
        $email->addTo($sessao['Email'], $sessao['Nome']);
        $email->addContent(
            "text/html",
            " Olá! Você assinou uma proposta da ACL Cargo. veja seu documento assinado aqui:"
        );
        $fileContent = file_get_contents('./criadorPDF/file.pdf');
        $attachment = new \SendGrid\Mail\Attachment();
        $attachment->setContent(base64_encode($fileContent));
        $attachment->setType("application/pdf");
        $attachment->setFilename("nome-do-arquivo.pdf");
        $attachment->setDisposition("attachment");
        $email->addAttachment($attachment);

        $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
        try {
            $response = $sendgrid->send($email);
            print $response->statusCode() . "\n";
            if ($response->statusCode() == 202)
            {
                unset($_SESSION['proposta']);
                $_SESSION['AvisoEnvioEmail'] = "Proposta enviada ao cliente.";
                // var_dump($_SESSION['AvisoEnvioEmail']);
                return redirect()->route('gerproposta');
            }
            else
            {
                $_SESSION['AvisoEnvioEmail'] = "Ocorreu um erro na tentativa de envio. Tente novamente.";
                // var_dump($_SESSION['AvisoEnvioEmail']);
                return redirect()->route('gerproposta');
            }
        } catch (Exception $e) {
            echo 'Caught exception: ' . $e->getMessage() . "\n";
        }
    }
}
