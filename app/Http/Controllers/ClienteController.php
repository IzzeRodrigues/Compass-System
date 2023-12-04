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

    function pegarCliente(Request $request)
    {
        $idCliente = $request->ID;
        $cliente = DB::table('tb_cliente')
        ->join('tb_responsavel_cliente', 'tb_cliente.cd_cliente', 'tb_responsavel_cliente.cd_cliente')
        ->join('tb_email_responsavel_cliente', 'tb_responsavel_cliente.cd_responsavel_cliente', 'tb_email_responsavel_cliente.cd_responsavel_cliente')
        ->where('tb_cliente.cd_cliente', $idCliente)
        ->get();

        return ["Cliente" => $cliente];
    }

    function pegarContato(Request $request)
    {
        $empresa = $request->Empresa;
        $cliente = DB::table('tb_cliente')->where('tb_cliente.nm_empresa_cliente', $empresa)->get();
        // var_dump($cliente);
        $cliente = $cliente[0]->cd_cliente;
        $contato = DB::table('tb_responsavel_cliente')
        ->join('tb_email_responsavel_cliente', 'tb_responsavel_cliente.cd_responsavel_cliente', 'tb_email_responsavel_cliente.cd_responsavel_cliente')
        ->where('tb_responsavel_cliente.cd_cliente', $cliente)
        ->get();
        return ["Contatos" => $contato];
    }

    function pegarEmail(Request $request)
    {
        $responsavel = $request->Responsavel;
        $empresa = $request->Empresa;
        $cliente = DB::table('tb_cliente')->where('tb_cliente.nm_empresa_cliente', $empresa)->get();
        $cliente = $cliente[0]->cd_cliente;
        $email = DB::table('tb_email_responsavel_cliente')
        ->join('tb_responsavel_cliente', 'tb_email_responsavel_cliente.cd_responsavel_cliente', 'tb_responsavel_cliente.cd_responsavel_cliente')
        ->where('tb_responsavel_cliente.nm_responsavel_cliente', $responsavel)
        ->where('tb_responsavel_cliente.cd_cliente', $cliente)
        ->get();
        return ["Emails" => $email];
    }

    function deletarCliente()
    {

    }
}
