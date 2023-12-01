<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClienteController extends Controller
{
    function acoesCliente(Request $request)
    {
        @session_start();
        $_SESSION['cliente'] = $request->all();
        if ($request->botaoSalvar)
        {
            ClienteController::criarCliente();
        }
    }
    function criarCliente()
    {
        // $idClienteConsulta = DB::table('tb_cliente')->insertGetId(['nm_empresa_cliente' => $_SESSION['cliente']['nomeEmpresa'], 'ds_tipo_cliente' => $_SESSION['cliente']['tipoEmpresa']]);

        // $idResponsavelClienteConsulta = DB::table('tb_responsavel_cliente')->insertGetId(['nm_responsavel_cliente' => $_SESSION['cliente']['nomeResponsavelEmpresa'], 'nr_telefone_responsavel_cliente' => $_SESSION['cliente']['contatoResponsavelEmpresa'], 'cd_cliente' => $idClienteConsulta]);

        // $idEmailResponsavelClienteConsulta = DB::table('tb_email_responsavel_cliente')->insertGetId(['nm_email_responsavel_cliente' => $_SESSION['cliente']['emailResponsavelEmpresa'], 'cd_responsavel_cliente' => $idResponsavelClienteConsulta]);

        return redirect()->route('vercliente');
    }

    function pegarCliente()
    {

    }

    function deletarCliente()
    {

    }
}
