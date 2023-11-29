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

        $idVeiculo = DB::table('tb_veiculo')->insertGetId(['nm_veiculo' => $_SESSION['proposta']['valorTipoVeiculo'], 'qt_eixos_veiculo' => $_SESSION['proposta']['valorEixos_cabecalho'], 'ds_carga_veiculo' => $_SESSION['proposta']['valorTipoContainer'], 'cd_proposta' => $idProposta]);

        $idOperacao = DB::table('tb_operacao')->insertGetId(['nm_tipo_operacao' => $_SESSION['proposta']['tipoOperacao'], 'nm_tipo_imposto_operacao' => $_SESSION['proposta']['tipoImpostos'],'vl_frete_peso_operacao' => $_SESSION['proposta']['valorFretePeso_operacao'], 'vl_subtotal_operacao' => $_SESSION['proposta']['subTotal'], 'pc_total_prest_operacao' => $_SESSION['proposta']['porcentagemTotalPrest'], 'vl_total_prest_operacao' => $_SESSION['proposta']['valorTotalPrest'], 'vl_despesas_operacao' => $_SESSION['proposta']['valorDespesas_operacao'], 'pc_lucro_bruto_operacao' => $_SESSION['proposta']['porcentagemLucroBruto'], 'vl_lucro_bruto_operacao' => $_SESSION['proposta']['valorLucroBruto'], 'vl_margem_operacao' => $_SESSION['proposta']['valorMargemLucroBruto'], 'cd_proposta' => $idProposta]);

        $idImpostoOperacao = DB::table('tb_imp_operacao')->insertGetId(['pc_imp_susp_imp_operacao' => $_SESSION['proposta']['porcentagemSusp'], 'vl_imp_susp_imp_operacao' => $_SESSION['proposta']['valorImpostoSuspenso'],'vl_total_imposto_seguro_operacao' => $_SESSION['proposta']['valorTotalImpostoSeguro'], 'pc_rctrc_imp_operacao' => $_SESSION['proposta']['porcentagemRCTRC_operacao'], 'vl_rctrc_imp_operacao' => $_SESSION['proposta']['valorRCTRC_operacao'], 'pc_rcfdc_imp_operacao' => $_SESSION['proposta']['porcentagemRCFDC_operacao'], 'vl_rcfdc_imp_operacao' => $_SESSION['proposta']['valorRCFDC_operacao'], 'ds_tipo_gris_imp_operacao' => $_SESSION['proposta']['valorCheckGRIS'], 'pc_gris_imp_operacao' => $_SESSION['proposta']['porcentagemGRIS'], 'vl_gris_imp_operacao' => $_SESSION['proposta']['valorGRIS'], 'vl_valor_icms_operacao' => $_SESSION['proposta']['valorICMS_operacao'], 'pc_icms_operacao' => $_SESSION['proposta']['porcentagemICMS_operacao'], 'cd_operacao' => $idOperacao]);

        $idAdicionaisOperacao = DB::table('tb_adic_operacao')->insertGetId(['vl_estacionamento' => $_SESSION['proposta']['valorEstacionamento_operacao'], 'vl_imo' => $_SESSION['proposta']['valorIMO'], 'vl_dta' => $_SESSION['proposta']['valorDTA_GVB'], 'vl_ajudantes' => $_SESSION['proposta']['valorAjudantes_operacao'], 'vl_pedagio' => $_SESSION['proposta']['valorPedagio_operacao'], 'cd_operacao' => $idOperacao]);

        $idDespesa = DB::table('tb_despesas')->insertGetId(['vl_motorista_despesas' => $_SESSION['proposta']['valorMotoristaAutonomo'], 'vl_pedagio_despesas' => $_SESSION['proposta']['valorPedagio_despesa'], 'vl_profit_despesas' => $_SESSION['proposta']['valorProfit'], 'vl_comissao_despesas' => $_SESSION['proposta']['valorComissao'], 'pc_comissao_despesas' => $_SESSION['proposta']['porcentagemComissao'], 'vl_despesas' => $_SESSION['proposta']['valorDespesas_despesa'], 'cd_proposta' => $idProposta]);

        $idImpostoDespesa = DB::table('tb_imp_despesas')->insertGetId(['pc_rcfdc_imp_despesas' => $_SESSION['proposta']['porcentagemRCFDC_despesa'], 'vl_rcfdc_imp_despesas' => $_SESSION['proposta']['valorRCFDC_despesa'], 'pc_rctrc_imp_despesas' => $_SESSION['proposta']['porcentagemRCTRC_despesa'], 'vl_rctrc_imp_despesas' => $_SESSION['proposta']['valorRCTRC_despesa'], 'pc_simples_nac_imp_despesas' => $_SESSION['proposta']['porcentagemSimplesNAC'], 'vl_simples_nac_imp_despesas' => $_SESSION['proposta']['valorSimplesNAC'], 'pc_irpj_imp_despesas' => $_SESSION['proposta']['porcentagemIRPJ'], 'vl_irpj_imp_despesas' => $_SESSION['proposta']['valorIRPJ'], 'pc_adic_irpj_imp_despesas' => $_SESSION['proposta']['porcentagemAdicionalIRPJ'], 'vl_adic_irpj_imp_despesas' => $_SESSION['proposta']['valorAdicionalIRPJ'], 'pc_pis_imp_despesas' => $_SESSION['proposta']['porcentagemPIS'], 'vl_pis_imp_despesas' => $_SESSION['proposta']['valorPIS'], 'pc_cofins_imp_despesas' => $_SESSION['proposta']['porcentagemCOFINS'], 'vl_cofins_imp_despesas' => $_SESSION['proposta']['valorCOFINS'], 'vl_icms_despesas' => $_SESSION['proposta']['valorICMS_despesa'], 'pc_icms_despesas' => $_SESSION['proposta']['porcentagemICMS_despesa'], 'cd_despesas' => $idDespesa]);

        $idAdicionaisDespesa = DB::table('tb_adic_despesas')->insertGetId(['vl_buonny_despesas' => $_SESSION['proposta']['valorBuonnyCadastro'], 'vl_gris_rastreamento_despesas' => $_SESSION['proposta']['valorGRISRastreamento'], 'vl_dta_terc_despesas' => $_SESSION['proposta']['valorDTA_DI'], 'vl_estacionamento_despesas' => $_SESSION['proposta']['valorEstacionamento_despesa'], 'vl_ajudantes_despesas' => $_SESSION['proposta']['valorAjudantes_despesa'], 'cd_despesas' => $idDespesa]);

        $idCarga = DB::table('tb_carga')->insertGetId(['nm_tipo_carga' => $_SESSION['proposta']['valorTipoCarga'], 'vl_despesa_viagem_carga' => $_SESSION['proposta']['valorTotalDespesaViagem'], 'cd_proposta' => $idProposta]);

        $idQuilometragemCarga = DB::table('tb_km_rota_carga')->insertGetId(['qtd_ida_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemIda'], 'qtd_volta_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemVolta'], 'qtd_total_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemTotal'], 'cd_carga' => $idCarga]);

        $idPedagioCarga = DB::table('tb_pedagio_rota_carga')->insertGetId(['qtd_eixos_pedagio_rota_carga' => $_SESSION['proposta']['valorEixos_carga'], 'vl_ida_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagioEixoIda'], 'vl_volta_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagioEixoVolta'], 'vl_total_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagio_carga'], 'cd_carga' => $idCarga]);

        $idValorCarga = DB::table('tb_valor_carga')->insertGetId(['vl_preco_carga' => $_SESSION['proposta']['valorCargaUSD_EUR'], 'nm_tipo_moeda_valor_carga' => $_SESSION['proposta']['tipoMoedaEstrangeira'], 'vl_cotacao_valor_carga' => $_SESSION['proposta']['valorMoedaEstrangeira'], 'vl_brl_valor_carga' => $_SESSION['proposta']['valorCargaBRL'], 'cd_carga' => $idCarga]);

        $idFretePeso = DB::table('tb_frete_peso')->insertGetId(['vl_frete_peso' => $_SESSION['proposta']['valorFretePeso_fretePeso'], 'pc_frete_peso' => $_SESSION['proposta']['porcentagemPercentualFretePeso'], 'cd_proposta' => $idProposta]);

        $idMotorista = DB::table('tb_motorista')->insertGetId(['vl_motorista' => $_SESSION['proposta']['valorValores'], 'vl_frete_conf_antt_motorista' => $_SESSION['proposta']['valorFreteANTT'], 'vl_pedagio_tab_motorista' => $_SESSION['proposta']['valorPedagio_motorista'], 'vl_total_aut_tab_motorista' => $_SESSION['proposta']['valorTotalAutonomo'], 'vl_lucro_total_aut_tab_motorista' => $_SESSION['proposta']['valorLucroTotalAutonomo'], 'vl_frete_all_in_fechado_motorista' => $_SESSION['proposta']['valorFreteAllFechado'], 'vl_lucro_frete_all_in_fechado_motorista' => $_SESSION['proposta']['valorLucroFreteAllFechado'], 'vl_tentar_fechar_motorista' => $_SESSION['proposta']['valorFreteFecharEm'], 'vl_lucro_tentar_fechar_motorista' => $_SESSION['proposta']['valorLucroFreteFecharEm'], 'cd_proposta' => $idProposta]);

        $idCotacaoAutonomo = DB::table('tb_cot_aut')->insertGetId(['nm_cot_aut' => $_SESSION['proposta']['motoristaCotado1'], 'vl_cot_aut' => $_SESSION['proposta']['valorMotoristaCotado1'], 'dt_cot_aut' => $_SESSION['proposta']['dataCotacaoMotorista1'], 'cd_proposta' => $idProposta]);

        $idCotacaoAutonomo2 = DB::table('tb_cot_aut')->insertGetId(['nm_cot_aut' => $_SESSION['proposta']['motoristaCotado2'], 'vl_cot_aut' => $_SESSION['proposta']['valorMotoristaCotado2'], 'dt_cot_aut' => $_SESSION['proposta']['dataCotacaoMotorista2'], 'cd_proposta' => $idProposta]);

        $idAdicionaisProposta = DB::table('tb_adicionais')->insertGetId(['id_isca_adicionais' => $_SESSION['proposta']['valorTipoUtilizacaoIsca'], 'vl_isca_adicionais' => $_SESSION['proposta']['valorUtilizacaoIsca'], 'id_monitoramento_isca_adicionais' => $_SESSION['proposta']['valorTipoMonitoramentoIsca'], 'vl_monitoramento_isca_adicionais' => $_SESSION['proposta']['valorMonitoramentoIsca'], 'id_escolta_armada_adicionais' => $_SESSION['proposta']['valorTipoEscoltaArmada'], 'vl_escolta_armada_adicionais' => $_SESSION['proposta']['valorEscoltaArmada'], 'id_adic_carga_imo_adicionais' => $_SESSION['proposta']['valorTipoAdicionalCargaIMO'], 'vl_adic_carga_imo_adicionais' => $_SESSION['proposta']['valorAdicionalCargaIMO'], 'id_carregamento_expr_adicionais' => $_SESSION['proposta']['valorTipoCarregamentoExpresso'], 'vl_carregamento_expr_adicionais' => $_SESSION['proposta']['valorCarregamentoExpresso'], 'id_util_cav_ls_adicionais' => $_SESSION['proposta']['valorTipoUtilizacaoCavaloLS'], 'vl_util_cav_ls_adicionais' => $_SESSION['proposta']['valorUtilizacaoCavaloLS'], 'id_estadia_especial_adicionais' => $_SESSION['proposta']['valorTipoEstadiaEspecial'], 'vl_estadia_especial_adicionais' => $_SESSION['proposta']['valorEstadiaEspecial'], 'id_sobrestadia_carreg_adicionais' => $_SESSION['proposta']['valorTipoSobrestadiaCarregamento'], 'vl_sobrestadia_carreg_adicionais' => $_SESSION['proposta']['valorSobrestadiaCarregamento'], 'cd_proposta' => $idProposta]);
        
        // DB::insert("INSERT INTO tb_produto (nm_produto, qt_produto, qt_peso_produto, cd_proposta) VALUES (?, ?, ?, ?)", [$_SESSION['proposta']['valorNomeProduto'], $_SESSION['proposta']['valorPallets'], $_SESSION['proposta']['valorPeso'], $idProposta]);

        // DB::insert("INSERT INTO tb_filial (nm_filial, cd_cnpj, cd_proposta) VALUES (?, ?, ?)", [$nomeFilial, $cnpjFilial, $idProposta]);

        // DB::insert("INSERT INTO tb_cliente(nm_empresa_cliente, cd_proposta) VALUES (?, ?)", [$_SESSION['proposta']['valorNomeCliente'], $idProposta]);

        // $idCliente = DB::select("SELECT cd_cliente FROM tb_cliente WHERE nm_empresa_cliente = '". $_SESSION['proposta']['valorNomeCliente']."'");

        // DB::insert("INSERT INTO tb_responsavel_cliente (nm_responsavel_cliente, cd_cliente) VALUES (?, ?)", [$_SESSION['proposta']['valorNomeContatoCliente'], $idCliente]);

        // $idResponsavelCliente = DB::select("SELECT cd_responsavel_cliente FROM tb_responsavel_cliente WHERE nm_responsavel_cliente")





        // return redirect()->route('admindex');
    }
}
