<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\PropostaController;

class AssinarDigitalController extends Controller
{
    function enviarConteudo (Request $request){
        @session_start();
        // if ($request->envio){
        //     $valores = $request->all();
        //     $_SESSION['representante'] = $valores;

        //     return redirect()->away("http://localhost/Compass/criadorPDF");
        // }
        // var_dump($_SESSION['proposta']);
        if ($_SESSION['proposta']['nomeResponsavel'] == $request->nomeRepresentante && $_SESSION['proposta']['emailResponsavel'] == $request->emailRepresentante && $_SESSION['proposta']['CPFResponsavel'] == $request->docRepresentante)
        {
            $_SESSION['representante'] = $request->all();
            return redirect()->route('atualizarAssinatura');
        }
        else
        {
            $_SESSION['ErroAssinaturaDigitalACL'] = "Dados inseridos não batem com dados do usuário.";
            return redirect()->route('assdigital');
        }
        // var_dump($request->all());
        // var_dump($_SESSION['idProposta']);
    }
    function pegarValorAssinante(Request $request){
        @session_start();
        // if ($request->envio){
            // $valores = $request->all();
            $_SESSION['dadosAssinante'] = $request->all();
            // var_dump($_SESSION['dadosAssinante']);
            $sessao = json_decode($_SESSION['propostaAssinatura']);
            // return redirect()->route('atualizarAssinaturaCliente');
        // }

        if ($_SESSION['dadosAssinante']['token'] == $sessao->cabecalho[0]->cd_token_cliente && $_SESSION['dadosAssinante']['nomeAssinante'] ==  $sessao->cabecalho[0]->nm_responsavel_cliente && $_SESSION['dadosAssinante']['emailAssinante'] == $sessao->cabecalho[0]->nm_email_responsavel_cliente)
        {
            // echo('emtro');
            $_SESSION['assinandoCliente'] = true;
            // var_dump($_SESSION['dadosAssinante']);
            echo("<object data='http://localhost/Compass/criadorPDF' type='application/pdf'></object>");
            return redirect()->route('atualizarAssinaturaCliente');
        }
        else
        {
            // echo('nn emtro');

            $_SESSION['ErroAssinaturaCliente'] = "Informações preenchidas incorretamente";
            return redirect()->route('assinatura');
        }
    }
}
