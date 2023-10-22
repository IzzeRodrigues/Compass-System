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
    public function addfuncionario(){
        return view('addfuncionario');
    }
    public function addcliente(){
        return view('addcliente');
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
    public function gerfuncionario(){
        return view('gerfuncionario');
    }
    public function gercliente(){
        return view('gercliente');
    }
}
