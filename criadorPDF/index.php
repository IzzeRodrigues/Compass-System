<?php
//IMPORTAÇÃO DA BIBLIOTECA

$variaveis = $_GET;

if ($variaveis['botaoSalvar'])
{
    session_start();
    $_SESSION['variaveis'] = $variaveis;
    header("Location: http://localhost:8000/salvarProposta");
}

require_once __DIR__ . '/vendor/autoload.php';
// VARIÁVEIS DE CRIAÇÃO DE PÁGINA PDF:
$mpdf = new \Mpdf\Mpdf([
    'default_font' => 'arial',
    'default_font_size' => '6.5',
    'margin_left' => 2,
    'margin_right' => 2,
    'margin_top' => 2,
    'margin_bottom' => 2,
]);
// CABEÇALHO COMPLETO:
$cabecalho = '<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
    <tr>
        <td style="border: 0.5px solid black; width: 40%;">
            <table style="text-align: center; width: 100%;">
                <tr>
                    <td>
                        <img width="20%" src="./acl.jpg"/>
                    </td>
                    <td style="text-align:center; font-size: 10px;">
                        <div style="font-size:15px; color:red; font-weight:bold;">PROPOSTA COMERCIAL</div>
                        <div style="font-size:12px; font-weight:bold;">Transporte Rodoviário</div><br/>
                        <div style="font-weight:800;">Rua Alexandre Gusmão, 11 CJ. 1315/16/17/18</div>
                        <div>Santos (SP) - DDR Nacional +55 13 3219-1011</div>
                        <div style="color:blue; text-decoration:underline;">www.aclcargo.com.br</div>
                    </td>
                    <td>
                        <img width="20%" src="./aeo.jpg"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>';
$mpdf->WriteHTML($cabecalho);

// VARIAVEIS TRANSPORTE:
$dataExplodida = explode('-',$variaveis['valorDataProposta'],3);
$diaExibicao = $dataExplodida[2];
$mesExibicao = $dataExplodida[1];
$anoExibicao = $dataExplodida[0];
$dataExibicao = "$diaExibicao-$mesExibicao-$anoExibicao";
$data_atual = $dataExibicao;
$ref_cliente = $variaveis['valorReferenciaProposta'];
$cliente = $variaveis['valorNomeCliente'];
$contato_cliente = $variaveis['valorEmailContatoCliente'];
if($variaveis['valorTotalImpostoSeguro'] != 0)
{
    $valor_carga = "R$ " . $variaveis['valorTotalImpostoSeguro'];
}
else
{
    $valor_carga = "Valor não informado";
}
$peso_carga = $variaveis['valorPeso'] . " KG";
$qtd_tipo_carga = $variaveis['valorPallets'];
$criador_proposta = $variaveis['nomeResponsavel'];
$email_criador = $variaveis['emailResponsavel'];
$depto_criador = $variaveis['cargoResponsavel'];
// CRIAÇÃO DA TABLE TRANSPORTE:
$transporte = '<table style="width:100%; margin:0; padding:0; border-collapse: collapse;">
    <tr>
        <td style="width:10%; border: 1px solid black;  font-weight:bold;">
            Data:
        </td>
        <td style="width:20%; border: 0.5px solid black; border-right: none; ">
            '. $data_atual .'	
        </td>
        <td style="width:30%; border: 1px solid black;  font-weight:bold;">
            Referência ACL:
        </td>
        <td style="width:40%; border: 0.5px solid black;">
           '. $ref_cliente .'
        </td>
    </tr>
    <tr>
        <td style="width:10%; border: 1px solid black;  font-weight:bold;">
        Cliente:
        </td>
        <td style="width:20%; border: 0.5px solid black; border-right: none; ">
           '. $cliente .'	
        </td>
        <td style="width:30%; border: 1px solid black;  font-weight:bold;">
            Contato:
        </td>
        <td style="width:40%; border: 0.5px solid black;">
            '. $contato_cliente .'	
        </td>
        </tr>
    <tr>
    <td style="width:15%; border: 1px solid black;  font-weight:bold;">
        Vlr. Carga (*):		
    </td>
    <td style="width:20%; border: 0.5px solid black; border-right: none; ">
        '. $valor_carga .'
    </td>
    <td style="width:30%; border: 1px solid black;  font-weight:bold;">
        Peso Total Bruto:
    </td>
    <td style="width:40%; border: 0.5px solid black;">
       '. $peso_carga .'
    </td>
    </tr>
    <tr>
        <td style="width:10%; border: 1px solid black;  font-weight:bold;">
            Qtde/Tipo:			
        </td>
        <td colspan="3" style="border: 0.5px solid black;">
            '. $qtd_tipo_carga .'				
        </td>
    </tr>
    <tr>
    <td style="width:10%; border: 1px solid black;  font-weight:bold;">
        Elaborado por:		
    </td>
    <td style="border: 0.5px solid black; border-right: none; ">
        '. $criador_proposta .' - '. $email_criador .'			
    </td>
    <td style="width:10%; border: 1px solid black;  font-weight:bold;">
        Depto.:
    </td>
    <td style="width:30%; border: 0.5px solid black;">
        '. $depto_criador .'	
    </td>
    </tr>
