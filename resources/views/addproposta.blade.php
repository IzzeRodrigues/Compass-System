@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Adicionar Proposta')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
            <script src="/js/proposta.js"></script>
            <div class="container-fluid px-4 blue-compass">
                <h1 class="mt-4">Proposta</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Criar Proposta</li>
                </ol>
                <form class="proposta" action="">
                    <div class="col-md-3 col-sm-6 col-4 mb-3">
                        <label>Tipo Proposta</label>
                        <select class="form-control">
                            <option value="naoSelecionado" selected disabled>Selecione...</option>
                            <option value="tipoPadrao">Padrão</option>
                            <option value="tipoEstudo">Estudo</option>
                        </select>
                    </div>
                    <div class="row">
                        <h3 class="mb-4 blue-compass">Cabeçalho</h3>
                        <div class="col-md-3 col-sm-12 col-12 mb-3">
                            <label>Responsável</label>
                            <input type="text" class="form-control" readonly placeholder="Responsável" id="nomeResponsavel" name="nomeResponsavel">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>E-mail Responsável</label>
                            <input type="text" class="form-control" readonly placeholder="Email@aclcargo.com.br" id="emailResponsavel" name="emailResponsavel">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Cargo</label>
                            <input type="text" class="form-control" readonly placeholder="Vendas e Relacionamento" id="cargoResponsavel" name="cargoResponsavel">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Data da Proposta</label>
                            <input type="date" class="form-control data" id="dataProposta" name="dataProposta">
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-6 col-sm-6 col-12 mb-3">
                            <label>Referência ACL</label>
                            <div class="row">
                                <div class="col-md-4 col-sm-4 col-4 mb-3">
                                    <select class="form-control">
                                        <option value="naoSelecionado" selected disabled>Selecione...</option>
                                        <option value="referenciaCA">CA</option>
                                        <option value="referenciaMM">MM</option>
                                        <option value="referenciaCR">CR</option>
                                        <option value="referenciaMP">MP</option>
                                    </select>
                                </div>
                                <div class="col-md-4 col-sm-5 col-4 mb-3">
                                    <input type="number" class="form-control" placeholder="Nº Proposta" readonly  id="numeroProposta" name="numeroProposta">
                                </div>
                                <div class="col-md-4 col-sm-3 col-4 mb-3">
                                    <input type="number" class="form-control" placeholder="Versão"readonly  id="versaoProposta" name="versaoProposta">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Referência Cliente</label>
                            <input type="text" class="form-control" placeholder="Ex:INX-Rique/Guatemala">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Horário de Recebimento</label>
                            <input type="text" class="form-control" placeholder="A combinar">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Produto</label>
                            <input type="text" class="form-control" placeholder="Ex:Print Ink (IMO) Class 3">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Quant/Embalagem</label>
                            <input type="text" class="form-control" placeholder="Ex:8 Pallets" id="pallets" name="pallets" onchange="verificarVeiculo()">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Peso Total/Cubagem</label>
                            <input type="text" class="form-control" placeholder="Ex:6161kg (6,656m3)">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Nome da Empresa</label>
                            <input type="text" class="form-control" placeholder="Ex:Copa Logística">
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-4 col-sm-4 col-12 mb-3">
                            <label>Contato</label>
                            <input type="text" class="form-control" placeholder="Ex:Amanda">
                        </div>
                        <div class="col-md-4 col-sm-4 col-12 mb-3">
                            <label>E-mail Contato</label>
                            <input type="text" class="form-control" placeholder="Ex:amanda@copalog.com.br">
                        </div>
                        <div class="col-md-4 col-sm-4 col-12 mb-3">
                            <label>Tipo de Frete</label>
                            <select class="form-control">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="freteMaritimo">Marítimo</option>
                                <option value="freteAereo">Aéreo</option>
                                <option value="freteInterno">Frete Interno</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-12 mb-3">
                            <label>Origem</label>
                            <div class="row">
                                <div class="col-md-6 col-12 mb-3">
                                    <select class="form-control">
                                        <option value="naoSelecionado" selected disabled>Selecione...</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espírito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <input type="text" class="form-control" placeholder="Ex: Santos(Margem Direita)">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-12 mb-3">
                            <label>Destino</label>
                            <div class="row">
                                <div class="col-md-6 col-12 mb-3">
                                    <select class="form-control">
                                        <option value="naoSelecionado" selected disabled>Selecione...</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espírito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-12 mb-3">
                                    <input type="text" class="form-control" placeholder="Ex: Poços de Calda">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mb-3">
                            <label>Devolução(Se houver em caso de FCL)</label>
                            <input type="text" class="form-control" placeholder="Ex: Container vazio retirado REDEX Margem Direita (EXPO)">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-12 mb-3">
                            <label>Tipo de Container/Pallets</label>
                            <select class="form-control" id="tipoContainer" name="tipoContainer" onchange="verificarVeiculo();">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="container20">Container de 20' - até 14,5 tons bruto (carga + tara)</option>
                                <option value="container40-25tons">Container de 20' / 40 - até 25 tons bruto (carga + tara)</option>
                                <option value="container40-30tons">Container de 20' / 40' até 30 tons bruto (carga + tara)</option>
                                <option value="container500kg">Até 500 / 1m³ / 01 pallet</option>
                                <option value="container1200kg">De 501 a 1200Kg / 1,01 a 10m³ / 02 pallets</option>
                                <option value="container3500kg">De 1201 a 3500Kg / 10,1 a 22m³ / 06 pallets</option>
                                <option value="container6000kg">De 3501 a 6000Kg / 22,1 a 35m³ / 10 pallets</option>
                                <option value="container12000kg">De 6001 a 12000Kg / 35,1 a 45m³ / 14 pallets</option>
                                <option value="container25000kg">De 12001 a 25000Kg / 45,1 a 76m³ / 26 pallets</option>
                                <option value="outros">Outros</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 mb-3">
                            <label>Tipo de Veículo</label>
                            <input type="text" class="form-control" placeholder="Ex: Carreta Baú" readonly id="tipoVeiculo" name="tipoVeiculo">
                        </div>
                        <div class="col-md-3 col-sm-6 mb-3">
                            <label>Nº de Eixos</label>
                            <input type="text" class="form-control" placeholder="Ex:1" readonly id="valorEixos_cabecalho" name="valorEixos_cabecalho">
                        </div>
                    </div>
                    <div class="row">
                        
                    </div>
                    <div class="row">
                        <h3 class="mb-4">Operação</h3>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>Tipo de Operação</label>
                            <select class="form-control" id="tipoOperacao" name="tipoOperacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="DTA">DTA</option>
                                <option value="DI">DI</option>
                                <option value="EXPO">EXPO</option>
                                <option value="DANFE">DANFE</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>Impostos</label>
                            <select class="form-control" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado"selected disabled>Selecione...</option>
                                {{-- <option value="simplesNacional">Simples Nacional</option> --}}
                                <option value="lucroPresumido">Lucro Presumido</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Mercadoria</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorMercadoria" name="valorMercadoria" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Container</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="container" name="container" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Imp. Susp.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemSusp" name="porcentagemSusp" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Imp. Susp.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorImpostoSuspenso" name="valorImpostoSuspenso" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total Imp. Seg.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorTotalImpostoSeguro" name="valorTotalImpostoSeguro" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Frete Peso</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorFretePeso_operacao" name="valorFretePeso_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemRCTRC_operacao" name="porcentagemRCTRC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorRCTRC_operacao" name="valorRCTRC_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemRCFDC_operacao" name="porcentagemRCFDC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorRCFDC_operacao" name="valorRCFDC_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>GRIS</label>
                            <select class="form-control" id="valorCheckGRIS" name="valorCheckGRIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% GRIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemGRIS" name="porcentagemGRIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total GRIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorGRIS" name="valorGRIS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPedagio_operacao" name="valorPedagio_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Estacionamento</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorEstacionamento" name="valorEstacionamento" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>IMO</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorIMO" name="valorIMO" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>DTA GRU/VCP/BSB</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorDTA_GVB" name="valorDTA_GVB" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Ajudantes</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorAjudantes_operacao" name="valorAjudantes_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemICMS" name="porcentagemICMS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorICMS" name="valorICMS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Sub Total</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="subTotal" name="subTotal" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total da Prest</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorTotalPrest" name="valorTotalPrest" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Total da Prest</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemTotalPrest" name="porcentagemTotalPrest" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despesas</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorDespesas_operacao" name="valorDespesas_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Bruto</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorLucroBruto" name="valorLucroBruto" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Lucro Bruto</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemLucroBruto" name="porcentagemLucroBruto" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 form-group mb-3">
                            <label>Margem</label>
                            <input type="text" min="0" class="form-control" id="valorMargemLucroBruto" name="valorMargemLucroBruto" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                    </div>
                    <div class="row">

                    </div>
                    <div class="row">
                        <h3 class="mb-4">Despesas</h3>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Motorista Autônomo</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorMotoristaAutonomo" name="valorMotoristaAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Motorista</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPedagio_despesa" name="valorPedagio_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemRCFDC_despesa" name="porcentagemRCFDC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorRCFDC_despesa" name="valorRCFDC_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemRCTRC_despesa" name="porcentagemRCTRC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorRCTRC_despesa" name="valorRCTRC_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Simples NAC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemSimplesNAC" name="porcentagemSimplesNAC" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Simples NAC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorSimplesNAC" name="valorSimplesNAC" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemIRPJ" name="porcentagemIRPJ" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorIRPJ" name="valorIRPJ" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Adic. IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemAdicionalIRPJ" name="porcentagemAdicionalIRPJ" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Adic. IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorAdicionalIRPJ" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>       
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% PIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemPIS" name="porcentagemPIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>       
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>PIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPIS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% COFINS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemCOFINS" name="porcentagemCOFINS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>COFINS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorCOFINS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>                  
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemICMS_despesa" name="porcentagemICMS_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorICMS_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Buonny Cadastro</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorBuonnyCadastro" name="valorBuonnyCadastro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>GRIS Rastreamento</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorGRISRastreamento" name="valorGRISRastreamento" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>DTA/DI - Terceirizado</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorDTA_DI" name="valorDTA_DI" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Estacionamento</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorEstacionamento_despesa" name="valorEstacionamento_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Ajudantes</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorAjudantes_despesa" name="valorAjudantes_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Profit</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorProfit" name="valorProfit" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Comissão</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorComissao" name="valorComissao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Comissão</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemComissao" name="porcentagemComissao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despesas</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorDespesas_despesa" name="valorDespesas_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                    </div>
                    <div class="row">
                        <h3>Carga</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Tipo de Carga</label>
                            <select class="form-control" id="valorTipoCarga" name="valorTipoCarga" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled >Selecione...</option>
                                <option value="cargaGeral">Carga Geral</option>
                                <option value="granelSolido">Granel Sólido</option>
                                <option value="conteinerizada">Conteinerizada</option>
                                <option value="neogranel">Neogranel</option>
                                <option value="granelLiquido">Granel Líquido</option>
                                <option value="frigorificada">Frigorificada</option>
                                <option value="perigosaCargaGeral">Perigosa - Carga Geral</option>
                                <option value="perigosaGranelSolido">Perigosa - Granel Sólido</option>
                                <option value="perigosaConteinerizada">Perigosa - Conteinerizada</option>
                                <option value="perigosaGranelLiquido">Perigosa - Granel Líquido</option>
                                <option value="perigosaFrigorificada">Perigosa - Frigorificada</option>
                            </select>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Quant. De Eixos</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorEixos_carga" name="valorEixos_carga" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>KM Ida</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorQuilometragemIda" name="valorQuilometragemIda" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>KM Volta</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorQuilometragemVolta" name="valorQuilometragemVolta" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Total de KM</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorQuilometragemTotal" name="valorQuilometragemTotal" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Ida/Eixo</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPedagioEixoIda" name="valorPedagioEixoIda" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Volta/Eixo</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPedagioEixoVolta" name="valorPedagioEixoVolta" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Consumo Médio KM/L</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorConsumoMedioQuilometroLitro" name="valorConsumoMedioQuilometroLitro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Preço/Litro do Combustível</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPrecoCombustivelLitro" name="valorPrecoCombustivelLitro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Combustível total(Lts)</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorTotalCombustivelLitros" name="valorTotalCombustivelLitros" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Total Combustível</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorTotalCombustivel" name="valorTotalCombustivel" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Total Pedágio</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPedagio_carga" name="valorPedagio_carga" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Despesa Total Viagem</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorTotalDespesaViagem" name="valorTotalDespesaViagem" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">

                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Carga USD/EUR</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorCargaUSD_EUR" name="valorCargaUSD_EUR" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Moeda</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="tipoMoedaEstrangeira" name="tipoMoedaEstrangeira" onblur="calcularImpostos();setMoeda(valoresMoedas)" onchange="calcularImpostos();setMoeda(valoresMoedas)">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="dolar">Dólar</option>
                                <option value="euro">Euro</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Cotação</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorMoedaEstrangeira" name="valorMoedaEstrangeira" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Carga BRL</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorCargaBRL" name="valorCargaBRL" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <h3>Frete Peso</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Frete Peso</label>
                            <input type="text" class="form-control" id="valorFretePeso_fretePeso" name="valorFretePeso_fretePeso" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Percentual</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="porcentagemPercentualFretePeso" name="porcentagemPercentualFretePeso" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <h3>Motorista</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valores</label>
                            <input type="text" class="form-control" id="valorValores" name="valorValores" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Frete Conf. ANTT</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorFreteANTT" name="valorFreteANTT" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Vale Pedágio Tabela</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorPedagio_motorista" name="valorPedagio_motorista" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Total Aut. Tabela</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorTotalAutonomo" name="valorTotalAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Total Aut. Tabela</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorLucroTotalAutonomo" name="valorLucroTotalAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Frete All In Fechado</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorFreteAllFechado" name="valorFreteAllFechado" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Frete All In Fechado</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorLucroFreteAllFechado" name="valorLucroFreteAllFechado" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Tentar Fechar Em</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorFreteFecharEm" name="valorFreteFecharEm" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Tentar Fechar Em</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="valorLucroFreteFecharEm" name="valorLucroFreteFecharEm" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <h3>Cotação Autônomo</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Nome Motorista</label>
                            <input type="text" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Data da Cotação</label>
                            <input type="date" class="form-control data" id="dataProposta" name="dataProposta">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor</label>
                            <input type="number" step=0.01 min="0" class="form-control">
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Nome Motorista</label>
                            <input type="text" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Data da Cotação</label>
                            <input type="date" class="form-control data" id="dataProposta" name="dataProposta">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor</label>
                            <input type="number" step=0.01 min="0" class="form-control">
                        </div>
                    </div>
                    <div class="row justify-content-end mt-1">
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="button">Salvar</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="button">Gerar PDF</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="button">Ass. Digital</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="button">Cancelar</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
        <script>inicioProposta()</script>
        @stop
        @stop
    </div>


</body>
</html>
