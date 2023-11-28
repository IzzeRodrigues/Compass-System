<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use \Mpdf\Mpdf as PDF;
use illuminate\support\facades\Storage;
use Illuminate\Support\Facades\DB;


class PropostaController extends Controller
{
    function escolherAcao(Request $request)
    {
        session_start();
        if($request->botaoSalvar)
        {
            $_SESSION['proposta'] = $request->all();
            PropostaController::salvarProposta();
        }
        if($request->botaoAssinarFisicamente)
        {
            $variaveis = $request->all();
            $_SESSION['proposta'] = $variaveis;
            // var_dump($variaveis);
            return redirect()->away("http://localhost/Compass/criadorPDF");
        }
        if($request->botaoAssinarDigitalmente)
        {
            $variaveis = $request -> all();
            $_SESSION['proposta'] = $variaveis;
            return redirect()->route("assdigital");
        }
        session_destroy();
    }

    function salvarProposta()
    {
        var_dump($_SESSION['proposta']);
        // return redirect()->route('admindex');
    }
}
