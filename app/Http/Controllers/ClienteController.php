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
            ClienteController::criarCliente($request);
        }
    }
    function criarCliente(Request $request)
    {
        $idClienteConsulta = DB::table('tb_cliente')->insertGetId(['nm_empresa_cliente' => $_SESSION['cliente']['nomeEmpresa'], 'ds_tipo_cliente' => $_SESSION['cliente']['tipoEmpresa']]);

        $idResponsavelClienteConsulta = DB::table('tb_responsavel_cliente')->insertGetId(['nm_responsavel_cliente' => $_SESSION['cliente']['nomeResponsavelEmpresa'], 'nr_telefone_responsavel_cliente' => $_SESSION['cliente']['contatoResponsavelEmpresa'], 'cd_cliente' => $idClienteConsulta]);

        $idEmailResponsavelClienteConsulta = DB::table('tb_email_responsavel_cliente')->insertGetId(['nm_email_responsavel_cliente' => $_SESSION['cliente']['emailResponsavelEmpresa'], 'cd_responsavel_cliente' => $idResponsavelClienteConsulta]);

        echo("<script>window.location.href = 'http://localhost:8000/gercliente'</script>");
    }

    function pegarCliente()
    {
        $cliente = DB::table('tb_cliente')
        ->join('tb_responsavel_cliente', 'tb_cliente.cd_cliente', 'tb_responsavel_cliente.cd_cliente')
        ->join('tb_email_responsavel_cliente', 'tb_responsavel_cliente.cd_responsavel_cliente', 'tb_email_responsavel_cliente.cd_responsavel_cliente')
        ->get();

        return ["Cliente" => $cliente];
    }

    function deletarCliente()
    {

    }
}
