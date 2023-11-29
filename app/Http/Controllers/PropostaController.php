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
        // var_dump($_SESSION['proposta']);
        $usuario = DB::select("SELECT cd_usuario FROM tb_usuario WHERE nm_nome_completo = '" . $_SESSION['proposta']['nomeResponsavel'] . "'");
        $referenciaAcl = $_SESSION['proposta']['valorReferenciaProposta']."-". $_SESSION['proposta']['valorNumeroProposta'];
        $id = $usuario[0]->cd_usuario;
        $filial = $_SESSION['proposta']['filialACL'];
        $filial = explode('-', $filial);
        $nomeFilial = $filial[0];
        $cnpjFilial = $filial[1];



        $idProposta = DB::table('tb_proposta')->insertGetId(['dt_proposta' => $_SESSION['proposta']['valorDataProposta'],'nm_referencia_acl' => $referenciaAcl, 'nm_referencia_cliente' => $_SESSION['proposta']['valorReferenciaCliente'], 'nm_versao_proposta' => $_SESSION['proposta']['valorVersaoProposta'], 'dt_horario_recebimento' => $_SESSION['proposta']['valorHorarioRecebimento'], 'ds_metodo_transporte' => $_SESSION['proposta']['valorTipoFrete'], 'ds_status_proposta' => 'Não-Enviada', 'ds_tipo_assinatura' => 'Não-Selecionada', 'cd_usuario' => $id]);

        $idProduto = DB::table('tb_produto')->insertGetId(['nm_produto' => $_SESSION['proposta']['valorNomeProduto'], 'qt_produto' => $_SESSION['proposta']['valorPallets'], 'qt_peso_produto' => $_SESSION['proposta']['valorPeso'], 'cd_proposta' => $idProposta]);

        $idFilial = DB::table('tb_filial')->insertGetId(['nm_filial' => $nomeFilial, 'cd_cnpj' => $cnpjFilial]);

        $idCliente = DB::table('tb_cliente')->insertGetId(['nm_empresa_cliente' => $_SESSION['proposta']['valorNomeCliente'], 'cd_proposta' => $idProposta]);

        $idResponsavelCliente = DB::table('tb_responsavel_cliente')->insertGetId(['nm_responsavel_cliente' => $_SESSION['proposta']['valorNomeContatoCliente'], 'cd_cliente' => $idCliente]);

        $idEmailResponsavelCliente = DB::table('tb_email_responsavel_cliente')->insertGetId(['nm_email_responsavel_cliente' => $_SESSION['proposta']['valorEmailContatoCliente'], 'cd_responsavel_cliente' => $idResponsavelCliente]);

        $idRota = DB::table('tb_rota')->insertGetId(['nm_cidade_origem_rota' => $_SESSION['proposta']['valorCidadeOrigem'], 'sg_uf_origem_rota' => $_SESSION['proposta']['valorEstadoOrigem'], 'nm_cidade_destino_rota' => $_SESSION['proposta']['valorCidadeDestino'], 'sg_uf_destino_rota' => $_SESSION['proposta']['valorEstadoDestino'], 'cd_proposta' => $idProposta]);

        $idVeiculo = DB::table('tb_veiculo')->insertGetId((['nm_veiculo' => $_SESSION['proposta']['valorTipoVeiculo'], 'qt_eixos_veiculo' => $_SESSION['proposta']['valorEixos_cabecalho'], 'ds_carga_veiculo' => $_SESSION['proposta']['valorTipoContainer'], 'cd_proposta' => $idProposta]));

        $idOperacao = "";

        // DB::insert("INSERT INTO tb_produto (nm_produto, qt_produto, qt_peso_produto, cd_proposta) VALUES (?, ?, ?, ?)", [$_SESSION['proposta']['valorNomeProduto'], $_SESSION['proposta']['valorPallets'], $_SESSION['proposta']['valorPeso'], $idProposta]);

        // DB::insert("INSERT INTO tb_filial (nm_filial, cd_cnpj, cd_proposta) VALUES (?, ?, ?)", [$nomeFilial, $cnpjFilial, $idProposta]);

        // DB::insert("INSERT INTO tb_cliente(nm_empresa_cliente, cd_proposta) VALUES (?, ?)", [$_SESSION['proposta']['valorNomeCliente'], $idProposta]);

        // $idCliente = DB::select("SELECT cd_cliente FROM tb_cliente WHERE nm_empresa_cliente = '". $_SESSION['proposta']['valorNomeCliente']."'");

        // DB::insert("INSERT INTO tb_responsavel_cliente (nm_responsavel_cliente, cd_cliente) VALUES (?, ?)", [$_SESSION['proposta']['valorNomeContatoCliente'], $idCliente]);

        // $idResponsavelCliente = DB::select("SELECT cd_responsavel_cliente FROM tb_responsavel_cliente WHERE nm_responsavel_cliente")





        // return redirect()->route('admindex');
    }
}
