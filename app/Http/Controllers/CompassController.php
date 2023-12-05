<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CompassController extends Controller
{
    public function login(){
        return view('login');
    }
    public function admindex(){
        return view('admindex');
    }
    public function comercial(){
        return view('comercial');
    }
    public function addproposta(){
        return view('addproposta');
    }
    public function gerproposta(){
        return view('gerproposta');
    }
    public function verproposta(){
        return view('verproposta');
    }
    public function addfuncionario(){
        return view('addfuncionario');
    }
    public function gerfuncionario(){
        return view('gerfuncionario');
    }
    public function verfuncionario(){
        return view('verfuncionario');
    }
    public function addcliente(){
        return view('addcliente');
    }
    public function gercliente(){
        return view('gercliente');
    }
    public function impostos(){
        return view('impostos');
    }
    public function vercliente(){
        return view('vercliente');
    }
    public function forgotpass(){
        return view('forgotpass');
    }
    public function admconfig(){
        return view('admconfig');
    }
    public function comconfig(){
        return view('comconfig');
    }

    public function testePDF(){
        return view('criadorPDF');
    }

    public function telabase(){
        return view('telabase');
    }
    public function assdigital(){
        return view('assdigital');
    }
    public function assinatura(){
        return view('assinatura');
    }

    public function statusEnvio(){
        return view('telaFinal');
    }
}
