@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="editViewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/favicon/favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Ver/Editar Proposta')
    <div id="editlayoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
            <script src="/js/proposta.js"></script>
            <div class="container-fluid px-4 blue-compass">
                <h1 class="mt-4">Proposta</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Ver/Editar Proposta</li>
                </ol>
                <form class="proposta" method="GET" action="http://localhost:8000/acoesProposta" target="_blank">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-4 mb-3">
                            <label>Tipo Proposta</label>
                            <select class="form-control">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="tipoPadrao">Padrão</option>
                                <option value="tipoEstudo">Estudo</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-4 mb-3 d-flex justify align-items-end">
                            <button class="btn btn-info btn-block shadow-sm corpadrao col-12" onclick="preencherInputs()" type="button">Preencher proposta</button>
                        </div>
                    </div>
                    <div class="row">
                        <h3 class="mb-4 blue-compass">Cabeçalho</h3>
                        <div class="col-md-3 col-sm-12 col-12 mb-3">
                            <label>Filial ACL Group</label>
                            <select class="form-control" id="editFilialACL" name="editFilialACL">
                                <option value="naoSelecionado">Selecione...</option>
                                <option value="ACL Cargo Matriz-06.695.952/0001-53">ACL Cargo Matriz</option>
                                <option value="ACL Cargo Anápolis-06.695.952/0004-04">ACL Cargo Anápolis</option>
                                <option value="ACL Cargo Paranaguá-06.695.952/0005-87">ACL Cargo Paranaguá</option>
                                <option value="ACL Cargo Santos-06.695.952/0003-15">ACL Cargo Santos</option>
                                <option value="ACL Cargo Rio de Janeiro-06.695.952/0002-34">ACL Cargo Rio de Janeiro</option>
                                <option value="ACL Cargo São Vicente-06.695.952/0006-68">ACL Cargo São Vicente</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-12 col-12 mb-3">
                            <label>Responsável</label>
                            <input type="text" class="form-control" readonly placeholder="Responsável" id="editNomeResponsavel" name="editNomeResponsavel">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>E-mail Responsável</label>
                            <input type="text" class="form-control" readonly placeholder="Email@aclcargo.com.br" id="editEmailResponsavel" name="editEmailResponsavel">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>CPF Responsável</label>
                            <input type="text" class="form-control" placeholder="CPF" id="editCPFResponsavel" name="editCPFResponsavel">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Cargo</label>
                            <input type="text" class="form-control" readonly placeholder="Vendas e Relacionamento" id="editCargoResponsavel" name="editCargoResponsavel">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Data da Proposta</label>
                            <input type="date" class="form-control data" id="editValorDataProposta" name="editValorDataProposta" readonly>
                        </div>
                        <div class="col-md-6 col-sm-6 col-12 mb-3">
                            <label>Referência ACL</label>
                            <div class="row">
                                <div class="col-md-4 col-sm-4 col-4">
                                    <select class="form-control" id="editValorReferenciaProposta" name="editValorReferenciaProposta">
                                        <option value="naoSelecionado" selected disabled>Selecione...</option>
                                        <option value="CA">CA</option>
                                        <option value="MM">MM</option>
                                        <option value="CR">CR</option>
                                        <option value="MP">MP</option>
                                    </select>
                                </div>
                                <div class="col-md-4 col-sm-5 col-4">
                                    <input type="number" class="form-control" placeholder="Nº Proposta" readonly id="editValorNumeroProposta" name="editValorNumeroProposta">
                                </div>
                                <div class="col-md-4 col-sm-3 col-4">
                                    <input type="text" class="form-control" placeholder="Versão" readonly id="editValorVersaoProposta" name="editValorVersaoProposta">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Referência Cliente</label>
                            <input type="text" class="form-control" placeholder="Ex:INX-Rique/Guatemala" id="editValorReferenciaCliente" name="editValorReferenciaCliente">
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Horário de Recebimento</label>
                            <input type="text" class="form-control" placeholder="A combinar" id="editValorHorarioRecebimento" name="editValorHorarioRecebimento">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Produto</label>
                            <input type="text" class="form-control" placeholder="Ex:Print Ink (IMO) Class 3" id="editValorNomeProduto" name="editValorNomeProduto">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Quant./Embalagem</label>
                            <input type="text" class="form-control" placeholder="Ex:8 Pallets" id="editValorPallets" name="editValorPallets">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Peso Total em Kg./Cubagem</label>
                            <input type="text" class="form-control" placeholder="Ex:6161kg (6,656m3)" id="editValorPeso" name="editValorPeso">
                        </div>

                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Nome da Empresa</label>
                            <input type="text" class="form-control" placeholder="Ex:Copa Logística" id="editValorNomeCliente" name="editValorNomeCliente">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Contato</label>
                            <input type="text" class="form-control" placeholder="Ex:Amanda" id="editValorNomeContatoCliente" name="editValorNomeContatoCliente">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>E-mail Contato</label>
                            <input type="text" class="form-control" placeholder="Ex:amanda@copalog.com.br" id="editValorEmailContatoCliente" name="editValorEmailContatoCliente">
                        </div>
                        <div class="col-md-3 col-sm-4 col-12 mb-3">
                            <label>Tipo de Frete</label>
                            <select class="form-control" id="editValorTipoFrete" name="editValorTipoFrete" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="FRETE MAR">Marítimo</option>
                                <option value="freteAereo">Aéreo</option>
                                <option value="freteInterno">Frete Interno</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Origem</label>
                            <div class="row">
                                <div class="col-md-12 col-12">
                                    <select class="form-control" id="editValorEstadoOrigem" name="editValorEstadoOrigem" onblur="calcularImpostos()" onchange="calcularImpostos()">
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
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Cidade de Origem</label>
                            <input type="text" class="form-control" placeholder="Ex: Santos(Margem Direita)" id="editValorCidadeOrigem" name="editValorCidadeOrigem">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Destino</label>
                            <div class="row">
                                <div class="col-md-12 col-12">
                                    <select class="form-control" id="editValorEstadoDestino" name="editValorEstadoDestino" onblur="calcularImpostos()" onchange="calcularImpostos()">
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
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Cidade de Destino</label>
                            <input type="text" class="form-control" placeholder="Ex: Poços de Calda" id="editValorCidadeDestino" name="editValorCidadeDestino">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mb-3">
                            <label>Devolução(Se houver em caso de FCL)</label>
                            <input type="text" class="form-control" placeholder="Ex: Container vazio retirado REDEX Margem Direita (EXPO)" id="editValorLocalDevolucao" name="editValorLocalDevolucao">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-12 mb-3">
                            <label>Tipo de Container/Pallets</label>
                            <select class="form-control" id="editValorTipoContainer" name="editValorTipoContainer" onchange="verificarVeiculo();">
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
                            <input type="text" class="form-control" placeholder="Ex: Carreta Baú" readonly id="editValorTipoVeiculo" name="editValorTipoVeiculo">
                        </div>
                        <div class="col-md-3 col-sm-6 mb-3">
                            <label>Nº de Eixos</label>
                            <input type="text" class="form-control" placeholder="Ex:1" readonly id="editValorEixos_cabecalho" name="editValorEixos_cabecalho">
                        </div>
                    </div>
                    <div class="row">

                    </div>
                    <div class="row">
                        <h3 class="mb-4">Operação</h3>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>Tipo de Operação</label>
                            <select class="form-control" id="editTipoOperacao" name="editTipoOperacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="DTA">DTA</option>
                                <option value="DI">DI</option>
                                <option value="EXPO">EXPO</option>
                                <option value="DANFE">DANFE</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>Impostos</label>
                            <select class="form-control" id="editTipoImpostos" name="editTipoImpostos" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado"selected disabled>Selecione...</option>
                                {{-- <option value="simplesNacional">Simples Nacional</option> --}}
                                <option value="lucroPresumido">Lucro Presumido</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Mercadoria</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorMercadoria" name="editValorMercadoria" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Container</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editContainer" name="editContainer" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Imp. Susp.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemSusp" name="editPorcentagemSusp" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Imp. Susp.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorImpostoSuspenso" name="editValorImpostoSuspenso" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total Imp. Seg.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorTotalImpostoSeguro" name="editValorTotalImpostoSeguro" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Frete Peso</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorFretePeso_operacao" name="editValorFretePeso_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemRCTRC_operacao" name="editPorcentagemRCTRC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorRCTRC_operacao" name="editValorRCTRC_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemRCFDC_operacao" name="editPorcentagemRCFDC_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorRCFDC_operacao" name="editValorRCFDC_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 mb-3">
                            <label>GRIS</label>
                            <select class="form-control" id="editValorCheckGRIS" name="editValorCheckGRIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% GRIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemGRIS" name="editPorcentagemGRIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total GRIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorGRIS" name="editValorGRIS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPedagio_operacao" name="editValorPedagio_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Estacionamento</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorEstacionamento_operacao" name="editValorEstacionamento_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>IMO</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorIMO" name="editValorIMO" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>DTA GRU/VCP/BSB</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorDTA_GVB" name="editValorDTA_GVB" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Ajudantes</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorAjudantes_operacao" name="editValorAjudantes_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemICMS_operacao" name="editPorcentagemICMS_operacao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorICMS_operacao" name="editValorICMS_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Sub. Total</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editSubTotal" name="editSubTotal" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Total da Prest.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorTotalPrest" name="editValorTotalPrest" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Total da Prest.</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemTotalPrest" name="editPorcentagemTotalPrest" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despesas</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorDespesas_operacao" name="editValorDespesas_operacao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Bruto</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorLucroBruto" name="editValorLucroBruto" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Lucro Bruto</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemLucroBruto" name="editPorcentagemLucroBruto" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 form-group mb-3">
                            <label>Margem</label>
                            <input type="text" min="0" class="form-control" id="editValorMargemLucroBruto" name="editValorMargemLucroBruto" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                    </div>
                    <div class="row">

                    </div>
                    <div class="row">
                        <h3 class="mb-4">Despesas</h3>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Motorista Autônomo</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorMotoristaAutonomo" name="editValorMotoristaAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Motorista</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPedagio_despesa" name="editValorPedagio_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemRCFDC_despesa" name="editPorcentagemRCFDC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorRCFDC_despesa" name="editValorRCFDC_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemRCTRC_despesa" name="editPorcentagemRCTRC_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorRCTRC_despesa" name="editValorRCTRC_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Simples NAC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemSimplesNAC" name="editPorcentagemSimplesNAC" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Simples NAC</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorSimplesNAC" name="editValorSimplesNAC" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemIRPJ" name="editPorcentagemIRPJ" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorIRPJ" name="editValorIRPJ" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Adic. IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemAdicionalIRPJ" name="editPorcentagemAdicionalIRPJ" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Adic. IRPJ</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorAdicionalIRPJ" name="editValorAdicionalIRPJ" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% PIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemPIS" name="editPorcentagemPIS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>PIS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPIS" name="editValorPIS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% COFINS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemCOFINS" name="editPorcentagemCOFINS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>COFINS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorCOFINS" name="editValorCOFINS" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemICMS_despesa" name="editPorcentagemICMS_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>ICMS</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorICMS_despesa" name="editValorICMS_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Buonny Cadastro</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorBuonnyCadastro" name="editValorBuonnyCadastro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>GRIS Rastreamento</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorGRISRastreamento" name="editValorGRISRastreamento" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>DTA/DI - Terceirizado</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorDTA_DI" name="editValorDTA_DI" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Estacionamento</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorEstacionamento_despesa" name="editValorEstacionamento_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Ajudantes</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorAjudantes_despesa" name="editValorAjudantes_despesa" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Profit</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorProfit" name="editValorProfit" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Comissão</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorComissao" name="editValorComissao" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Comissão</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemComissao" name="editPorcentagemComissao" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Despesas</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorDespesas_despesa" name="editValorDespesas_despesa" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>

                    </div>
                    <div class="row">
                        <h3>Carga</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Tipo de Carga</label>
                            <select class="form-control" id="editValorTipoCarga" name="editValorTipoCarga" onblur="calcularImpostos()" onchange="calcularImpostos()">
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
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorEixos_carga" name="editValorEixos_carga" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>KM Ida</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorQuilometragemIda" name="editValorQuilometragemIda" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>KM Volta</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorQuilometragemVolta" name="editValorQuilometragemVolta" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Total de KM</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorQuilometragemTotal" name="editValorQuilometragemTotal" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Ida/Eixo</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPedagioEixoIda" name="editValorPedagioEixoIda" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Pedágio Volta/Eixo</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPedagioEixoVolta" name="editValorPedagioEixoVolta" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Consumo Médio KM/L</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorConsumoMedioQuilometroLitro" name="editValorConsumoMedioQuilometroLitro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Preço/Litro do Combustível</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPrecoCombustivelLitro" name="editValorPrecoCombustivelLitro" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Combustível total(Lts)</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorTotalCombustivelLitros" name="editValorTotalCombustivelLitros" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Total Combustível</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorTotalCombustivel" name="editValorTotalCombustivel" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Total Pedágio</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPedagio_carga" name="editValorPedagio_carga" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Despesa Total Viagem</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorTotalDespesaViagem" name="editValorTotalDespesaViagem" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">

                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Carga USD/EUR</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorCargaUSD_EUR" name="editValorCargaUSD_EUR" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Moeda</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editTipoMoedaEstrangeira" name="editTipoMoedaEstrangeira" onblur="calcularImpostos();setMoeda(valoresMoedas)" onchange="calcularImpostos();setMoeda(valoresMoedas)">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="dolar">Dólar</option>
                                <option value="euro">Euro</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Cotação</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorMoedaEstrangeira" name="editValorMoedaEstrangeira" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor da Carga BRL</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorCargaBRL" name="editValorCargaBRL" readonly onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <h3>Frete Peso</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Frete Peso</label>
                            <input type="text" class="form-control" id="editValorFretePeso_fretePeso" name="editValorFretePeso_fretePeso" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Percentual</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editPorcentagemPercentualFretePeso" name="editPorcentagemPercentualFretePeso" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row">
                        <h3>Motorista</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valores</label>
                            <input type="text" class="form-control" id="editValorValores" name="editValorValores" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Frete Conf. ANTT</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorFreteANTT" name="editValorFreteANTT" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Vale Pedágio Tabela</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorPedagio_motorista" name="editValorPedagio_motorista" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Total Aut. Tabela</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorTotalAutonomo" name="editValorTotalAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Total Aut. Tabela</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorLucroTotalAutonomo" name="editValorLucroTotalAutonomo" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Frete All In Fechado</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorFreteAllFechado" name="editValorFreteAllFechado" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Frete All In Fechado</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorLucroFreteAllFechado" name="editValorLucroFreteAllFechado" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Tentar Fechar Em</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorFreteFecharEm" name="editValorFreteFecharEm" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Lucro Tentar Fechar Em</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorLucroFreteFecharEm" name="editValorLucroFreteFecharEm" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <h3>Cotação Autônomo</h3>
                        <div class="col-md-4 col-sm-6 col-12 form-group mb-3">
                            <label>Nome Motorista</label>
                            <input type="text" min="0" class="form-control" id="editMotoristaCotado1" name="editMotoristaCotado1" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>Data da Cotação</label>
                            <input type="date" class="form-control data" id="editDataCotacaoMotorista1" name="editDataCotacaoMotorista1" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 form-group mb-3">
                            <label>Valor</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorMotoristaCotado1" name="editValorMotoristaCotado1" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-4 col-sm-6 col-12 form-group mb-3">
                            <label>Nome Motorista</label>
                            <input type="text" min="0" class="form-control" id="editMotoristaCotado2" name="editMotoristaCotado2" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>Data da Cotação</label>
                            <input type="date" class="form-control data" id="editDataCotacaoMotorista2" name="editDataCotacaoMotorista2" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 form-group mb-3">
                            <label>Valor</label>
                            <input type="number" step=0.01 min="0" class="form-control" id="editValorMotoristaCotado2" name="editValorMotoristaCotado2" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <h3>Adicionais</h3>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Utilização de isca</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoUtilizacaoIsca" name="editValorTipoUtilizacaoIsca" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Utilizacao Isca</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorUtilizacaoIsca" name="editValorUtilizacaoIsca" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Monitoramento de isca</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoMonitoramentoIsca" name="editValorTipoMonitoramentoIsca" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Monitoramento Isca</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorMonitoramentoIsca" name="editValorMonitoramentoIsca" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Escolta Armada</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoEscoltaArmada" name="editValorTipoEscoltaArmada" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Escolta Armada</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorEscoltaArmada" name="editValorEscoltaArmada" onblur="calcularImpostos()" onchange="calcularImpostos()">
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Adicional Carga IMO</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoAdicionalCargaIMO" name="editValorTipoAdicionalCargaIMO" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Adc Carga IMO</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorAdicionalCargaIMO" name="editValorAdicionalCargaIMO" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Carregamento Expresso</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoCarregamentoExpresso" name="editValorTipoCarregamentoExpresso" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                                <option value="insento">Isento Comercialmente</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Carregamento Expresso</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorCarregamentoExpresso" name="editValorCarregamentoExpresso" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Utilização Cavalo LS</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoUtilizacaoCavaloLS" name="editValorTipoUtilizacaoCavaloLS" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Cavalo LS</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorUtilizacaoCavaloLS" name="editValorUtilizacaoCavaloLS" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Estadia Especial</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoEstadiaEspecial" name="editValorTipoEstadiaEspecial" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Estadia Especial</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorEstadiaEspecial" name="editValorEstadiaEspecial" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 mb-3">
                            <label>Sobrestadia Carregamento</label>
                            <select type="number" step=0.01 min="0" class="form-control" id="editValorTipoSobrestadiaCarregamento" name="editValorTipoSobrestadiaCarregamento" onblur="calcularImpostos()" onchange="calcularImpostos()">
                                <option value="naoSelecionado" selected disabled>Selecione...</option>
                                <option value="sim">Sim</option>
                                <option value="nao">Não</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Valor Sobrestadia Carregamento</label>
                            <input type="text" step=0.01 min="0" class="form-control" id="editValorSobrestadiaCarregamento" name="editValorSobrestadiaCarregamento" onblur="calcularImpostos()" onchange="calcularImpostos()" readonly>
                        </div>
                    </div>
                    <div class="row justify-content-end mt-1">
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-2 col-sm-6">
                            <input class="btn btn-info btn-block shadow-sm corpadrao larg-btn col-12 py-2" type="submit" value="Salvar" name="editBotaoSalvar">
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-2 col-sm-6">
                            <input class="btn btn-info btn-block shadow-sm corpadrao larg-btn col-12 py-2" type="submit" value="Usar Proposta" name="editBotaoProposta">
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-2 col-sm-6">
                            <input class="btn btn-info btn-block shadow-sm corpadrao larg-btn col-12 py-2" type="submit" value="Ass. Fisicamente" name="editBotaoAssinarFisicamente">
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-2 col-sm-6">
                            <input class="btn btn-info btn-block shadow-sm corpadrao larg-btn col-12 py-2" type="submit" value="Ass. Digitalmente" name="editBotaoAssinarDigitalmente">
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-2 col-sm-6">
                            <input class="btn btn-info btn-block shadow-sm corpadrao larg-btn col-12 py-2" type="submit" value="Cancelar" name="editBotaoCancelar">
                        </div>

                    </div>
                </form>
            </div>
        </main>
        <script>inicioProposta()</script>
        <script src="dist/jquery.inputmask.js"></script>
        @stop
        @stop
    </div>


</body>
</html>
