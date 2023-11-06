<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PropostaController extends Controller
{
    function escolherAcao(Request $request)
    {
        if($request->botaoSalvar)
        {

        }
        if($request->botaoGerarPDF)
        {
            $variaveis = $request->all();
            return redirect()->route('gerarPDF', $variaveis);
        }
    }

    function gerarPDF(Request $request)
    {
        var_dump($request->all());
    }
}
