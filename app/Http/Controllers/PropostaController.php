<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use \Mpdf\Mpdf as PDF;
use illuminate\support\facades\Storage;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\EmailController;


class PropostaController extends Controller
{
    function escolherAcao(Request $request)
    {
        @session_start();
        if($request->botaoSalvar || $request->botaoAssinarFisicamente || $request->botaoAssinarDigitalmente)
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
        if($request->botaoAtualizar)
        {
            $variaveis = $request -> all();
            $_SESSION['proposta'] = $variaveis;
            PropostaController::atualizarProposta();
        }
    }

    function pegarCabecalho()
    {
        $proposta = DB::table('tb_proposta')->get();
        return $proposta;
    }

    function salvarProposta()
    {
        // var_dump($_SESSION['proposta']);
        $usuario = DB::select("SELECT cd_usuario FROM tb_usuario WHERE nm_nome_completo = '" . $_SESSION['proposta']['nomeResponsavel'] . "'");
        $referenciaAcl = "ACL " . $_SESSION['proposta']['valorReferenciaProposta']." ". $_SESSION['proposta']['valorNumeroProposta'];
        $id = $usuario[0]->cd_usuario;
        $filial = $_SESSION['proposta']['filialACL'];
        $filial = explode('-', $filial);
        $nomeFilial = $filial[0];
        $cnpjFilial = $filial[1];

        // dd($_SESSION['proposta']);

        if (isset($_SESSION['proposta']['botaoSalvar']))
        {
            $idProposta = DB::table('tb_proposta')->insertGetId(['ds_tipo_proposta' => $_SESSION['proposta']['tipoProposta'],'dt_proposta' => $_SESSION['proposta']['valorDataProposta'],'nm_referencia_acl' => $referenciaAcl, 'nm_referencia_cliente' => $_SESSION['proposta']['valorReferenciaCliente'], 'nm_versao_proposta' => $_SESSION['proposta']['valorVersaoProposta'], 'dt_horario_recebimento' => $_SESSION['proposta']['valorHorarioRecebimento'], 'ds_metodo_transporte' => $_SESSION['proposta']['valorTipoFrete'], 'ds_status_proposta' => 'Salvo', 'ds_tipo_assinatura' => 'Nenhuma', 'cd_usuario' => $id]);
        }
        else
        {
            if (isset($_SESSION['proposta']['botaoAssinarFisicamente']))
            {
                $idProposta = DB::table('tb_proposta')->insertGetId(['ds_tipo_proposta' => $_SESSION['proposta']['tipoProposta'],'dt_proposta' => $_SESSION['proposta']['valorDataProposta'],'nm_referencia_acl' => $referenciaAcl, 'nm_referencia_cliente' => $_SESSION['proposta']['valorReferenciaCliente'], 'nm_versao_proposta' => $_SESSION['proposta']['valorVersaoProposta'], 'dt_horario_recebimento' => $_SESSION['proposta']['valorHorarioRecebimento'], 'ds_metodo_transporte' => $_SESSION['proposta']['valorTipoFrete'], 'ds_status_proposta' => 'Salvo', 'ds_tipo_assinatura' => 'Assinatura Física', 'cd_usuario' => $id]);
            }
            else
            {
                if (isset($_SESSION['proposta']['botaoAssinarDigitalmente']))
                {
                    $idProposta = DB::table('tb_proposta')->insertGetId(['ds_tipo_proposta' => $_SESSION['proposta']['tipoProposta'],'dt_proposta' => $_SESSION['proposta']['valorDataProposta'],'nm_referencia_acl' => $referenciaAcl, 'nm_referencia_cliente' => $_SESSION['proposta']['valorReferenciaCliente'], 'nm_versao_proposta' => $_SESSION['proposta']['valorVersaoProposta'], 'dt_horario_recebimento' => $_SESSION['proposta']['valorHorarioRecebimento'], 'ds_metodo_transporte' => $_SESSION['proposta']['valorTipoFrete'], 'ds_status_proposta' => 'Salvo', 'ds_tipo_assinatura' => 'Assinatura Digital', 'cd_usuario' => $id]);
                }
                else
                {
                    return redirect()->route('addproposta');
                }
            }
        }

        $idProduto = DB::table('tb_produto')->insertGetId(['nm_produto' => $_SESSION['proposta']['valorNomeProduto'], 'qt_produto' => $_SESSION['proposta']['valorPallets'], 'qt_peso_produto' => $_SESSION['proposta']['valorPeso'], 'cd_proposta' => $idProposta]);

        $idFilial = DB::table('tb_filial')->insertGetId(['nm_filial' => $nomeFilial, 'cd_cnpj' => $cnpjFilial, 'cd_proposta' => $idProposta]);

        $idCliente = DB::table('tb_cliente_proposta')->insertGetId(['nm_empresa_cliente' => $_SESSION['proposta']['valorNomeCliente'], 'cd_proposta' => $idProposta]);

        $idResponsavelCliente = DB::table('tb_responsavel_cliente_proposta')->insertGetId(['nm_responsavel_cliente' => $_SESSION['proposta']['valorNomeContatoCliente'], 'cd_cliente' => $idCliente]);

        $idEmailResponsavelCliente = DB::table('tb_email_responsavel_cliente_proposta')->insertGetId(['nm_email_responsavel_cliente' => $_SESSION['proposta']['valorEmailContatoCliente'], 'cd_responsavel_cliente' => $idResponsavelCliente]);

        $idRota = DB::table('tb_rota')->insertGetId(['nm_cidade_origem_rota' => $_SESSION['proposta']['valorCidadeOrigem'], 'sg_uf_origem_rota' => $_SESSION['proposta']['valorEstadoOrigem'], 'nm_cidade_destino_rota' => $_SESSION['proposta']['valorCidadeDestino'], 'sg_uf_destino_rota' => $_SESSION['proposta']['valorEstadoDestino'], 'nm_local_devolucao_container_rota' => $_SESSION['proposta']['valorLocalDevolucao'] , 'cd_proposta' => $idProposta]);

        $idVeiculo = DB::table('tb_veiculo')->insertGetId(['nm_veiculo' => $_SESSION['proposta']['valorTipoVeiculo'], 'qt_eixos_veiculo' => $_SESSION['proposta']['valorEixos_cabecalho'], 'ds_carga_veiculo' => $_SESSION['proposta']['valorTipoContainer'], 'cd_proposta' => $idProposta]);

        $idOperacao = DB::table('tb_operacao')->insertGetId(['nm_tipo_operacao' => $_SESSION['proposta']['tipoOperacao'], 'nm_tipo_imposto_operacao' => $_SESSION['proposta']['tipoImpostos'],'vl_frete_peso_operacao' => $_SESSION['proposta']['valorFretePeso_operacao'], 'vl_subtotal_operacao' => $_SESSION['proposta']['subTotal'], 'pc_total_prest_operacao' => $_SESSION['proposta']['porcentagemTotalPrest'], 'vl_total_prest_operacao' => $_SESSION['proposta']['valorTotalPrest'], 'vl_despesas_operacao' => $_SESSION['proposta']['valorDespesas_operacao'], 'pc_lucro_bruto_operacao' => $_SESSION['proposta']['porcentagemLucroBruto'], 'vl_lucro_bruto_operacao' => $_SESSION['proposta']['valorLucroBruto'], 'vl_margem_operacao' => $_SESSION['proposta']['valorMargemLucroBruto'], 'cd_proposta' => $idProposta]);

        $idMercadoriaOperacao = DB::table('tb_mercadoria_operacao')->insertGetId(['vl_mercadoria_operacao' => $_SESSION['proposta']['valorMercadoria'], 'vl_container_operacao' => $_SESSION['proposta']['container'], 'cd_operacao' => $idOperacao]);

        $idImpostoOperacao = DB::table('tb_imp_operacao')->insertGetId(['pc_imp_susp_imp_operacao' => $_SESSION['proposta']['porcentagemSusp'], 'vl_imp_susp_imp_operacao' => $_SESSION['proposta']['valorImpostoSuspenso'],'vl_total_imposto_seguro_operacao' => $_SESSION['proposta']['valorTotalImpostoSeguro'], 'pc_rctrc_imp_operacao' => $_SESSION['proposta']['porcentagemRCTRC_operacao'], 'vl_rctrc_imp_operacao' => $_SESSION['proposta']['valorRCTRC_operacao'], 'pc_rcfdc_imp_operacao' => $_SESSION['proposta']['porcentagemRCFDC_operacao'], 'vl_rcfdc_imp_operacao' => $_SESSION['proposta']['valorRCFDC_operacao'], 'ds_tipo_gris_imp_operacao' => $_SESSION['proposta']['valorCheckGRIS'], 'pc_gris_imp_operacao' => $_SESSION['proposta']['porcentagemGRIS'], 'vl_gris_imp_operacao' => $_SESSION['proposta']['valorGRIS'], 'vl_valor_icms_operacao' => $_SESSION['proposta']['valorICMS_operacao'], 'pc_icms_operacao' => $_SESSION['proposta']['porcentagemICMS_operacao'], 'cd_operacao' => $idOperacao]);

        $idAdicionaisOperacao = DB::table('tb_adic_operacao')->insertGetId(['vl_estacionamento' => $_SESSION['proposta']['valorEstacionamento_operacao'], 'vl_imo' => $_SESSION['proposta']['valorIMO'], 'vl_dta' => $_SESSION['proposta']['valorDTA_GVB'], 'vl_ajudantes' => $_SESSION['proposta']['valorAjudantes_operacao'], 'vl_pedagio' => $_SESSION['proposta']['valorPedagio_operacao'], 'cd_operacao' => $idOperacao]);

        $idDespesa = DB::table('tb_despesas')->insertGetId(['vl_motorista_despesas' => $_SESSION['proposta']['valorMotoristaAutonomo'], 'vl_pedagio_despesas' => $_SESSION['proposta']['valorPedagio_despesa'], 'vl_profit_despesas' => $_SESSION['proposta']['valorProfit'], 'vl_comissao_despesas' => $_SESSION['proposta']['valorComissao'], 'pc_comissao_despesas' => $_SESSION['proposta']['porcentagemComissao'], 'vl_despesas' => $_SESSION['proposta']['valorDespesas_despesa'], 'cd_proposta' => $idProposta]);

        $idImpostoDespesa = DB::table('tb_imp_despesas')->insertGetId(['pc_rcfdc_imp_despesas' => $_SESSION['proposta']['porcentagemRCFDC_despesa'], 'vl_rcfdc_imp_despesas' => $_SESSION['proposta']['valorRCFDC_despesa'], 'pc_rctrc_imp_despesas' => $_SESSION['proposta']['porcentagemRCTRC_despesa'], 'vl_rctrc_imp_despesas' => $_SESSION['proposta']['valorRCTRC_despesa'], 'pc_simples_nac_imp_despesas' => $_SESSION['proposta']['porcentagemSimplesNAC'], 'vl_simples_nac_imp_despesas' => $_SESSION['proposta']['valorSimplesNAC'], 'pc_irpj_imp_despesas' => $_SESSION['proposta']['porcentagemIRPJ'], 'vl_irpj_imp_despesas' => $_SESSION['proposta']['valorIRPJ'], 'pc_adic_irpj_imp_despesas' => $_SESSION['proposta']['porcentagemAdicionalIRPJ'], 'vl_adic_irpj_imp_despesas' => $_SESSION['proposta']['valorAdicionalIRPJ'], 'pc_pis_imp_despesas' => $_SESSION['proposta']['porcentagemPIS'], 'vl_pis_imp_despesas' => $_SESSION['proposta']['valorPIS'], 'pc_cofins_imp_despesas' => $_SESSION['proposta']['porcentagemCOFINS'], 'vl_cofins_imp_despesas' => $_SESSION['proposta']['valorCOFINS'], 'vl_icms_despesas' => $_SESSION['proposta']['valorICMS_despesa'], 'pc_icms_despesas' => $_SESSION['proposta']['porcentagemICMS_despesa'], 'cd_despesas' => $idDespesa]);

        $idAdicionaisDespesa = DB::table('tb_adic_despesas')->insertGetId(['vl_buonny_despesas' => $_SESSION['proposta']['valorBuonnyCadastro'], 'vl_gris_rastreamento_despesas' => $_SESSION['proposta']['valorGRISRastreamento'], 'vl_dta_terc_despesas' => $_SESSION['proposta']['valorDTA_DI'], 'vl_estacionamento_despesas' => $_SESSION['proposta']['valorEstacionamento_despesa'], 'vl_ajudantes_despesas' => $_SESSION['proposta']['valorAjudantes_despesa'], 'cd_despesas' => $idDespesa]);

        $idCarga = DB::table('tb_carga')->insertGetId(['nm_tipo_carga' => $_SESSION['proposta']['valorTipoCarga'], 'vl_despesa_viagem_carga' => $_SESSION['proposta']['valorTotalDespesaViagem'], 'cd_proposta' => $idProposta]);

        $idQuilometragemCarga = DB::table('tb_km_rota_carga')->insertGetId(['qtd_ida_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemIda'], 'qtd_volta_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemVolta'], 'qtd_total_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemTotal'], 'cd_carga' => $idCarga]);

        $idPedagioCarga = DB::table('tb_pedagio_rota_carga')->insertGetId(['qtd_eixos_pedagio_rota_carga' => $_SESSION['proposta']['valorEixos_carga'], 'vl_ida_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagioEixoIda'], 'vl_volta_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagioEixoVolta'], 'vl_total_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagio_carga'], 'cd_carga' => $idCarga]);

        $idCombustivelCarga = DB::table('tb_combustivel_carga')->insertGetId(['vl_quantidade_combustivel_carga' => $_SESSION['proposta']['valorTotalCombustivelLitros'], 'vl_consumo_combustivel_carga' => $_SESSION['proposta']['valorConsumoMedioQuilometroLitro'],  'vl_preco_combustivel_carga' => $_SESSION['proposta']['valorPrecoCombustivelLitro'], 'vl_total_preco_combustivel_carga' => $_SESSION['proposta']['valorTotalCombustivel'], 'cd_carga' => $idCarga]);

        $idValorCarga = DB::table('tb_valor_carga')->insertGetId(['vl_preco_carga' => $_SESSION['proposta']['valorCargaUSD_EUR'], 'nm_tipo_moeda_valor_carga' => $_SESSION['proposta']['tipoMoedaEstrangeira'], 'vl_cotacao_valor_carga' => $_SESSION['proposta']['valorMoedaEstrangeira'], 'vl_brl_valor_carga' => $_SESSION['proposta']['valorCargaBRL'], 'cd_carga' => $idCarga]);

        $idFretePeso = DB::table('tb_frete_peso')->insertGetId(['vl_frete_peso' => $_SESSION['proposta']['valorFretePeso_fretePeso'], 'pc_frete_peso' => $_SESSION['proposta']['porcentagemPercentualFretePeso'], 'cd_proposta' => $idProposta]);

        $idMotorista = DB::table('tb_motorista')->insertGetId(['vl_motorista' => $_SESSION['proposta']['valorValores'], 'vl_frete_conf_antt_motorista' => $_SESSION['proposta']['valorFreteANTT'], 'vl_pedagio_tab_motorista' => $_SESSION['proposta']['valorPedagio_motorista'], 'vl_total_aut_tab_motorista' => $_SESSION['proposta']['valorTotalAutonomo'], 'vl_lucro_total_aut_tab_motorista' => $_SESSION['proposta']['valorLucroTotalAutonomo'], 'vl_frete_all_in_fechado_motorista' => $_SESSION['proposta']['valorFreteAllFechado'], 'vl_lucro_frete_all_in_fechado_motorista' => $_SESSION['proposta']['valorLucroFreteAllFechado'], 'vl_tentar_fechar_motorista' => $_SESSION['proposta']['valorFreteFecharEm'], 'vl_lucro_tentar_fechar_motorista' => $_SESSION['proposta']['valorLucroFreteFecharEm'], 'cd_proposta' => $idProposta]);

        $idCotacaoAutonomo = DB::table('tb_cot_aut')->insertGetId(['nm_cot_aut' => $_SESSION['proposta']['motoristaCotado1'], 'vl_cot_aut' => $_SESSION['proposta']['valorMotoristaCotado1'], 'dt_cot_aut' => $_SESSION['proposta']['dataCotacaoMotorista1'], 'cd_proposta' => $idProposta]);

        $idCotacaoAutonomo2 = DB::table('tb_cot_aut')->insertGetId(['nm_cot_aut' => $_SESSION['proposta']['motoristaCotado2'], 'vl_cot_aut' => $_SESSION['proposta']['valorMotoristaCotado2'], 'dt_cot_aut' => $_SESSION['proposta']['dataCotacaoMotorista2'], 'cd_proposta' => $idProposta]);

        $idAdicionaisProposta = DB::table('tb_adicionais')->insertGetId(['id_isca_adicionais' => $_SESSION['proposta']['valorTipoUtilizacaoIsca'], 'vl_isca_adicionais' => $_SESSION['proposta']['valorUtilizacaoIsca'], 'id_monitoramento_isca_adicionais' => $_SESSION['proposta']['valorTipoMonitoramentoIsca'], 'vl_monitoramento_isca_adicionais' => $_SESSION['proposta']['valorMonitoramentoIsca'], 'id_escolta_armada_adicionais' => $_SESSION['proposta']['valorTipoEscoltaArmada'], 'vl_escolta_armada_adicionais' => $_SESSION['proposta']['valorEscoltaArmada'], 'id_devolucao_margem_esquerda_adicionais' => $_SESSION['proposta']['valorTipoDevolucaoMargemEsquerda'], 'vl_devolucao_margem_esquerda_adicionais' => $_SESSION['proposta']['valorDevolucaoMargemEsquerda'], 'id_devolucao_sv_adicionais' => $_SESSION['proposta']['valorTipoDevolucaoSV'], 'vl_devolucao_sv_adicionais' => $_SESSION['proposta']['valorDevolucaoSV'], 'id_adic_carga_anvisa_adicionais' => $_SESSION['proposta']['valorTipoAdicionalCargaAnvisa'], 'vl_adic_carga_anvisa_adicionais' => $_SESSION['proposta']['valorAdicionalCargaAnvisa'],'id_adic_carga_imo_adicionais' => $_SESSION['proposta']['valorTipoAdicionalCargaIMO'], 'vl_adic_carga_imo_adicionais' => $_SESSION['proposta']['valorAdicionalCargaIMO'], 'id_carregamento_expr_adicionais' => $_SESSION['proposta']['valorTipoCarregamentoExpresso'], 'vl_carregamento_expr_adicionais' => $_SESSION['proposta']['valorCarregamentoExpresso'], 'id_util_cav_ls_adicionais' => $_SESSION['proposta']['valorTipoUtilizacaoCavaloLS'], 'vl_util_cav_ls_adicionais' => $_SESSION['proposta']['valorUtilizacaoCavaloLS'], 'id_estadia_especial_adicionais' => $_SESSION['proposta']['valorTipoEstadiaEspecial'], 'vl_estadia_especial_adicionais' => $_SESSION['proposta']['valorEstadiaEspecial'], 'id_sobrestadia_carreg_adicionais' => $_SESSION['proposta']['valorTipoSobrestadiaCarregamento'], 'vl_sobrestadia_carreg_adicionais' => $_SESSION['proposta']['valorSobrestadiaCarregamento'], 'id_sobrestadia_retirada_adicionais' => $_SESSION['proposta']['valorTipoSobrestadiaRetirada'], 'vl_sobrestadia_retirada_adicionais' => $_SESSION['proposta']['valorSobrestadiaRetirada'], 'cd_proposta' => $idProposta]);
        
        if (isset($_SESSION['proposta']['botaoAssinarFisicamente']))
        {
            return redirect()->away("http://localhost/Compass/criadorPDF");
        }
        else
        {
            if(isset($_SESSION['proposta']['botaoAssinarDigitalmente']))
            {
                $_SESSION['idProposta'] = $idProposta;
                return redirect()->route('assdigital');
            }
        }

        // $propostaVinda = DB::table('tb_proposta')->where('tb_proposta.cd_proposta', '=', 1)->join('tb_produto', 'tb_proposta.cd_proposta', '=', 'tb_produto.cd_proposta')->get();

        // var_dump($propostaVinda);
    }

    function pegarPropostaCompleta(Request $request)
    {
        @session_start();
        $cabecalho = DB::table('tb_proposta')
        ->join('tb_produto', 'tb_proposta.cd_proposta', '=', 'tb_produto.cd_proposta')
        ->join('tb_filial', 'tb_proposta.cd_proposta', '=', 'tb_filial.cd_proposta')
        ->join('tb_cliente_proposta', 'tb_proposta.cd_proposta', '=', 'tb_cliente_proposta.cd_proposta')
        ->join('tb_responsavel_cliente_proposta', 'tb_cliente_proposta.cd_cliente', '=', 'tb_responsavel_cliente_proposta.cd_cliente')
        ->join('tb_email_responsavel_cliente_proposta', 'tb_responsavel_cliente_proposta.cd_responsavel_cliente', '=', 'tb_email_responsavel_cliente_proposta.cd_responsavel_cliente')
        ->join('tb_rota', 'tb_proposta.cd_proposta', '=', 'tb_rota.cd_proposta')
        ->join('tb_veiculo', 'tb_proposta.cd_proposta', '=', 'tb_veiculo.cd_proposta')
        ->where('tb_proposta.cd_proposta', '=', $request['ID'])
        ->get();

        $usuario = DB::table('tb_usuario')
        ->join('tb_email_usuario', 'tb_usuario.cd_usuario', '=', 'tb_email_usuario.cd_usuario')
        ->select('nm_nome_completo', 'nm_cargo_usuario', 'nm_email_usuario')
        ->where('tb_usuario.cd_usuario', '=', $cabecalho[0]->cd_usuario)
        ->get();

        

        if($usuario[0]->nm_email_usuario == $_SESSION['Usuario']['email'] || $_SESSION['Usuario']['privilegio'] == "Adm")
        {
            $operacao = DB::table('tb_operacao')
            ->join('tb_mercadoria_operacao', 'tb_operacao.cd_operacao', '=', 'tb_mercadoria_operacao.cd_operacao')
            ->join('tb_imp_operacao', 'tb_operacao.cd_operacao', '=', 'tb_imp_operacao.cd_operacao')
            ->join('tb_adic_operacao', 'tb_operacao.cd_operacao', '=', 'tb_adic_operacao.cd_operacao')
            ->where('tb_operacao.cd_proposta', '=', $request['ID'])
            ->get();

            $despesa = DB::table('tb_despesas')
            ->join('tb_imp_despesas', 'tb_despesas.cd_despesas', '=', 'tb_imp_despesas.cd_despesas')
            ->join('tb_adic_despesas', 'tb_despesas.cd_despesas', '=', 'tb_adic_despesas.cd_despesas')
            ->where('tb_despesas.cd_proposta', '=', $request['ID'])
            ->get();

            $carga = DB::table('tb_carga')
            ->join('tb_km_rota_carga', 'tb_carga.cd_carga', '=', 'tb_km_rota_carga.cd_carga')
            ->join('tb_pedagio_rota_carga', 'tb_carga.cd_carga', '=', 'tb_pedagio_rota_carga.cd_carga')
            ->join('tb_combustivel_carga', 'tb_carga.cd_carga', '=', 'tb_combustivel_carga.cd_carga')
            ->join('tb_valor_carga', 'tb_carga.cd_carga', '=', 'tb_valor_carga.cd_carga')
            ->where('tb_carga.cd_proposta', '=', $request['ID'])
            ->get();

            $fretePeso = DB::table('tb_frete_peso')
            ->where('tb_frete_peso.cd_proposta', '=', $request['ID'])
            ->get();

            $motorista = DB::table('tb_motorista')
            ->where('tb_motorista.cd_proposta', '=', $request['ID'])
            ->get();

            $cotacaoMotorista = DB::table('tb_cot_aut')
            ->where('tb_cot_aut.cd_proposta', '=', $request['ID'])
            ->get();

            $adicionais = DB::table('tb_adicionais')
            ->where('tb_adicionais.cd_proposta', '=', $request['ID'])
            ->get();
    
            return ["proposta" => ["cabecalho" => $cabecalho, "operacao" => $operacao, "despesa" => $despesa, "carga" => $carga, "fretePeso" => $fretePeso, 'motorista' => $motorista, 'cotacoes' => $cotacaoMotorista , 'adicionais' => $adicionais], "usuario" => $usuario];
        }
        else
        {
            $_SESSION['Erros']['ErroVerProposta'] = "Você não tem acesso";
            return redirect()->route('gerproposta');
        }
    }

    function atualizarProposta()
    {
        @session_start();

        $usuario = DB::select("SELECT cd_usuario FROM tb_usuario WHERE nm_nome_completo = '" . $_SESSION['proposta']['nomeResponsavel'] . "'");
        $EmailResponsavel = DB::table('tb_email_usuario')->join('tb_usuario', 'tb_email_usuario.cd_usuario', '=', 'tb_usuario.cd_usuario')->where('tb_email_usuario.nm_email_usuario', '=', $_SESSION['proposta']['emailResponsavel'])->get();
        $referenciaAcl = "ACL " . $_SESSION['proposta']['valorReferenciaProposta']." ". $_SESSION['proposta']['valorNumeroProposta'];
        $id = $usuario[0]->cd_usuario;
        $filial = $_SESSION['proposta']['filialACL'];
        $filial = explode('-', $filial);
        $nomeFilial = $filial[0];
        $cnpjFilial = $filial[1];
        $idsCabecalho = DB::table('tb_proposta')
        ->join('tb_produto', 'tb_proposta.cd_proposta', 'tb_produto.cd_proposta')
        ->join('tb_filial', 'tb_proposta.cd_proposta', 'tb_filial.cd_proposta')
        ->join('tb_cliente_proposta', 'tb_proposta.cd_proposta', 'tb_cliente_proposta.cd_proposta')
        ->join('tb_responsavel_cliente_proposta', 'tb_cliente_proposta.cd_cliente', 'tb_responsavel_cliente_proposta.cd_cliente')
        ->join('tb_email_responsavel_cliente_proposta', 'tb_responsavel_cliente_proposta.cd_responsavel_cliente', 'tb_email_responsavel_cliente_proposta.cd_responsavel_cliente')
        ->join('tb_rota', 'tb_proposta.cd_proposta', 'tb_rota.cd_proposta')
        ->join('tb_veiculo', 'tb_proposta.cd_proposta', 'tb_veiculo.cd_proposta')
        ->where('tb_proposta.cd_usuario', $EmailResponsavel[0]->cd_usuario)
        ->get();

        $idsOperacao = DB::table('tb_operacao')
        ->join('tb_mercadoria_operacao', 'tb_operacao.cd_operacao', 'tb_mercadoria_operacao.cd_operacao')
        ->join('tb_imp_operacao', 'tb_operacao.cd_operacao', 'tb_imp_operacao.cd_operacao')
        ->join('tb_adic_operacao', 'tb_operacao.cd_operacao', 'tb_adic_operacao.cd_operacao')
        ->where('tb_operacao.cd_proposta', $idsCabecalho[0]->cd_proposta)
        ->get();

        $idsDespesa = DB::table('tb_despesas')
        ->join('tb_imp_despesas', 'tb_despesas.cd_despesas', 'tb_imp_despesas.cd_despesas')
        ->join('tb_adic_despesas', 'tb_despesas.cd_despesas', 'tb_adic_despesas.cd_despesas')
        ->where('tb_despesas.cd_proposta', $idsCabecalho[0]->cd_proposta)
        ->get();

        $idsCarga = DB::table('tb_carga')
        ->join('tb_km_rota_carga', 'tb_carga.cd_carga', 'tb_km_rota_carga.cd_carga')
        ->join('tb_pedagio_rota_carga', 'tb_carga.cd_carga', 'tb_pedagio_rota_carga.cd_carga')
        ->join('tb_combustivel_carga', 'tb_carga.cd_carga', 'tb_combustivel_carga.cd_carga')
        ->join('tb_valor_carga', 'tb_carga.cd_carga', 'tb_valor_carga.cd_carga')
        ->where('tb_carga.cd_proposta', $idsCabecalho[0]->cd_proposta)
        ->get();

        $idsAdicionais = DB::table('tb_frete_peso')
        ->join('tb_motorista', 'tb_frete_peso.cd_proposta', 'tb_motorista.cd_proposta')
        ->join('tb_cot_aut', 'tb_frete_peso.cd_proposta', 'tb_cot_aut.cd_proposta')
        ->join('tb_adicionais', 'tb_frete_peso.cd_proposta', 'tb_adicionais.cd_proposta')
        ->where('tb_frete_peso.cd_proposta', $idsCabecalho[0]->cd_proposta)
        ->get();

        $ids = [$idsCabecalho, $idsOperacao, $idsDespesa, $idsCarga, $idsAdicionais];

        // dd($ids);

        $idProposta = DB::table('tb_proposta')->where('tb_proposta.cd_proposta', '=', $_SESSION['proposta']['idProposta'])->update(['ds_tipo_proposta' => $_SESSION['proposta']['tipoProposta'],'dt_proposta' => $_SESSION['proposta']['valorDataProposta'],'nm_referencia_acl' => $referenciaAcl, 'nm_referencia_cliente' => $_SESSION['proposta']['valorReferenciaCliente'], 'nm_versao_proposta' => $_SESSION['proposta']['valorVersaoProposta'], 'dt_horario_recebimento' => $_SESSION['proposta']['valorHorarioRecebimento'], 'ds_metodo_transporte' => $_SESSION['proposta']['valorTipoFrete'], 'ds_status_proposta' => $_SESSION['proposta']['statusProposta'], 'ds_tipo_assinatura' => $_SESSION['proposta']['tipoAssinatura'], 'cd_usuario' => $EmailResponsavel[0]->cd_usuario]);

        $idProduto = DB::table('tb_produto')->where('tb_produto.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_produto' => $_SESSION['proposta']['valorNomeProduto'], 'qt_produto' => $_SESSION['proposta']['valorPallets'], 'qt_peso_produto' => $_SESSION['proposta']['valorPeso'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idFilial = DB::table('tb_filial')->where('tb_filial.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_filial' => $nomeFilial, 'cd_cnpj' => $cnpjFilial, 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idCliente = DB::table('tb_cliente_proposta')->where('tb_cliente_proposta.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_empresa_cliente' => $_SESSION['proposta']['valorNomeCliente'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idResponsavelCliente = DB::table('tb_responsavel_cliente_proposta')->where('tb_responsavel_cliente_proposta.cd_cliente', '=', $ids[0][0]->cd_cliente)->update(['nm_responsavel_cliente' => $_SESSION['proposta']['valorNomeContatoCliente'], 'cd_cliente' => $ids[0][0]->cd_cliente]);

        $idEmailResponsavelCliente = DB::table('tb_email_responsavel_cliente')->where('tb_email_responsavel_cliente.cd_responsavel_cliente', '=', $ids[0][0]->cd_responsavel_cliente)->update(['nm_email_responsavel_cliente' => $_SESSION['proposta']['valorEmailContatoCliente'], 'cd_responsavel_cliente' => $ids[0][0]->cd_responsavel_cliente]);

        $idRota = DB::table('tb_rota')->where('tb_rota.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_cidade_origem_rota' => $_SESSION['proposta']['valorCidadeOrigem'], 'sg_uf_origem_rota' => $_SESSION['proposta']['valorEstadoOrigem'], 'nm_cidade_destino_rota' => $_SESSION['proposta']['valorCidadeDestino'], 'sg_uf_destino_rota' => $_SESSION['proposta']['valorEstadoDestino'], 'nm_local_devolucao_container_rota' => $_SESSION['proposta']['valorLocalDevolucao'] , 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idVeiculo = DB::table('tb_veiculo')->where('tb_veiculo.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_veiculo' => $_SESSION['proposta']['valorTipoVeiculo'], 'qt_eixos_veiculo' => $_SESSION['proposta']['valorEixos_cabecalho'], 'ds_carga_veiculo' => $_SESSION['proposta']['valorTipoContainer'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idOperacao = DB::table('tb_operacao')->where('tb_operacao.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_tipo_operacao' => $_SESSION['proposta']['tipoOperacao'], 'nm_tipo_imposto_operacao' => $_SESSION['proposta']['tipoImpostos'],'vl_frete_peso_operacao' => $_SESSION['proposta']['valorFretePeso_operacao'], 'vl_subtotal_operacao' => $_SESSION['proposta']['subTotal'], 'pc_total_prest_operacao' => $_SESSION['proposta']['porcentagemTotalPrest'], 'vl_total_prest_operacao' => $_SESSION['proposta']['valorTotalPrest'], 'vl_despesas_operacao' => $_SESSION['proposta']['valorDespesas_operacao'], 'pc_lucro_bruto_operacao' => $_SESSION['proposta']['porcentagemLucroBruto'], 'vl_lucro_bruto_operacao' => $_SESSION['proposta']['valorLucroBruto'], 'vl_margem_operacao' => $_SESSION['proposta']['valorMargemLucroBruto'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idMercadoriaOperacao = DB::table('tb_mercadoria_operacao')->where('tb_mercadoria_operacao.cd_operacao', '=', $ids[1][0]->cd_operacao)->update(['vl_mercadoria_operacao' => $_SESSION['proposta']['valorMercadoria'], 'vl_container_operacao' => $_SESSION['proposta']['container'], 'cd_operacao' => $ids[1][0]->cd_operacao]);

        $idImpostoOperacao = DB::table('tb_imp_operacao')->where('tb_imp_operacao.cd_operacao', '=', $ids[1][0]->cd_operacao)->update(['pc_imp_susp_imp_operacao' => $_SESSION['proposta']['porcentagemSusp'], 'vl_imp_susp_imp_operacao' => $_SESSION['proposta']['valorImpostoSuspenso'],'vl_total_imposto_seguro_operacao' => $_SESSION['proposta']['valorTotalImpostoSeguro'], 'pc_rctrc_imp_operacao' => $_SESSION['proposta']['porcentagemRCTRC_operacao'], 'vl_rctrc_imp_operacao' => $_SESSION['proposta']['valorRCTRC_operacao'], 'pc_rcfdc_imp_operacao' => $_SESSION['proposta']['porcentagemRCFDC_operacao'], 'vl_rcfdc_imp_operacao' => $_SESSION['proposta']['valorRCFDC_operacao'], 'ds_tipo_gris_imp_operacao' => $_SESSION['proposta']['valorCheckGRIS'], 'pc_gris_imp_operacao' => $_SESSION['proposta']['porcentagemGRIS'], 'vl_gris_imp_operacao' => $_SESSION['proposta']['valorGRIS'], 'vl_valor_icms_operacao' => $_SESSION['proposta']['valorICMS_operacao'], 'pc_icms_operacao' => $_SESSION['proposta']['porcentagemICMS_operacao'], 'cd_operacao' => $ids[1][0]->cd_operacao]);

        $idAdicionaisOperacao = DB::table('tb_adic_operacao')->where('tb_adic_operacao.cd_operacao', '=', $ids[1][0]->cd_operacao)->update(['vl_estacionamento' => $_SESSION['proposta']['valorEstacionamento_operacao'], 'vl_imo' => $_SESSION['proposta']['valorIMO'], 'vl_dta' => $_SESSION['proposta']['valorDTA_GVB'], 'vl_ajudantes' => $_SESSION['proposta']['valorAjudantes_operacao'], 'vl_pedagio' => $_SESSION['proposta']['valorPedagio_operacao'], 'cd_operacao' => $ids[1][0]->cd_operacao]);

        $idDespesa = DB::table('tb_despesas')->where('tb_despesas.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['vl_motorista_despesas' => $_SESSION['proposta']['valorMotoristaAutonomo'], 'vl_pedagio_despesas' => $_SESSION['proposta']['valorPedagio_despesa'], 'vl_profit_despesas' => $_SESSION['proposta']['valorProfit'], 'vl_comissao_despesas' => $_SESSION['proposta']['valorComissao'], 'pc_comissao_despesas' => $_SESSION['proposta']['porcentagemComissao'], 'vl_despesas' => $_SESSION['proposta']['valorDespesas_despesa'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idImpostoDespesa = DB::table('tb_imp_despesas')->where('tb_imp_despesas.cd_despesas', '=', $ids[2][0]->cd_despesas)->update(['pc_rcfdc_imp_despesas' => $_SESSION['proposta']['porcentagemRCFDC_despesa'], 'vl_rcfdc_imp_despesas' => $_SESSION['proposta']['valorRCFDC_despesa'], 'pc_rctrc_imp_despesas' => $_SESSION['proposta']['porcentagemRCTRC_despesa'], 'vl_rctrc_imp_despesas' => $_SESSION['proposta']['valorRCTRC_despesa'], 'pc_simples_nac_imp_despesas' => $_SESSION['proposta']['porcentagemSimplesNAC'], 'vl_simples_nac_imp_despesas' => $_SESSION['proposta']['valorSimplesNAC'], 'pc_irpj_imp_despesas' => $_SESSION['proposta']['porcentagemIRPJ'], 'vl_irpj_imp_despesas' => $_SESSION['proposta']['valorIRPJ'], 'pc_adic_irpj_imp_despesas' => $_SESSION['proposta']['porcentagemAdicionalIRPJ'], 'vl_adic_irpj_imp_despesas' => $_SESSION['proposta']['valorAdicionalIRPJ'], 'pc_pis_imp_despesas' => $_SESSION['proposta']['porcentagemPIS'], 'vl_pis_imp_despesas' => $_SESSION['proposta']['valorPIS'], 'pc_cofins_imp_despesas' => $_SESSION['proposta']['porcentagemCOFINS'], 'vl_cofins_imp_despesas' => $_SESSION['proposta']['valorCOFINS'], 'vl_icms_despesas' => $_SESSION['proposta']['valorICMS_despesa'], 'pc_icms_despesas' => $_SESSION['proposta']['porcentagemICMS_despesa'], 'cd_despesas' => $ids[2][0]->cd_despesas]);

        $idAdicionaisDespesa = DB::table('tb_adic_despesas')->where('tb_adic_despesas.cd_despesas', '=', $ids[2][0]->cd_despesas)->update(['vl_buonny_despesas' => $_SESSION['proposta']['valorBuonnyCadastro'], 'vl_gris_rastreamento_despesas' => $_SESSION['proposta']['valorGRISRastreamento'], 'vl_dta_terc_despesas' => $_SESSION['proposta']['valorDTA_DI'], 'vl_estacionamento_despesas' => $_SESSION['proposta']['valorEstacionamento_despesa'], 'vl_ajudantes_despesas' => $_SESSION['proposta']['valorAjudantes_despesa'], 'cd_despesas' => $ids[2][0]->cd_despesas]);

        $idCarga = DB::table('tb_carga')->where('tb_carga.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_tipo_carga' => $_SESSION['proposta']['valorTipoCarga'], 'vl_despesa_viagem_carga' => $_SESSION['proposta']['valorTotalDespesaViagem'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idQuilometragemCarga = DB::table('tb_km_rota_carga')->where('tb_km_rota_carga.cd_carga', '=', $ids[3][0]->cd_carga)->update(['qtd_ida_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemIda'], 'qtd_volta_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemVolta'], 'qtd_total_km_rota_carga' => $_SESSION['proposta']['valorQuilometragemTotal'], 'cd_carga' => $ids[3][0]->cd_carga]);

        $idPedagioCarga = DB::table('tb_pedagio_rota_carga')->where('tb_pedagio_rota_carga.cd_carga', '=', $ids[3][0]->cd_carga)->update(['qtd_eixos_pedagio_rota_carga' => $_SESSION['proposta']['valorEixos_carga'], 'vl_ida_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagioEixoIda'], 'vl_volta_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagioEixoVolta'], 'vl_total_pedagio_rota_carga' => $_SESSION['proposta']['valorPedagio_carga'], 'cd_carga' => $ids[3][0]->cd_carga]);

        $idCombustivelCarga = DB::table('tb_combustivel_carga')->where('tb_combustivel_carga.cd_carga', '=', $ids[3][0]->cd_carga)->update(['vl_quantidade_combustivel_carga' => $_SESSION['proposta']['valorTotalCombustivelLitros'], 'vl_consumo_combustivel_carga' => $_SESSION['proposta']['valorConsumoMedioQuilometroLitro'],  'vl_preco_combustivel_carga' => $_SESSION['proposta']['valorPrecoCombustivelLitro'], 'vl_total_preco_combustivel_carga' => $_SESSION['proposta']['valorTotalCombustivel'], 'cd_carga' => $ids[3][0]->cd_carga]);

        $idValorCarga = DB::table('tb_valor_carga')->where('tb_valor_carga.cd_carga', '=', $ids[3][0]->cd_carga)->update(['vl_preco_carga' => $_SESSION['proposta']['valorCargaUSD_EUR'], 'nm_tipo_moeda_valor_carga' => $_SESSION['proposta']['tipoMoedaEstrangeira'], 'vl_cotacao_valor_carga' => $_SESSION['proposta']['valorMoedaEstrangeira'], 'vl_brl_valor_carga' => $_SESSION['proposta']['valorCargaBRL'], 'cd_carga' => $ids[3][0]->cd_carga]);

        $idFretePeso = DB::table('tb_frete_peso')->where('tb_frete_peso.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['vl_frete_peso' => $_SESSION['proposta']['valorFretePeso_fretePeso'], 'pc_frete_peso' => $_SESSION['proposta']['porcentagemPercentualFretePeso'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idMotorista = DB::table('tb_motorista')->where('tb_motorista.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['vl_motorista' => $_SESSION['proposta']['valorValores'], 'vl_frete_conf_antt_motorista' => $_SESSION['proposta']['valorFreteANTT'], 'vl_pedagio_tab_motorista' => $_SESSION['proposta']['valorPedagio_motorista'], 'vl_total_aut_tab_motorista' => $_SESSION['proposta']['valorTotalAutonomo'], 'vl_lucro_total_aut_tab_motorista' => $_SESSION['proposta']['valorLucroTotalAutonomo'], 'vl_frete_all_in_fechado_motorista' => $_SESSION['proposta']['valorFreteAllFechado'], 'vl_lucro_frete_all_in_fechado_motorista' => $_SESSION['proposta']['valorLucroFreteAllFechado'], 'vl_tentar_fechar_motorista' => $_SESSION['proposta']['valorFreteFecharEm'], 'vl_lucro_tentar_fechar_motorista' => $_SESSION['proposta']['valorLucroFreteFecharEm'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idCotacaoAutonomo = DB::table('tb_cot_aut')->where('tb_cot_aut.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_cot_aut' => $_SESSION['proposta']['motoristaCotado1'], 'vl_cot_aut' => $_SESSION['proposta']['valorMotoristaCotado1'], 'dt_cot_aut' => $_SESSION['proposta']['dataCotacaoMotorista1'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idCotacaoAutonomo2 = DB::table('tb_cot_aut')->where('tb_cot_aut.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['nm_cot_aut' => $_SESSION['proposta']['motoristaCotado2'], 'vl_cot_aut' => $_SESSION['proposta']['valorMotoristaCotado2'], 'dt_cot_aut' => $_SESSION['proposta']['dataCotacaoMotorista2'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        $idAdicionaisProposta = DB::table('tb_adicionais')->where('tb_adicionais.cd_proposta', '=', $ids[0][0]->cd_proposta)->update(['id_isca_adicionais' => $_SESSION['proposta']['valorTipoUtilizacaoIsca'], 'vl_isca_adicionais' => $_SESSION['proposta']['valorUtilizacaoIsca'], 'id_monitoramento_isca_adicionais' => $_SESSION['proposta']['valorTipoMonitoramentoIsca'], 'vl_monitoramento_isca_adicionais' => $_SESSION['proposta']['valorMonitoramentoIsca'], 'id_escolta_armada_adicionais' => $_SESSION['proposta']['valorTipoEscoltaArmada'], 'vl_escolta_armada_adicionais' => $_SESSION['proposta']['valorEscoltaArmada'], 'id_devolucao_margem_esquerda_adicionais' => $_SESSION['proposta']['valorTipoDevolucaoMargemEsquerda'], 'vl_devolucao_margem_esquerda_adicionais' => $_SESSION['proposta']['valorDevolucaoMargemEsquerda'], 'id_devolucao_sv_adicionais' => $_SESSION['proposta']['valorTipoDevolucaoSV'], 'vl_devolucao_sv_adicionais' => $_SESSION['proposta']['valorDevolucaoSV'], 'id_adic_carga_anvisa_adicionais' => $_SESSION['proposta']['valorTipoAdicionalCargaAnvisa'], 'vl_adic_carga_anvisa_adicionais' => $_SESSION['proposta']['valorAdicionalCargaAnvisa'],'id_adic_carga_imo_adicionais' => $_SESSION['proposta']['valorTipoAdicionalCargaIMO'], 'vl_adic_carga_imo_adicionais' => $_SESSION['proposta']['valorAdicionalCargaIMO'], 'id_carregamento_expr_adicionais' => $_SESSION['proposta']['valorTipoCarregamentoExpresso'], 'vl_carregamento_expr_adicionais' => $_SESSION['proposta']['valorCarregamentoExpresso'], 'id_util_cav_ls_adicionais' => $_SESSION['proposta']['valorTipoUtilizacaoCavaloLS'], 'vl_util_cav_ls_adicionais' => $_SESSION['proposta']['valorUtilizacaoCavaloLS'], 'id_estadia_especial_adicionais' => $_SESSION['proposta']['valorTipoEstadiaEspecial'], 'vl_estadia_especial_adicionais' => $_SESSION['proposta']['valorEstadiaEspecial'], 'id_sobrestadia_carreg_adicionais' => $_SESSION['proposta']['valorTipoSobrestadiaCarregamento'], 'vl_sobrestadia_carreg_adicionais' => $_SESSION['proposta']['valorSobrestadiaCarregamento'], 'id_sobrestadia_retirada_adicionais' => $_SESSION['proposta']['valorTipoSobrestadiaRetirada'], 'vl_sobrestadia_retirada_adicionais' => $_SESSION['proposta']['valorSobrestadiaRetirada'], 'cd_proposta' => $ids[0][0]->cd_proposta]);

        unset($_SESSION['proposta']);

        echo("<script>window.location.href = 'http://localhost:8000/gerproposta'</script>");
    }

    function deletarProposta(Request $request)
    {
        $idProposta = $request->ID;
        echo($idProposta);
        $deletando = DB::table('tb_proposta')->where('tb_proposta.cd_proposta', $idProposta)->delete();
        return redirect()->route('gerproposta');

        // $deletandoCabecalho = DB::table('tb_proposta')
        // ->join('tb_produto', 'tb_proposta.cd_proposta', 'tb_produto.cd_proposta')
        // ->join('tb_filial', 'tb_proposta.cd_proposta', 'tb_filial.cd_proposta')
        // ->join('tb_cliente', 'tb_proposta.cd_proposta', 'tb_cliente.cd_proposta')
        // ->join('tb_responsavel_cliente', 'tb_cliente.cd_cliente', 'tb_responsavel_cliente.cd_cliente')
        // ->join('tb_email_responsavel_cliente', 'tb_responsavel_cliente.cd_responsavel_cliente', 'tb_email_responsavel_cliente.cd_responsavel_cliente')
        // ->join('tb_rota', 'tb_proposta.cd_proposta', 'tb_rota.cd_proposta')
        // ->join('tb_veiculo', 'tb_proposta.cd_proposta', 'tb_veiculo.cd_proposta')
        // ->where('tb_proposta.cd_usuario', $idProposta)
        // ->delete();

        // $deletandoOperacao = DB::table('tb_operacao')
        // ->join('tb_mercadoria_operacao', 'tb_operacao.cd_operacao', 'tb_mercadoria_operacao.cd_operacao')
        // ->join('tb_imp_operacao', 'tb_operacao.cd_operacao', 'tb_imp_operacao.cd_operacao')
        // ->join('tb_adic_operacao', 'tb_operacao.cd_operacao', 'tb_adic_operacao.cd_operacao')
        // ->where('tb_operacao.cd_proposta', $idProposta)
        // ->delete();

        // $deletandoDespesa = DB::table('tb_despesas')
        // ->join('tb_imp_despesas', 'tb_despesas.cd_despesas', 'tb_imp_despesas.cd_despesas')
        // ->join('tb_adic_despesas', 'tb_despesas.cd_despesas', 'tb_adic_despesas.cd_despesas')
        // ->where('tb_despesas.cd_proposta', $idProposta)
        // ->delete();

        // $deletandoCarga = DB::table('tb_carga')
        // ->join('tb_km_rota_carga', 'tb_carga.cd_carga', 'tb_km_rota_carga.cd_carga')
        // ->join('tb_pedagio_rota_carga', 'tb_carga.cd_carga', 'tb_pedagio_rota_carga.cd_carga')
        // ->join('tb_combustivel_carga', 'tb_carga.cd_carga', 'tb_combustivel_carga.cd_carga')
        // ->join('tb_valor_carga', 'tb_carga.cd_carga', 'tb_valor_carga.cd_carga')
        // ->where('tb_carga.cd_proposta', $idProposta)
        // ->delete();

        // $deletandoAdicionais = DB::table('tb_frete_peso')
        // ->join('tb_motorista', 'tb_frete_peso.cd_proposta', 'tb_motorista.cd_proposta')
        // ->join('tb_cot_aut', 'tb_frete_peso.cd_proposta', 'tb_cot_aut.cd_proposta')
        // ->join('tb_adicionais', 'tb_frete_peso.cd_proposta', 'tb_adicionais.cd_proposta')
        // ->where('tb_frete_peso.cd_proposta', $idProposta)
        // ->delete();
    }

    function atualizarAssinaturaACL()
    {
        @session_start();
        $representante = $_SESSION['representante'];
        $idProposta = $_SESSION['idProposta'];
        unset($_SESSION['idProposta']);
        unset($_SESSION['representante']);
        $token = rand(100000, 999999);
        $_SESSION['infos'] = ["Nome" => $_SESSION['proposta']['valorNomeCliente'], "Email" => $_SESSION['proposta']['valorEmailContatoCliente'], "Token" =>$token];
        unset($_SESSION['proposta']);
        $tabelaAlterada = DB::table('tb_proposta')->where('tb_proposta.cd_proposta', $idProposta)->update(['cd_token_cliente' => $token]);
        $tabelaAlterada = DB::table('tb_proposta')->where('tb_proposta.cd_proposta', $idProposta)->update(['ds_status_proposta' => "Enviado / Aguardando Assinatura"]);
        return redirect()->action([EmailController::class, 'EnviarEmail']);
    }

}
