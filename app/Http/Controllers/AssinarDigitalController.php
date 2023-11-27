<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AssinarDigitalController extends Controller
{
    function enviarConteudo (Request $request){
        session_start();
        if ($request->envio){
            $valores = $request->all();
            $_SESSION['representante'] = $valores;

            return redirect()->away("http://localhost/Compass/criadorPDF");
            
        }
    }
}
