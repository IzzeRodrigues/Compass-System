<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Mpdf\Mpdf as PDF;
use illuminate\support\facades\Storage;

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
            // return redirect()->route('testePDF', $variaveis);
            return redirect()->away("http://google.com");
        }
    }
}