</table>

<table style="width:100%; background-color:red;  border: 0.5px solid black;">
    <td > 
        <tr> 
            <td style="color:white; text-align:center; font-size:10px; ">
                TRAJETO:Guarulhos (AeroportoP - SP / Anápolis (Porto Seco) - GO / Trânsito Aduaneiro (DTA)								
			</td>
        </tr>
</table>';
$mpdf->WriteHTML($transporte);

// VARIÁVEIS CONTAINER: 
$tipo_transporte_carga = $variaveis['valorTipoFrete'];
$frete_14tons_bruto = 'R$ ';
$frete_25tons_bruto = 'R$ ';
$frete_30tons = 'R$ '; 
$pedagio_14tons_bruto = 'R$ ';
$pedagio_25tons_bruto = 'R$ ';
$pedagio_30tons = 'R$ ';
if ($tipoCarga == 'container20')
{
    $frete_14tons_bruto = " " . $variaveis['valorFretePeso_operacao'];
    $pedagio_14tons_bruto = " " .$variaveis['valorPedagio_operacao'];
}
else
{
    if ($tipoCarga == 'container40-25tons')
    {
        $frete_25tons_bruto = " " . $variaveis['valorFretePeso_operacao'];
        $pedagio_25tons_bruto = " " .$variaveis['valorPedagio_operacao'];
    }
    else
    {
        if ($tipoCarga == 'container40-30tons')
        {
            $frete_30tons = " " . $variaveis['valorFretePeso_operacao'];
            $pedagio_30tons = " " .$variaveis['valorPedagio_operacao'];
        }
    }
}

// CRIAÇÃO DA TABLE CONTAINER:
$container = '<table style="border-collapse:colapse; width:100%;">
        <tr>
            <td  style="text-align: center; color: yellow; font-weight:bold; font-size:10px; background-color:black; border: 0.5px solid black;">
                '. $tipo_transporte_carga .'
            </td>
        </tr>
    </table>
    <table style="width:100%; float: RIGHT; background-color:DimGray; border: 0.5px solid black;">
        <td> 
            <tr> 
                <td style="color:yellow; font-weight:bold; font-size:10px; text-align:center; ">
                FCL FULL CONTAINER						
                </td>
            </tr>
    </table>
    <table style="width:100%;  border-spacing: 0; border-collapse:colapse; ">
        <tr>
        <td style="border: 0.5px solid black; font-weight:bold; border-top:0; border-right:0; width:50%;">
           Tipo de container e peso				
        </td>
        <td style="border: 0.5px solid black; font-weight:bold; border-top:0; width:25%;">
           FRETE PESO
        </td>
        <td style="border: 0.5px solid black; font-weight:bold; border-top:0; border-left:0; width:25%;">
          Pedágio 
        </td>
    </tr>
    </table>
    <table style="width:100%;  border-spacing: 0; border-collapse:colapse; ">
        <tr>
            <td style="border: 0.5px solid black; border-top:0; width:50%;">
                Container de 20` - até 14,5, tons bruto (carga + tara)			
            </td>
            <td style="border: 0.5px solid black; border-top:0; width:25%;">
                '. $frete_14tons_bruto .' 
            </td>
            <td style="border: 0.5px solid black; border-top:0; width:25%;">
                '. $pedagio_14tons_bruto .'  
            </td>
        </tr>
    </table>
    <table style="width:100%;  border-spacing: 0; border-collapse:colapse; ">
        <tr>
            <td style="border: 0.5px solid black; border-top:0; width:50%;">
                Container de 20` / 40" - até 25 tons bruto (carga + tara)				
            </td>
            <td style="border: 0.5px solid black; border-top:0;width:25%;">
            '. $frete_25tons_bruto .' 
            </td>
            <td style="border: 0.5px solid black; border-top:0;width:25%;">
            '. $pedagio_25tons_bruto .'
            </td>
        </tr>
    </table>
    <table style="width:100%;  border-spacing: 0; border-collapse:colapse; ">
        <tr>
            <td style="border: 0.5px solid black; border-top:0; width:50%;">
                Container de 20` / 40` de 25 até 30 tons (carga + tara)
            </td>
            <td style="border: 0.5px solid black; border-top:0; width:25%;">
            '. $frete_30tons .'  
            </td>
            <td style="border: 0.5px solid black; border-top:0;width:25%;">
            '. $pedagio_30tons .'   
            </td>
        </tr>
    </table>';
$mpdf->WriteHTML($container);

// VARIÁVEIS CARGA:
$fiorino_frete = '';
$fiorino_pedagio = '';
$van_frete = '';
$van_pedagio = '';
$bau_frete = '';
$bau_pedagio = '';
$toco_frete = '';
$toco_pedagio = '';
$truck_frete = '';
$truck_pedagio = '';
$carreta_frete = '';
$carreta_pedagio = '';
$tipoCarga = $variaveis['valorTipoContainer'];

if ($tipoCarga == 'container500kg')
{
    $fiorino_frete = " " . $variaveis['valorFretePeso_operacao'];
    $fiorino_pedagio = " " .$variaveis['valorPedagio_operacao'];
}
else
{
    if ($tipoCarga == 'container1200kg')
    {
        $van_frete = " " . $variaveis['valorFretePeso_operacao'];
        $van_pedagio = " " .$variaveis['valorPedagio_operacao'];
    }
    else
    {
        if ($tipoCarga == 'container3500kg')
        {
            $bau_frete = " " . $variaveis['valorFretePeso_operacao'];
            $bau_pedagio = " " .$variaveis['valorPedagio_operacao'];
        }
        else
        {
            if ($tipoCarga == 'container6000kg')
            {
                $toco_frete = " " . $variaveis['valorFretePeso_operacao'];
                $toco_pedagio = " " .$variaveis['valorPedagio_operacao'];
            }
            else
            {
                if ($tipoCarga == 'container12000kg')
                {
                    $truck_frete = " " . $variaveis['valorFretePeso_operacao'];
                    $truck_pedagio = " " .$variaveis['valorPedagio_operacao'];
                }
                else
                {
                    if ($tipoCarga == 'container25000kg')
                    {
                        $carreta_frete = " " . $variaveis['valorFretePeso_operacao'];
                        $carreta_pedagio = " " .$variaveis['valorPedagio_operacao'];
                    }
                }
            }
        }
    }
}

// CRIAÇÃO DA TABLE CARGA:
$carga = '<table style="width:100%; float: RIGHT; background-color:DimGray; border: 0.5px solid black;">
<td> 
    <tr> 
        <td style="color:yellow; font-weight:bold; font-size:10px; text-align:center; ">
        FTL/LCL CARGA SOLTA					
        </td>
    </tr>
</table>
    <table style="width:100%;  border-spacing: 0; border-collapse:colapse; ">
        <tr>
            <td style="border: 0.5px solid black; font-weight:bold; border-top:0; border-right:0; width: 35%;">
                Peso (KG) ou Cubagem (m3) ou Qt. Pallets			
            </td>
            <td style="border: 0.5px solid black; font-weight:bold; border-top:0;">
                Equipamento
            </td>
            <td style="border: 0.5px solid black; font-weight:bold; border-top:0; border-left:0;">
                FRETE PESO
            </td>
            <td style="border: 0.5px solid black; font-weight:bold; border-top:0; border-left:0;">
                Pedágio 
            </td>
        </tr>
        <tr>
            <td style="border: 0.5px solid black;  border-top:0; border-right:0; width: 35%;">
            Até 500 / 1m3 / 01 pallet			
            </td>
            <td style="border: 0.5px solid black;  border-top:0;">
            Fiorino 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $fiorino_frete .'  
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $fiorino_pedagio .'
            </td>
        </tr>
        <tr>
            <td style="border: 0.5px solid black;  border-top:0; border-right:0; width: 35%;">
            De 501 a 1200Kg / 1,01 a 10m3 / 02 pallets			
            </td>
            <td style="border: 0.5px solid black;  border-top:0;">
            Van 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $van_frete .' 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $van_pedagio .' 
            </td>
        </tr>
        <tr>
            <td style="border: 0.5px solid black;  border-top:0; border-right:0; width: 35%;">
            De 1201 a 3500Kg / 10,1 a 22m3 / 06 pallets			
            </td>
            <td style="border: 0.5px solid black;  border-top:0;">
            Baú 3/4 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $bau_frete .'  
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $bau_pedagio .'  
            </td>
        </tr>
        <tr>
            <td style="border: 0.5px solid black;  border-top:0; border-right:0; width: 35%;">
            De 3501 a 6000Kg / 22,1 a 35m3 / 10 pallets			
            </td>
            <td style="border: 0.5px solid black;  border-top:0;">
            Baú Toco 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $toco_frete .'   
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $toco_pedagio .'   
            </td>
        </tr>
        <tr>
            <td style="border: 0.5px solid black;  border-top:0; border-right:0; width: 35%;">
            De 6001 a 12000Kg / 35,1 a 45m3 / 14 pallets			
            </td>
            <td style="border: 0.5px solid black;  border-top:0;">
            Baú Truck 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $truck_frete .'   
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $truck_pedagio .'   
            </td>
        </tr>
        <tr>
            <td style="border: 0.5px solid black;  border-top:0; border-right:0; width: 35%;">
            De 12001 a 25000Kg / 45,1 a 76m3 / 26 pallets			
            </td>
            <td style="border: 0.5px solid black;  border-top:0;">
            Carreta baú 
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $carreta_frete .'   
            </td>
            <td style="border: 0.5px solid black;  border-top:0; border-left:0;">
            R$'. $carreta_pedagio .'   
            </td>
        </tr>
        <tr>
    </table>
        <table style="width:100%;  border-spacing: 0; border-collapse:colapse; ">
            <tr>
            <td style="border: 0.5px solid black; border-top:0; font-size: 11px; text-align:center;">
                (*) Valores da Invoice/DTA/DI/DANFE a câmbio de hoje acrescido do valor do container e impostos suspensos em caso de DTA. Poderá sofrer alterações.						
            </td>
            </tr>
        </table>';
$mpdf->WriteHTML($carga);

// VARIÁVEIS ADICIONAIS:
if($variaveis['valorRCFDC_operacao'] == 0)
{
    $porc_seguro = $variaveis['porcentagemRCFDC_operacao'] + $variaveis['porcentagemRCTRC_operacao'];
} 
else
{
    $porc_seguro = "R$ " . $variaveis['valorRCFDC_operacao'] + $variaveis['valorRCTRC_operacao'];
}
$valor_gris = 'INCLUSO';
$cobranca_dta_full ='NÃO APLICÁVEL';
if ($variaveis['valorDTA_GVB'] == 0)
{
    $cobranca_dta_di_expo = "ISENTO OU NÃO APLICÁVEL";
}
else
{
    $cobranca_dta_di_expo = "R$ " . $variaveis['valorDTA_GVB'];
}
if ($variaveis['valorTipoFrete'] == "freteAereo")
{
    $cobranca_estacionamento = "INSENTO";
}
else
{
    $cobranca_estacionamento = "R$ " . $variaveis['valorEstacionamento_operacao'];
}
$taxa_dacte='ISENTO';
if ($variaveis['valorICMS_operacao'] == 0)
{
    $valor_icms = "CONF. LEGISLAÇÃO";
}
else
{
    $valor_icms = "R$ " . $variaveis['valorICMS_operacao'];
}
if ($variaveis['valorTotalImpostoSeguro'] == 0)
{
    $valor_proposta="Frete+ICMS+Pedágio+Seguros";
}
else
{
    $valor_proposta = "R$ " . $variaveis['valorTotalPrest'];
}
// CRIANDO TABLE ADICIONAIS:
$adicionais = '<table style="width:100%; border-spacing: 0; border-collapse:colapse; background-color: red; ">
    <tr>
        <td style="border: 0.5px solid black; font-size: 10px; text-align:center; font-weight:bold; color:white;">
            ADICIONAIS
        </td>
    </tr>
</table>
<table style="width:100%;  border-spacing: 0; border-collapse:colapse; border:0.5px solid black;">
    <tr>
        <td rowspan="2" style="width:10%; background-color:red; color:white; font-weight:bold; border: 0.5px solid black;  border-top:0; border-left:0;">
        SEGURO <br/> ACL CARGO
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0; ">
        Seguro  - 0,11% Cálc. s/Vlr Carga + Impostos Susp. (DTA) + Container (*) - POR OPERAÇÃO (DTA/DI)				
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        '. $porc_seguro .'
        </td>
    </tr>
    <tr>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
            GRIS - Cálc. s/Vlr Carga + Impostos Suspensos (DTA) + Casco do Container				
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0;">
        '. $valor_gris .'
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Cobrança de DTA FULL CONTAINER				
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0;">
       '. $cobranca_dta_full .'
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Cobrança de DTA/DI/EXPO LCL em GRU/VCP/GYN/BSB/CFN/GIG/CWB (Por Processo)				
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0;">
        '. $cobranca_dta_di_expo .'
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Estacionamento em GRU/VCP/GYN/BSB/CFN/GIG/CWB por período de 03 Horas  				
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0;">
        '. $cobranca_estacionamento .'
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Taxa de emissão de DACTE				
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0;">
        '. $taxa_dacte .' 
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        ICMS (7%) - Repasse Oficial			
        </td>
        <td>
         '. $valor_icms .' 
        </td>
    </tr>
    <tr style="background-color:yellow;">
        <td style="border: 0.5px solid black; border-left:0; border-right:0;">
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        VALOR DA PROPOSTA (SEM ADICIONAIS SE NECESSÁRIO) 
        </td>
        <td style="border: 0.5px solid black; border-left:0;">
        '. $valor_proposta .'
        </td>
    </tr>
</table>';
$mpdf->WriteHTML($adicionais);

// VARIÁVEIS ADICIONAIS SE NECESSÁRIO:
$valor_ajudante = "R$ " . $variaveis['valorAjudantes_operacao'];
$seguro_isca = $variaveis['valorUtilizacaoIsca'];
$monitoramento_isca = $variaveis['valorMonitoramentoIsca'];
$valor_escolta = $variaveis['valorEscoltaArmada'];
if ($variaveis['valorTipoFrete'] == "freteAereo")
{
    $devolucao_margem_esquerda = "NÃO APLICÁVEL";
}
else
{
    $devolucao_margem_esquerda = "R$ " . 590;
}
if ($variaveis['valorTipoFrete'] == "freteAereo")
{
    $devolucao_margem_direita = "NÃO APLICÁVEL";
}
else
{
    $devolucao_margem_direita = "R$ " . 450;
}
if ($variaveis['valorTipoFrete'] == "freteAereo")
{
    $adc_anvisa = "NÃO APLICÁVEL";
}
else
{
    $adc_anvisa = "R$ " . 400;
}
$adc_imo = "R$ " . $variaveis['valorAdicionalCargaIMO'];
$carreg_expresso = "R$ " . $variaveis['valorCarregamentoExpresso'];
$valor_cavaloLS = "R$ " . $variaveis['valorUtilizacaoCavaloLS'];
$estadia_espec = "R$ " . $variaveis['valorEstadiaEspecial'];
$sobrestadia_carreg = "R$ " . $variaveis['valorSobrestadiaCarregamento'];
if ($variaveis['valorTipoFrete'] == "freteAereo")
{
    $sobrestadia_retirada = "NÃO APLICÁVEL";
}
else
{
    $sobrestadia_retirada = "R$ " . 45;
}
// CRIANDO TABLE ADICIONAIS SE NECESSÁRIO
$adicionais_necessario = '<table style="width:100%; border-spacing: 0; border-collapse:colapse; background-color: red; ">
    <tr>
        <td style="border: 0.5px solid black; font-size: 10px; text-align:center; font-weight:bold; color:white;">
            ADICIONAIS ### SE NECESSÁRIO ###
        </td>
    </tr>
</table>
<table style="width:100%;  border-spacing: 0; border-collapse:colapse; border:0.5px solid black;">
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Ajudantes - (por homem)					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; width:20%;">
        '. $valor_ajudante .'
        </td>
    </tr>
    <tr>
        <td rowspan="2" style="width:10%; background-color:red; color:white; font-weight:bold; border: 0.5px solid black;  border-top:0; border-left:0;">
        SEGURO <br/> ACL CARGO
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0; ">
        Utilização de " ISCA " - por container / veiculo (Até 3 milhões de reais)				
        </td>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        '. $seguro_isca .'
        </td>
    </tr>
    <tr>
        <td  style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Monitoramento de " ISCA " - por container/veiculo  (Até 3 milhões de reais)
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0;">
        '. $monitoramento_isca .'
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Escolta armada de carga (Padrão: 01 escolta armada para até 02 caminhões): 					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $valor_escolta .' 
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Adic. de devolução/coleta/carregamento (por operaçao) no Guarujá (Margem Esquerda) ou Itaguaí					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $devolucao_margem_esquerda .' 
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Adic. de devolução/coleta/carregamento (por operação) de containers em Cubatão, São Vicente ou Praia Grande					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $devolucao_margem_direita .' 
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Adicional para cargas ANVISA (por veículo)					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $adc_anvisa .'
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Adicional para cargo IMO (Por processo)					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $adc_imo .'
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Carregamento Expresso (com antecedência menor do que 24h conf. item 9 de observações gerais)					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $carreg_expresso .'
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Cavalo LS (p/ container 20 e 40` de 25 Acima de 30 tons até 32 tons					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $valor_cavaloLS .' 
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Estadia especial  (período de 24h) para desembaraço sobre rodas 					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $estadia_espec .'
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0; ">
        Sobrestadia no carregamento, desova, descarga ou estufagem  - Livre por 6hs - após será cobrado o seguinte valor a cada hora
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $sobrestadia_carreg .'
        </td>
    </tr>
    <tr>
        <td  colspan="2" style="border: 0.5px solid black;  border-top:0; border-left:0;">
        Sobrestadia na retirada/devol. de container vazio devido falta de autorização para limpeza ou reparo - Livre por 4 horas - após (por hora)					
        </td>
        <td  style="border: 0.5px solid black; border-top:0; border-left:0; ">
        '. $sobrestadia_retirada .' 
        </td>
    </tr>
</table>';
$mpdf->WriteHTML($adicionais_necessario);

// LOGOTIPOS PARCEIROS
$parceiros = '<table style="border: 0.5px solid black; margin:0; padding:0; text-align:center;" width="100%">
    <tr>
        <td style="margin:0; padding:0;">
            <img width="8%" src="./anvisa.jpg"/>
        </td>
        <td style="margin:0; padding:0;"> 
            <img width="8%" src="./eb.jpg"/>
        </td>
        <td style="margin:0; padding:0;">
            <img width="18%" src="./sompo.jpg"/>
        </td>
        <td style="margin:0; padding:0;">
            <img width="8%" src="./ibama.jpg"/>
        </td>
        <td style="margin:0; padding:0;">
            <img width="7%" src="./pf.jpg"/>
        </td>
    </tr>
</table>';
$mpdf->WriteHTML($parceiros);
// OBSERVAÇÕES DEFAULT
$observacoes = '<table style="border: 0.5px solid black; border-collapse:collapse; " width="100%">
    <tr>
        <td style="color:white; font-weight:bold; font-size:10px; text-align:center; background-color:Dimgrey; border: 0.5px solid black;">
            OBSERVAÇÕES GERAIS
        </td>
    </tr>
    <tr>
        <td style="font-size:8px;">
        01 - Viagem adicional para retirada/devolução de containers ou cancelamento de viagem na coleta, veículo fora da sua base operacional: 80% do Frete-Peso + pedagio Oficial.<br/>		
        02 - Cargas conteinerizadas com má distribuição interna de peso e que venha a ser multada por excesso de peso entre eixos mesmo conf. Art. 257 e 258 do CONTRAN, terão suas multas repassadas ao cliente bem como outros custos relativos a operação (transbordo, estivagem, guindastes, alfandegários, etc.).<br/>								
        03 - Carga solta: Cobrança pelo tipo de veículo a ser utilizado na operação, será cobrado o que for maior (peso ou cubagem).<br/>							
        04 - Prazo de pagamento: 10 dias da data de emissão de nosso DACTE ou NF.<br/>			
        05 - O valor do container será averbado para efeito de seguro. Dry 20 - R$ 40,000.00 / Dry - HC 40` -  R$  70.000.00 / Isotank 20` R$  100,000.00 / Reefer 20`/40` -  R$ 150,000.00.<br/>		
        06 - Inicio da proposta: a partir do aceite do cliente, ou de seu representante (agente de cargas, despachante ou procurador).<br/>								
        07 - Vigência do contrato:  30 (trinta) dias após aprovação formal, quando se tratar de cotações SPOT.<br/>								
        08 - Reajuste: Em conformidade com a lei 13.703 de 08/08/2018; no caso de pedágios será repassado imediatamente após o aumento; demais casos a negociar.<br/>			
        09 - Havendo o cancelamento de carregamento por quaisquer motivos (problemas na DTA, DTA-P, DI, DSI, DANFE, Exportação, etc.) que cause a dispensa do veículo já agendado e à diposição, será cobrado o valor de R$ 690,00 por veículo. Mesmo valor para segregar veículos para carregamento expresso com ou sem documentação liberada. Veiculos na cidade da base.<br/>		
        10 - Para mercadorias com valor acima do LMG - Limite Maximo de Garantia, torna-se OBRIGATÓRIO o uso de escolta armada e/ou utilização de outras medidas de segurança, conforme estabelecido no PGR - Plano de Gerenciamento de Risco, tais como o uso de escolta armada, isca/virus de carga, etc. Estes custos estão mencionados no item "ADICIONAIS-SE NECESSARIO".<br/>			
        11 - Não estão inclusos nesta proposta guindastes, empilhadeiras e outros equipamentos para carga/descarga.<br/>								
        12 -  A disponibilidade de estrados e material de peação para estufagem é de responsabilidade do cliente, quando não contratado nossos serviços.<br/>					
        13 - Rotas e roteiros são de responsabilidade da ACL CARGO, que utilizará rotas oficiais estabelecidas pelos orgãos competentes (RFB, ANTT, Seguradoras e Ger. Risco).<br/>		
        14 - A ACL CARGO , através de seus sócios, representantes, prepostos e empregados, consideram como confidenciais e assim tratam, todos os fatos e informações de que têm conhecimento, no desenvolvimento da prestação dos serviços e que não podem ser divulgados, conforme LGPD.<br/>	
        15 - Temos o compromisso de executar os serviços utilizando veículos adequados ao tipo de carga a ser transportada, devidamente licenciados e vistoriados pelos órgãos competentes, em  estado adequado geral quanto à aparência, conservação e funcionamento.<br/>			
        16 - Programação de carregamento: Agendamento em no mínimo 24 (vinte e quatro) horas, após o envio da toda a documentação devidamente desembaraçada e liberada, ou se expressamente autorizada a segregação de veículo e motorista sem que haja liberação ou documentação para agendamento/carregamento; documentação ou autorização essa a ser enviada dentro do horário comercial (das 08:00h as 17:00h de segunda a sexta), estando desde já o contratante ciente de que o não carregamento por motivos alheios ao transportador, implicará no pagamento de carregamento improdutivo previsto no ítem 1 ou 9 desta proposta comercial.<br/>			
        17 - O transit time entre a origem e o destino, será computado a partir da saída do veículo da origem, devidamente liberado pelos órgãos competentes para início de viagem, e respeitará a legislação vigente no que diz respeito a lei 12.619/2012 (lei do descanso). Não nos responsabilizamos por prazos de entrega não cumpridos se os fatores aqui descritos não forem respeitados, estando desde já o contratante ciente de que o tempo gasto no carregamento e na descarga são cumulativos para cobrança de estadias.<br/>						
        18 - Caso o cliente decida nos honrar com o acolhimento da proposta aqui encaminhada, solicitamos à V.Sa. que nos envie o aceite em meio eletrônico ou através de fax, passando esta a servir  como contratação formal dos serviços oferecidos; os serviços somente serão executados após aceite formal.<br/>	
        </td>
    </tr>
</table>';
$mpdf->WriteHTML($observacoes);

// VARIÁVEIS ASSINATURAS
$nome_proposta = "PROP $cliente". "_" . $variaveis['valorNumeroProposta'];

// VARIÁVEIS PUXANDO VALORES DE CIMA: $ref_cliente, $contato_cliente, $data_atual.

// CRIANDO TABLE ASSINATURAS
$assinatura = '<div style=" border:0.5px solid black; border-top:none;">
<table style=" text-align:center; margin-left:10%;" width="100%">
    <tr>
        <td></td>
        <td style="font-weight:bold">Nome da Proposta</td>
    </tr>
    <tr>
        <td style="font-weight:bold; border-top:1px solid black;">De Acordo</td>
        <td>' . $nome_proposta . ' / ' . $ref_cliente . ' / ' . $anoExibicao . '</td>
    </tr>
    <tr>
        <td style="color:blue; text-decoration:underline;">'. $contato_cliente .'</td>
        <td style="font-weight:bold">Data de Emissão da Proposta</td>
    </tr>
    <tr>
        <td></td>
        <td>'. $data_atual .'</td>
    </tr>
</table>
</div>';
$mpdf->WriteHTML($assinatura);

$mpdf->Output();
// Em "adicionais" e "adicionais se necessário" será necessário criar um if no backend com as possibilidades, em caso de valor 0, dependendo do caso, usar "isento" "não aplicável" "sob consulta" "conferir legislação" ou isento comercialmente. 
// Nesses dois, em caso de valor fixo, é importante acrescentar os sinais R$ - $ - % - € que não estarão no doc por conta das possibilidades acima.