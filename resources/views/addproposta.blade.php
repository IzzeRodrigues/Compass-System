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
                            <option selected disabled>Selecione...</option>
                            <option>Padrão</option>
                            <option>Estudo</option>
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
                                        <option selected disabled>Selecione...</option>
                                        <option>CA</option>
                                        <option>MM</option>
                                        <option>CR</option>
                                        <option>MP</option>
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
                    <div class="row">
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Contato</label>
                            <input type="text" class="form-control" placeholder="Ex:Amanda">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>E-mail Contato</label>
                            <input type="text" class="form-control" placeholder="Ex:amanda@copalog.com.br">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Tipo de Frete</label>
                            <select class="form-control">
                                <option selected disabled>Selecione...</option>
                                <option>Marítimo</option>
                                <option>Aéreo</option>
                                <option>Frete Interno</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-12 mb-3">
                            <label>Origem</label>
                            <div class="row">
                                <div class="col-md-6 col-12 mb-3">
                                    <select class="form-control">
                                        <option selected disabled>Selecione...</option>
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
                                        <option selected disabled>Selecione...</option>
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
                        <div class="col-md-12 col-sm-12 col-12 mb-3">
                            <label>Tipo de Container/Pallets</label>
                            <select class="form-control" id="tipoContainer" name="tipoContainer" onchange="verificarVeiculo();">
                                <option selected disabled>Selecione...</option>
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
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label>Tipo de Veículo</label>
                            <input type="text" class="form-control" placeholder="Ex: Carreta Baú" readonly id="tipoVeiculo" name="tipoVeiculo">
                        </div>
                        <div class="col-6 mb-3">
                            <label>Nº de Eixos</label>
                            <input type="text" class="form-control" placeholder="Ex:1" readonly id="numeroEixos_cabecalho" name="numeroEixos_cabecalho">
                        </div>
                    </div>
                    <div class="row">
                        <h3 class="mb-4">Operação</h3>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>Tipo de Operação</label>
                            <select class="form-control" id="tipoOperacao" name="tipoOperacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option selected disabled>Selecione...</option>
                                <option value="DTA">DTA</option>
                                <option value="DI">DI</option>
                                <option value="EXPO">EXPO</option>
                                <option value="DANFE">DANFE</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>Impostos</label>
                            <select class="form-control">
                                <option selected disabled>Selecione...</option>
                                <option>Simples Nacional</option>
                                <option>Lucro Presumido</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Mercadoria</label>
                            <input type="number" step=".01" name="quantity" min="0" class="form-control" id="valorMercadoria" name="valorMercadoria" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Container</label>
                            <input type="number" min="0" class="form-control" id="container" name="container" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Estacionamento</label>
                            <input type="number" min="0" class="form-control" id="valorEstacionamento" name="valorEstacionamento" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>IMO</label>
                            <input type="number" min="0" class="form-control" id="valorIMO" name="valorIMO" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Imp. Susp.</label>
                            <input type="number" min="0" class="form-control" id="porcentagemSusp" name="porcentagemSusp" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Imp. Susp.</label>
                            <input type="number" min="0" class="form-control" id="valorSusp" name="valorSusp" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total Imp. Seg.</label>
                            <input type="number" min="0" class="form-control" id="totalImpostoSeguro" name="totalImpostoSeguro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCTRC</label>
                            <input type="number" min="0" class="form-control" id="porcentagemRCTRC_operacao" name="porcentagemRCTRC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" min="0" class="form-control" id="valorRCTRC_operacao" name="valorRCTRC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Frete Peso</label>
                            <input type="number" min="0" class="form-control" id="fretePeso" name="fretePeso" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCFDC</label>
                            <input type="number" min="0" class="form-control" id="porcentagemRCFDC_operacao" name="porcentagemRCFDC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" min="0" class="form-control" id="valorRCFDC_operacao" name="valorRCFDC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>GRIS</label>
                            <select class="form-control" id="checkGRIS" name="checkGRIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% GRIS</label>
                            <input type="number" min="0" class="form-control" id="porcentagemGRIS" name="porcentagemGRIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total GRIS</label>
                            <input type="number" min="0" class="form-control" id="valorGRIS" name="valorGRIS" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio</label>
                            <input type="number" min="0" class="form-control" id="valorPedagio_operacao" name="valorPedagio_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Ajudantes</label>
                            <input type="number" min="0" class="form-control" id="valorAjudantes" name="valorAjudantes" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Sub Total</label>
                            <input type="number" min="0" class="form-control" id="subTotal" name="subTotal" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor ICMS</label>
                            <input type="number" min="0" class="form-control" id="valorICMS" name="valorICMS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% ICMS</label>
                            <input type="number" min="0" class="form-control" id="porcentagemICMS" name="porcentagemICMS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total da Prest</label>
                            <input type="number" min="0" class="form-control" id="totalPrest" name="totalPrest" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despesas</label>
                            <input type="number" min="0" class="form-control" id="valorDespesas" name="valorDespesas" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Bruto</label>
                            <input type="number" min="0" class="form-control" id="valorLucroBruto" name="valorLucroBruto" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Margem</label>
                            <input type="text" min="0" class="form-control" id="valorMargemLucro" name="valorMargemLucro" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor de Container</label>
                            <select class="form-control" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option selected disabled>Selecione...</option>
                                <option>20 Dry - R$30.000,00</option>
                                <option>40 Dry/HC - R$40.000,00</option>
                                <option>20/40 Refeer ou NOR - R$110.000,00</option>
                                <option>Demais unidades - CONSULTAR</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Carga</label>
                            <input type="number" min="0" class="form-control" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Moeda</label>
                            <input type="number" min="0" class="form-control" id="valorDolarReal" name="valorDolarReal" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Margem</label>
                            <input type="text" min="0" class="form-control" id="valorMargem" name="valorMargem" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>DTA GRU/VCP/BSB</label>
                            <input type="number" min="0" class="form-control" id="valorDTA_GVB" name="valorDTA_GVB" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <h3 class="mb-4">Despesas</h3>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Motorista Autônomo</label>
                            <input type="number" min="0" class="form-control" id="valorMotoristaAutonomo" name="valorMotoristaAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCFDC</label>
                            <input type="number" min="0" class="form-control" id="porcentabemRCFDC_despesa" name="porcentagemRCFDC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" min="0" class="form-control" id="valorRCFDC_despesa" name="valorRCFDC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCTRC</label>
                            <input type="number" min="0" class="form-control" id="porcentagemRCTRC_despesa" name="porcentagemRCTRC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" min="0" class="form-control" id="valorRCTRC_despesa" name="valorRCTRC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Desconto RCTRC</label>
                            <input type="number" min="0" class="form-control" id="valorDescontoRCTRC" name="valorDescontoRCTRC" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Motorista</label>
                            <input type="number" min="0" class="form-control" id="valorPedagio_despesa" name="valorPedagio_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>IRPJ</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Simples NAC</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% IRPJ</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Adic. IRPJ</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Adic. IRPJ</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>PIS</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% PIS</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>COFINS</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% COFINS</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>ICMS</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Buonny Cadastro</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>GRIS Rastreamento</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Estacionamento</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despacho BSB</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despesas</label>
                            <input type="number" min="0" class="form-control" id="" name="" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Simplifica Comissão</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Simp Comissão</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Comissão</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Comissão</label>
                            <input type="number" min="0" class="form-control" id="" name="" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                    </div>
                    <div class="row">

                    </div>
                    <div class="row">
                        <h3>Carga</h3>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Tipo de Carga</label>
                            <select class="form-control">
                                <option selected disabled>Selecione...</option>
                                <option>Carga Geral</option>
                                <option>Granel Sólido</option>
                                <option>Conteinerizada</option>
                                <option>Perigosa - Carga Geral</option>
                                <option>Perigosa - Granel Sólido</option>
                                <option>Perigosa - Conteinerizada</option>
                                <option>Neogranel</option>
                                <option>Granel Líquido</option>
                                <option>Frigorificada</option>
                                <option>Perigosa - Granel Líquido</option>
                                <option>Perigosa - Frigorificada</option>
                            </select>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor por eixo</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Quant. De Eixos</label>
                            <input type="number" min="0" class="form-control" id="numeroEixos_carga" name="numeroEixos_carga"readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>KM Ida</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>KM Volta</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total de KM</label>
                            <input type="number" min="0" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Ida/Eixo</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Volta/Eixo</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Consumo Médio KM/L</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Preço/Litro do Combustível</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Combustível total(Lts)</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Total Combustível</label>
                            <input type="number" min="0" class="form-control" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Total Pedágio</label>
                            <input type="number" min="0" class="form-control" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Despesa Total Viagem</label>
                            <input type="number" min="0" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Eixo para LS</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio para LS</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Margem %</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Total Adic. LS</label>
                            <input type="number" min="0" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Frete Valor Negociável</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Valor Negociável</label>
                            <input type="number" min="0" class="form-control">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Frete + Pedag. Negoc.</label>
                            <input type="number" min="0" class="form-control">
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
