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

        $_SESSION['representante'] = $request->all();
        return redirect()->route('atualizarAssinatura');
    }
    function pegarValorAssinante(Request $request){
        session_start();
        if ($request->envio){
            $valores = $request->all();
            $_SESSION['dadosAssinante'] = $valores;

            return redirect()->away("http://localhost/Compass/criadorPDF");
        }
    }
}
