let puxouMoeda = false;
let valoresMoedas;
let puxouICMS = false;
let combinacaoICMS;

function inicioProposta()
{
    // let email = "emailUsuario=";
    // let nome = "nomeUsuario=";
    // let decodificacaoCookie = decodeURIComponent(document.cookie);
    // let cookies = decodificacaoCookie.split(";");
    // for(let i = 0; i < cookies.length; i++)
    // {
    //     let cookie = cookies[i];
    //     while (cookie.charAt(0) == ' ')
    //     {
    //         cookie = cookie.substring(1);
    //     }
    //     if (cookie.indexOf(email) == 0)
    //     {
    //         document.getElementById('emailResponsavel').value = cookie.substring(email.length, cookie.length);
    //         console.log(cookie.substring(email.length, cookie.length));
    //     }
    //     if (cookie.indexOf(nome) == 0)
    //     {
    //         document.getElementById('nomeResponsavel').value = cookie.substring(nome.length, cookie.length);
    //         console.log(cookie.substring(nome.length, cookie.length));
    //     }
    // }

    // let resultado;
    // let valorDecodificado = decodeURIComponent(document.cookie);
    // let valor = `; ${valorDecodificado}`;
    // let partes = valor.split('; emailUsuario=');
    // if (partes.length === 2)
    // {
    //     resultado = partes.pop().split(';').shift();
    // }
    // if (resultado !== undefined)
    // {
    //     document.getElementById('emailResponsavel').value = resultado;
    // }

    valorDecodificado = decodeURIComponent(document.cookie);
    valor = `; ${valorDecodificado}`;
    partes = valor.split('; nomeUsuario=');
    if (partes.length === 2)
    {
        resultado = partes.pop().split(';').shift();
    }
    // if (resultado !== undefined)
    // {
    //     document.getElementById('nomeResponsavel').value = resultado;
    // }

    // data = new Date();

    // document.getElementById('dataPropsota').valueAsDate = data.getFullYear();

    console.log("Tá rodando");
    
    fetch('http://localhost/slimCompass/getNome/'+resultado)
    .then((response) => response.json())
    .then((json) => setNome(json))
    
    var resposta2

    // fetch('http://localhost/slimCompass/getNome/'+resultado)
    // .then((response) => response.json())
    // .then((json) => console.log("Essa é a resposta direto do banco: "+json))

    fetch('http://localhost/slimCompass/getNome/'+resultado)
    .then((response) => response.json())
    .then((json) => {console.log(json); resposta2 = json; console.log('passou pela definicao')})

    console.log("Essa é a resposta da variável: "+ resposta2);

    datacao = new Date();
    dia = datacao.getDate();
    if (dia < 10)
    {
        dia = `0${dia}`;
    }
    mes = datacao.getMonth() + 1;
    ano = datacao.getFullYear();

    document.getElementById('valorDataProposta').value = `${ano}-${mes}-${dia}`;
    document.getElementById('valorNumeroProposta').value = "0001";
    document.getElementById('valorVersaoProposta').value = "Versão 01";
}

function setNome(nome)
{
    document.getElementById('nomeResponsavel').value = nome.nm_nome_completo;
    document.getElementById('cargoResponsavel').value = nome.nm_cargo_usuario;
    fetch('http://localhost/slimCompass/getEmail/'+nome.cd_usuario)
    .then((response) => response.json())
    .then((json) => setEmail(json))
}

function setEmail(email)
{
    document.getElementById('emailResponsavel').value = email.nm_email_usuario;
}

function verificarVeiculo()
{
    let container = document.getElementById('valorTipoContainer').value;

    if(container == "container20")
    {
        document.getElementById('valorTipoVeiculo').value = "Truck";
        document.getElementById('valorEixos_cabecalho').value = 3;
        document.getElementById('valorEixos_carga').value = 3;
    }
    else
    {
        if(container == "container40-25tons")
        {
            document.getElementById('valorTipoVeiculo').value = "Cav e Bug";
            document.getElementById('valorEixos_cabecalho').value = 5;
            document.getElementById('valorEixos_carga').value = 5;
        }
        else
        {
            if(container == "container40-30tons")
            {
                document.getElementById('valorTipoVeiculo').value = "Cav e Bug";
                document.getElementById('valorEixos_cabecalho').value = 6;
                document.getElementById('valorEixos_carga').value = 6;
            }
            else
            {
                if(container == "container500kg")
                {
                    document.getElementById('valorTipoVeiculo').value = "Fiorino";
                    document.getElementById('valorEixos_cabecalho').value = 1;
                    document.getElementById('valorEixos_carga').value = 1;
                }
                else
                {
                    if(container == "container1200kg")
                    {
                        document.getElementById('valorTipoVeiculo').value = "Van";
                        document.getElementById('valorEixos_cabecalho').value = 1;
                        document.getElementById('valorEixos_carga').value = 1;
                    }
                    else
                    {
                        if(container == "container3500kg")
                        {
                            document.getElementById('valorTipoVeiculo').value = "Baú 3/4";
                            document.getElementById('valorEixos_cabecalho').value = 2;
                            document.getElementById('valorEixos_carga').value = 2;
                        }
                        else
                        {
                            if(container == "container6000kg")
                            {
                                document.getElementById('valorTipoVeiculo').value = "Baú Toco";
                                document.getElementById('valorEixos_cabecalho').value = 2;
                                document.getElementById('valorEixos_carga').value = 2;
                            }
                            else
                            {
                                if(container == "container12000kg")
                                {
                                    document.getElementById('valorTipoVeiculo').value = "Baú Truck";
                                    document.getElementById('valorEixos_cabecalho').value = 3;
                                    document.getElementById('valorEixos_carga').value = 3;
                                }
                                else
                                {
                                    if(container == "container25000kg")
                                    {
                                        document.getElementById('valorTipoVeiculo').value = "Carreta Baú";
                                        document.getElementById('valorEixos_cabecalho').value = 5;
                                        document.getElementById('valorEixos_carga').value = 5;
                                    }
                                    else
                                    {
                                        if(container == "outros")
                                        {
                                            document.getElementById('valorTipoVeiculo').value = "Carreta LS";
                                            document.getElementById('valorEixos_cabecalho').value = 6;
                                            document.getElementById('valorEixos_carga').value = 6;
                                        }
                                        else
                                        {
                                            document.getElementById('valorTipoVeiculo').value = "Tipo Inválido";
                                            document.getElementById('valorEixos_cabecalho').value = 0;
                                            document.getElementById('valorEixos_carga').value = 0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    calcularImpostos();
}

function calcularImpostos()
{

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------  Declaração de variáveis  ---------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Cabecalho
    nomeUsuario = document.getElementById('nomeResponsavel').value;
    emailUsuario = document.getElementById('emailResponsavel').value;
    cargoUsuario = document.getElementById('cargoResponsavel').value;
    dataProposta = document.getElementById('valorDataProposta').value;
    referenciaProposta = document.getElementById('valorReferenciaProposta').value;
    numeroProposta = document.getElementById('valorNumeroProposta').value;
    versaoProposta = document.getElementById('valorVersaoProposta').value;
    referenciaCliente = document.getElementById('valorReferenciaCliente').value;
    horarioRecebimento = document.getElementById('valorHorarioRecebimento').value;
    nomeProduto = document.getElementById('valorNomeProduto').value;
    pallets = document.getElementById('valorPallets').value;
    peso = document.getElementById('valorPeso').value;
    nomeCliente = document.getElementById('valorNomeCliente').value;
    nomeContatoCliente = document.getElementById('valorNomeContatoCliente').value;
    emailContatoCliente = document.getElementById('valorEmailContatoCliente').value;
    tipoFrete = document.getElementById('valorTipoFrete').value;
    estadoOrigem = document.getElementById('valorEstadoOrigem').value;
    cidadeOrigem = document.getElementById('valorCidadeOrigem').value;
    estadoDestino = document.getElementById('valorEstadoDestino').value;
    cidadeDestino = document.getElementById('valorCidadeDestino').value;
    estadosViagem = `${estadoOrigem}_${estadoDestino}`;
    localDevolucao = document.getElementById('valorLocalDevolucao').value;
    tipoContainer = document.getElementById('valorTipoContainer').value;
    tipoVeiculo = document.getElementById('valorTipoVeiculo').value;
    eixosCabecalho = parseFloat(document.getElementById('valorEixos_cabecalho').value);
    //25

    //Operacao
    valorMercadoria = parseFloat(document.getElementById('valorMercadoria').value);
    container = parseFloat(document.getElementById('container').value);
    porcentSusp = parseFloat(document.getElementById('porcentagemSusp').value);
    tipoOperacao = document.getElementById("tipoOperacao").value;
    impostoSuspenso = parseFloat(document.getElementById('valorImpostoSuspenso').value);
    totalImpostoSeguro = parseFloat(document.getElementById('valorTotalImpostoSeguro').value);
    fretePeso_operacao = parseFloat(document.getElementById('valorFretePeso_operacao').value);
    porcentRCTRC_operacao = parseFloat(document.getElementById('porcentagemRCTRC_operacao').value);
    rctrc_operacao = parseFloat(document.getElementById('valorRCTRC_operacao').value);
    porcentRCFDC_operacao = parseFloat(document.getElementById('porcentagemRCFDC_operacao').value);
    rcfdc_operacao = parseFloat(document.getElementById('valorRCFDC_operacao').value);
    checkGRIS = document.getElementById('valorCheckGRIS').value;
    porcentGRIS = parseFloat(document.getElementById('porcentagemGRIS').value);
    GRIS = parseFloat(document.getElementById('valorGRIS').value);
    porcentICMS_operacao = parseFloat(document.getElementById('porcentagemICMS_operacao').value);
    ICMS_operacao = parseFloat(document.getElementById('valorICMS_operacao').value);
    estacionamento_operacao = parseFloat(document.getElementById('valorEstacionamento_operacao').value);
    IMO = parseFloat(document.getElementById('valorIMO').value);
    DTA_GVB = parseFloat(document.getElementById('valorDTA_GVB').value);
    ajudantes_operacao = parseFloat(document.getElementById('valorAjudantes_operacao').value);
    pedagio_operacao = parseFloat(document.getElementById('valorPedagio_operacao').value);
    totalPrest = parseFloat(document.getElementById('valorTotalPrest').value);
    despesas_operacao = parseFloat(document.getElementById('valorDespesas_operacao').value);
    lucroBruto = parseFloat(document.getElementById('valorLucroBruto').value);
    porcentLucroBruto = parseFloat(document.getElementById('porcentagemLucroBruto').value);
    margem = parseFloat(document.getElementById('valorMargemLucroBruto').value);
    //26

    //Despesa
    motoristaAutonomo = parseFloat(document.getElementById('valorMotoristaAutonomo').value);
    pedagio_despesa = parseFloat(document.getElementById('valorPedagio_despesa').value);
    porcentRCFDC_despesa = parseFloat(document.getElementById('porcentagemRCFDC_despesa').value);
    rcfdc_despesa = parseFloat(document.getElementById('valorRCFDC_despesa').value);
    porcentRCTRC_despesa = parseFloat(document.getElementById('porcentagemRCTRC_despesa').value);
    rctrc_despesa = parseFloat(document.getElementById('valorRCTRC_despesa').value);
    porcentSimplesNAC = parseFloat(document.getElementById('porcentagemSimplesNAC').value);
    simplesNAC = parseFloat(document.getElementById('valorSimplesNAC').value);
    porcentIRPJ = parseFloat(document.getElementById('porcentagemIRPJ').value);
    IRPJ = parseFloat(document.getElementById('valorIRPJ').value);
    porcentAdicionalIRPJ = parseFloat(document.getElementById('porcentagemAdicionalIRPJ').value);
    adicionalIRPJ = parseFloat(document.getElementById('valorAdicionalIRPJ').value);
    porcentPIS = parseFloat(document.getElementById('porcentagemPIS').value);
    PIS = parseFloat(document.getElementById('valorPIS').value);
    porcentCOFINS = parseFloat(document.getElementById('porcentagemCOFINS').value);
    COFINS = parseFloat(document.getElementById('valorCOFINS').value);
    porcentICMS_despesa = parseFloat(document.getElementById('porcentagemICMS_despesa').value);
    ICMS_despesa = parseFloat(document.getElementById('valorICMS_despesa').value);
    buonnyCadastro = parseFloat(document.getElementById('valorBuonnyCadastro').value);
    GRISRastreamento = parseFloat(document.getElementById('valorGRISRastreamento').value);
    DTA_DI = parseFloat(document.getElementById('valorDTA_DI').value);
    estacionamento_despesa = parseFloat(document.getElementById('valorEstacionamento_despesa').value);
    ajudantes_despesa = parseFloat(document.getElementById('valorAjudantes_despesa').value);
    profit = parseFloat(document.getElementById('valorProfit').value);
    comissao = parseFloat(document.getElementById('valorComissao').value);
    porcentComissao = parseFloat(document.getElementById('porcentagemComissao').value);
    despesas_despesa = parseFloat(document.getElementById('valorDespesas_despesa').value);
    //27

    //Carga
    tipoCarga = document.getElementById('valorTipoCarga').value;
    quilometragemIda = parseFloat(document.getElementById('valorQuilometragemIda').value);
    quilometragemVolta = parseFloat(document.getElementById('valorQuilometragemVolta').value);
    quilometragemTotal = parseFloat(document.getElementById('valorQuilometragemTotal').value);
    pedagioEixoIda = parseFloat(document.getElementById('valorPedagioEixoIda').value);
    pedagioEixoVolta = parseFloat(document.getElementById('valorPedagioEixoVolta').value);
    eixosCarga = parseFloat(document.getElementById('valorEixos_carga').value);
    pedagio_carga = parseFloat(document.getElementById('valorPedagio_carga').value);
    consumoMedioQuilometroLitro = parseFloat(document.getElementById('valorConsumoMedioQuilometroLitro').value);
    precoCombustivelLitro = parseFloat(document.getElementById('valorPrecoCombustivelLitro').value);
    totalCombustivelLitros = parseFloat(document.getElementById('valorTotalCombustivelLitros').value);
    totalCombustivel = parseFloat(document.getElementById('valorTotalCombustivel').value);
    totalDespesaViagem = parseFloat(document.getElementById('valorTotalDespesaViagem').value);
    tipoMoeda = parseFloat(document.getElementById('tipoMoedaEstrangeira').value);
    moedaEstrangeira = parseFloat(document.getElementById('valorMoedaEstrangeira').value);
    cargaUSD_EUR = parseFloat(document.getElementById('valorCargaUSD_EUR').value);
    cargaBRL = parseFloat(document.getElementById('valorCargaBRL').value);
    //17

    //Frete peso
    fretePeso_fretePeso = parseFloat(document.getElementById('valorFretePeso_fretePeso').value);
    porcentPercentualFretePeso = parseFloat(document.getElementById('porcentagemPercentualFretePeso').value);
    //2

    //Motorista
    precoQuilometragemMotorista = NaN;
    precoMinimoMotorista = NaN;
    valores = parseFloat(document.getElementById('valorValores').value);
    freteANTT = parseFloat(document.getElementById('valorFreteANTT').value);
    pedagio_motorista = parseFloat(document.getElementById('valorPedagio_motorista').value);
    totalAutonomo = parseFloat(document.getElementById('valorTotalAutonomo').value);
    lucroTotalAutonomo = parseFloat(document.getElementById('valorLucroTotalAutonomo').value);
    freteAllFechado = parseFloat(document.getElementById('valorFreteAllFechado').value);
    lucroFreteAllFechado = parseFloat(document.getElementById('valorLucroFreteAllFechado').value);
    freteFecharEm = parseFloat(document.getElementById('valorFreteFecharEm').value);
    lucroFreteFecharEm = parseFloat(document.getElementById('valorLucroFreteFecharEm').value);
    //11

    //Cotacao
    motoristaCot1 = document.getElementById('motoristaCotado1').value;
    dataCotMotorista1 = document.getElementById('dataCotacaoMotorista1').value;
    valorMotoristaCot1 = document.getElementById('valorMotoristaCotado1').value;
    motoristaCot2 = document.getElementById('motoristaCotado2').value;
    dataCotMotorista2 = document.getElementById('dataCotacaoMotorista2').value;
    valorMotoristaCot2 = document.getElementById('valorMotoristaCotado2').value;
    //6

    //Adicionais
    tipoUtilizacaoIsca = document.getElementById('valorTipoUtilizacaoIsca').value;
    utilizacaoIsca = parseFloat(document.getElementById('valorUtilizacaoIsca').value);
    tipoMonitoramentoIsca = document.getElementById('valorTipoMonitoramentoIsca').value;
    monitoramentoIsca = parseFloat(document.getElementById('valorMonitoramentoIsca').value);
    tipoEscoltaArmada = document.getElementById('valorTipoEscoltaArmada').value;
    escoltaArmada = parseFloat(document.getElementById('valorEscoltaArmada').value);
    tipoAdicionalCargaIMO = document.getElementById('valorTipoAdicionalCargaIMO').value;
    adicionalCargaIMO = parseFloat(document.getElementById('valorAdicionalCargaIMO').value);
    tipoCarregamentoExpresso = document.getElementById('valorTipoCarregamentoExpresso').value;
    carregamentoExpresso = parseFloat(document.getElementById('valorCarregamentoExpresso').value);
    tipoUtilizacaoCavaloLS = document.getElementById('valorTipoUtilizacaoCavaloLS').value;
    utilizacaoCavaloLS = parseFloat(document.getElementById('valorUtilizacaoCavaloLS').value);
    tipoEstadiaEspecial = document.getElementById('valorTipoEstadiaEspecial').value;
    estadiaEspecial = parseFloat(document.getElementById('valorEstadiaEspecial').value);
    tipoSobrestadiaCarregamento = document.getElementById('valorTipoSobrestadiaCarregamento').value;
    sobrestadiaCarregamento = parseFloat(document.getElementById('valorSobrestadiaCarregamento').value);
    //16

    //25 + 26 + 27 + 17 + 2 + 11 + 6 + 16

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------  Parte da Operação  ------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Calculando o valor de Susp.
    if (tipoOperacao == "DTA")
    {
        if (!isNaN(valorMercadoria) && !isNaN(container) && !isNaN(porcentSusp))
        {
            impostoSuspenso = valorMercadoria * (porcentSusp / 100);
            document.getElementById('valorImpostoSuspenso').value = impostoSuspenso;
        }
    }
    else
    {
        document.getElementById('valorImpostoSuspenso').value = 0;
    }

    //Calculando total do imposto do seguro
    if (!isNaN(impostoSuspenso) && !isNaN(container) && !isNaN(valorMercadoria))
    {
        totalImpostoSeguro = valorMercadoria + container + parseFloat(impostoSuspenso)
        document.getElementById('valorTotalImpostoSeguro').value = totalImpostoSeguro;
    }

    
    //Calculando RCTRC
    if (!isNaN(totalImpostoSeguro) && !isNaN(porcentRCTRC_operacao))
    {
        rctrc_operacao = Math.fround(totalImpostoSeguro * (porcentRCTRC_operacao / 100)).toFixed(2);
        document.getElementById('valorRCTRC_operacao').value = rctrc_operacao;
    }
    
    //Pegando frete peso
    if (!isNaN(fretePeso_fretePeso))
    {
        fretePeso_operacao = fretePeso_fretePeso;
        document.getElementById('valorFretePeso_operacao').value = fretePeso_operacao;
    }

    //Calculando RCFDC
    if(!isNaN(totalImpostoSeguro) && !isNaN(porcentRCFDC_operacao))
    {
        rcfdc_operacao = Math.fround(totalImpostoSeguro * (porcentRCFDC_operacao / 100)).toFixed(2);
        document.getElementById('valorRCFDC_operacao').value = rcfdc_operacao;
    }

    //Calculando GRIS
    if (checkGRIS == "sim" && !isNaN(porcentGRIS))
    {
        GRIS = Math.fround(totalImpostoSeguro * (porcentGRIS / 100)).toFixed(2);
        document.getElementById('valorGRIS').value = GRIS;
    }
    else
    {
        if (checkGRIS == "nao")
        {
            GRIS = 0;
            document.getElementById('valorGRIS').value = GRIS;
        }
    }

        //Definindo porcentagem ICMS
        if (tipoOperacao == "EXPO")
        {
            porcentICMS_operacao = 0;
            porcentICMS_despesa = 0;
            document.getElementById('porcentagemICMS_operacao').value = porcentICMS_operacao;
            document.getElementById('porcentagemICMS_despesa').value = porcentICMS_despesa;
        }
        else
        {
            if (estadoOrigem != "naoSelecionado" && estadoDestino != "naoSelecionado")
            {
                if (estadosViagem != combinacaoICMS)
                {
                    puxouICMS = false;
                }
                if (puxouICMS == false)
                {
                    fetch('http://localhost/slimCompass/getICMS/'+estadosViagem)
                    .then((response) => response.json())
                    .then((json) => {
                        if (json != undefined)
                        {
                            puxouICMS = true; 
                            document.getElementById('porcentagemICMS_operacao').value = json.pc_icms; 
                            document.getElementById('porcentagemICMS_despesa').value = json.pc_icms; 
                            combinacaoICMS = estadosViagem;
                        }
                    })
                }
            }
        }


    //Calculando ICMS e Total Prest
    if (!isNaN(fretePeso_operacao) && !isNaN(rctrc_operacao) && !isNaN(rcfdc_operacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento_operacao) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes_operacao) && !isNaN(porcentICMS_operacao))
    {
        totalOperacao = parseFloat(fretePeso_operacao) + parseFloat(rctrc_operacao) + parseFloat(rcfdc_operacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento_operacao) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes_operacao);
        coeficienteICMS = 1 - (porcentICMS_operacao / 100);
        ICMS_operacao = Math.fround(totalOperacao / coeficienteICMS - totalOperacao).toFixed(2);
        document.getElementById('valorICMS_operacao').value = ICMS_operacao;
        totalPrest = Math.fround(totalOperacao / coeficienteICMS).toFixed(2);
        document.getElementById('valorTotalPrest').value = totalPrest;
        porcentTotalPrest = Math.fround(totalPrest / totalImpostoSeguro).toFixed(2);
        document.getElementById('porcentagemTotalPrest').value = porcentTotalPrest;
    }

    //Passando valor de pedagio
    if (!isNaN(pedagio_carga))
    {
        document.getElementById('valorPedagio_operacao').value = pedagio_carga;
    }
    
    //Calculando subTotal
    if (!isNaN(fretePeso_operacao) && !isNaN(rctrc_operacao) && !isNaN(rcfdc_operacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento_operacao) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes_operacao))
    {
        subTotal = Math.fround(parseFloat(fretePeso_operacao) + parseFloat(impostoSuspenso) + parseFloat(rctrc_operacao) + parseFloat(rcfdc_operacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento_operacao) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes_operacao)).toFixed(2);
        document.getElementById('subTotal').value = subTotal;
    }

    //Passando valor de despesas
    if(!isNaN(despesas_despesa))
    {
        document.getElementById('valorDespesas_operacao').value = despesas_despesa;
    }

    //Calculando lucro bruto
    if(!isNaN(totalPrest) && !isNaN(despesas_operacao) && !isNaN(subTotal))
    {
        lucroBruto = Math.fround(totalPrest - despesas_operacao).toFixed(2);
        document.getElementById('valorLucroBruto').value = lucroBruto;
        porcentLucroBruto = Math.fround(lucroBruto / subTotal * 100).toFixed(2);
        document.getElementById('porcentagemLucroBruto').value = porcentLucroBruto;
    }

    if(!isNaN(porcentLucroBruto) && porcentLucroBruto != "")
    {
        if (porcentLucroBruto > 15)
        {
            document.getElementById('valorMargemLucroBruto').value = "MARGEM OK";
            document.getElementById('valorMargemLucroBruto').style.fontWeight = "bold";
            document.getElementById('valorMargemLucroBruto').style.color = "green";
        }
        else
        {
            document.getElementById('valorMargemLucroBruto').value = "VOU DESCONTAR DA SUA COMISSÃO!";
            document.getElementById('valorMargemLucroBruto').style.fontWeight = "bold";
            document.getElementById('valorMargemLucroBruto').style.color = "rgb(135, 4, 35)";
            document.getElementById('valorMargemLucroBruto').style.backgroundColor = "rgb(255, 199, 205)";
        }
    }
    
    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------  Parte da Despesa  ------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Calculando despesa motorista
    if (!isNaN(freteAllFechado) && !isNaN(pedagio_motorista))
    {
        motoristaAutonomo = Math.fround(parseFloat(freteAllFechado) - parseFloat(pedagio_motorista)).toFixed(2);
        document.getElementById('valorMotoristaAutonomo').value = motoristaAutonomo;
    }

    //Passando valor de pedagio
    if(!isNaN(pedagio_carga))
    {
        document.getElementById('valorPedagio_despesa').value = pedagio_carga;
    }

    //Calculando RCFDC
    if (!isNaN(porcentRCFDC_despesa) && !isNaN(totalImpostoSeguro))
    {
        rcfdc_despesa = Math.fround(totalImpostoSeguro * (porcentRCFDC_despesa / 100)).toFixed(2);
        document.getElementById('valorRCFDC_despesa').value = rcfdc_despesa;
    }

    //Calculando RCTRC
    if (!isNaN(porcentRCTRC_despesa) && !isNaN(totalImpostoSeguro))
    {
        rctrc_despesa = Math.fround(totalImpostoSeguro * (porcentRCTRC_despesa / 100)).toFixed(2);
        document.getElementById('valorRCTRC_despesa').value = rctrc_despesa;
    }

    //Calculando Simples NAC
    if (!isNaN(porcentSimplesNAC) && !isNaN(totalPrest))
    {
        simplesNAC = Math.fround(totalPrest * (porcentSimplesNAC / 100)).toFixed(2);
        document.getElementById('valorSimplesNAC').value = simplesNAC;
    }

    //Calculando IRPJ
    if (!isNaN(porcentIRPJ) && !isNaN(totalPrest))
    {
        IRPJ = Math.fround(totalPrest * (porcentIRPJ / 100)).toFixed(2);
        document.getElementById('valorIRPJ').value = IRPJ;
    }

    //Calculando adicional IRPJ
    if (!isNaN(porcentAdicionalIRPJ) && !isNaN(totalPrest))
    {
        adicionalIRPJ = Math.fround(totalPrest * (porcentAdicionalIRPJ / 100)).toFixed(2);
        document.getElementById('valorAdicionalIRPJ').value = adicionalIRPJ;
    }

    //Calculando PIS
    if (!isNaN(porcentPIS) && !isNaN(totalPrest))
    {
        PIS = Math.fround(totalPrest * (porcentPIS / 100)).toFixed(2);
        document.getElementById('valorPIS').value = PIS;
    }

    //Calculando COFINS
    if (!isNaN(porcentCOFINS) && !isNaN(totalPrest))
    {
        COFINS = Math.fround(totalPrest * (porcentCOFINS / 100)).toFixed(2);
        document.getElementById('valorCOFINS').value = COFINS;
    }

    //Calculando ICMS
    if (!isNaN(porcentICMS_despesa) && !isNaN(totalPrest))
    {
        ICMS_despesa = Math.fround(totalPrest * (porcentICMS_despesa / 100)).toFixed(2);
        document.getElementById('valorICMS_despesa').value = ICMS_despesa;
    }

    //Calculando comissão
    if (!isNaN(fretePeso_operacao) && !isNaN(profit) && !isNaN(porcentComissao))
    {
        comissao = Math.fround((fretePeso_operacao - profit) * (porcentComissao / 100)).toFixed(2);
        document.getElementById('valorComissao').value = comissao;
    }

    //Calculando despesas
    if (!isNaN(motoristaAutonomo) && !isNaN(pedagio_despesa) && !isNaN(rcfdc_despesa) && !isNaN(rctrc_despesa) && !isNaN(simplesNAC) && !isNaN(IRPJ) && !isNaN(adicionalIRPJ) && !isNaN(PIS) && !isNaN(COFINS) && !isNaN(ICMS_despesa) && !isNaN(buonnyCadastro) && !isNaN(GRISRastreamento) && !isNaN(DTA_DI) && !isNaN(estacionamento_despesa) && !isNaN(ajudantes_despesa) && !isNaN(profit) && !isNaN(comissao))
    {
        despesas_despesa = Math.fround(parseFloat(motoristaAutonomo) + parseFloat(pedagio_despesa) + parseFloat(rcfdc_despesa) + parseFloat(rctrc_despesa) + parseFloat(simplesNAC) + parseFloat(IRPJ) + parseFloat(adicionalIRPJ) + parseFloat(PIS) + parseFloat(COFINS) + parseFloat(ICMS_despesa) + parseFloat(buonnyCadastro) + parseFloat(GRISRastreamento) + parseFloat(DTA_DI) + parseFloat(estacionamento_despesa) + parseFloat(ajudantes_despesa) + parseFloat(profit) + parseFloat(comissao)).toFixed(2);
        document.getElementById('valorDespesas_despesa').value = despesas_despesa;
    }

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------  Parte da Carga  -------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Calculando quilometragemTotal
    if (!isNaN(quilometragemIda) && !isNaN(quilometragemVolta))
    {
        quilometragemTotal = parseFloat(quilometragemIda) + parseFloat(quilometragemVolta);
        document.getElementById('valorQuilometragemTotal').value = quilometragemTotal;
    }

    //Calculando pedágio
    if (!isNaN(pedagioEixoIda) && !isNaN(pedagioEixoVolta) && !isNaN(eixosCarga))
    {
        pedagio_carga = pedagioEixoIda * eixosCarga + pedagioEixoVolta * eixosCarga;
        document.getElementById('valorPedagio_carga').value = pedagio_carga;
    }

    //Calculando combustível
    if (!isNaN(consumoMedioQuilometroLitro) && !isNaN(precoCombustivelLitro) && !isNaN(quilometragemTotal))
    {
        totalCombustivelLitros = Math.fround(quilometragemTotal / consumoMedioQuilometroLitro).toFixed(2);
        document.getElementById('valorTotalCombustivelLitros').value = totalCombustivelLitros;
        totalCombustivel = Math.fround(totalCombustivelLitros * precoCombustivelLitro).toFixed(2);
        document.getElementById('valorTotalCombustivel').value = totalCombustivel;
    }
    

    //Calculando despesa total
    if(!isNaN(totalCombustivel) && !isNaN(pedagio_carga))
    {
        totalDespesaViagem = Math.fround(parseFloat(totalCombustivel) + parseFloat(pedagio_carga)).toFixed(2);
        document.getElementById('valorTotalDespesaViagem').value = totalDespesaViagem;
    }

    //Calculando valor da carga
    if (!isNaN(cargaUSD_EUR) && !isNaN(moedaEstrangeira))
    {
        cargaBRL = Math.fround(parseFloat(cargaUSD_EUR) * parseFloat(moedaEstrangeira)).toFixed(2);
        document.getElementById('valorCargaBRL').value = cargaBRL;
    }

    //Puxando e definindo moeda
    if(!puxouMoeda)
    {
        fetch('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL')
        .then((response) => response.json())
        .then((json) => setMoeda(json))
    }

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------  Parte do Frete Peso  --------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Calculando frete peso
    if(!isNaN(porcentPercentualFretePeso) && !isNaN(freteAllFechado))
        if (isNaN(fretePeso_fretePeso))
        {
            fretePeso_fretePeso = Math.fround(freteAllFechado + freteAllFechado * (porcentPercentualFretePeso / 100))
            document.getElementById('valorFretePeso_fretePeso').value = fretePeso_fretePeso;
        }

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------  Parte do Motorista  ---------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Calculando valores motorista
    if (tipoCarga != "naoSelecionado" && !isNaN(eixosCarga))
    {
        switch (tipoCarga)
        {
            case "cargaGeral":
                switch (eixosCarga)
                {
                    case 2:
                        precoMinimoMotorista = 347.47;
                        precoQuilometragemMotorista = 3.2479;
                        break;
                    case 3:
                        precoMinimoMotorista = 416.85;
                        precoQuilometragemMotorista = 4.1594;
                        break;
                    case 4:
                        precoMinimoMotorista = 411.52;
                        precoQuilometragemMotorista = 4.6405;
                        break;
                    case 5:
                        precoMinimoMotorista = 459.36;
                        precoQuilometragemMotorista = 5.3195;
                        break;
                    case 6:
                        precoMinimoMotorista = 514.29
                        precoQuilometragemMotorista = 6.0672;
                        break;
                    case 7:
                        precoMinimoMotorista = 626.41;
                        precoQuilometragemMotorista = 6.7492;
                        break;
                    case 9:
                        precoMinimoMotorista = 645.41;
                        precoQuilometragemMotorista = 7.5685;
                        break;
                }
                break;
            case "granelSolido":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 347.47;
                        precoQuilometragemMotorista = 3.8516;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 416.85;
                        precoQuilometragemMotorista = 4.9030;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 411.52;
                        precoQuilometragemMotorista = 5.5061;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 459.36;
                        precoQuilometragemMotorista = 6.4257;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 514.29;
                        precoQuilometragemMotorista = 7.2770;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 626.41;
                        precoQuilometragemMotorista = 7.9360;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 645.57;
                        precoQuilometragemMotorista = 8.9270;
                        break;
                    }
                }
                break;
            }
            case "conteinerizada":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1; //Ver Não Existe
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 416.85;
                        precoQuilometragemMotorista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 411.52;
                        precoQuilometragemMotorista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 459.36;
                        precoQuilometragemMotorista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 514.29;
                        precoQuilometragemMotorista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 626.41;
                        precoQuilometragemMotorista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 645.57;
                        precoQuilometragemMotorista = 7.5685;
                        break;
                    }
                }
                break;
            }
            case "neogranel": //Ver Não Existe
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 100;
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                }
                break;
            }
            case "granelLiquido": //Ver Não Existe
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                }
                break;
            }
            case "frigorificada":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 397.75;
                        precoQuilometragemMotorista = 3.8516;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 470.64;
                        precoQuilometragemMotorista = 4.9030;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 474.55;
                        precoQuilometragemMotorista = 5.5061;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 563.48;
                        precoQuilometragemMotorista = 6.4257;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 618.41;
                        precoQuilometragemMotorista = 7.2770;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 724.23;
                        precoQuilometragemMotorista = 7.9360;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 755.79;
                        precoQuilometragemMotorista = 8.9270;
                        break;
                    }
                }
                break;
            }
            case "perigosaCargaGeral":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 427.79;
                        precoQuilometragemMotorista = 3.4140;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 497.16;
                        precoQuilometragemMotorista = 4.2814;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 494.38;
                        precoQuilometragemMotorista = 4.7605;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 542.21;
                        precoQuilometragemMotorista = 5.4079;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 597.14;
                        precoQuilometragemMotorista = 6.1198;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 713.67;
                        precoQuilometragemMotorista = 6.8177;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 735.27;
                        precoQuilometragemMotorista = 7.6021;
                        break;
                    }
                }
                break;
            }
            case "perigosaGranelSolido": //Ver Não Existe
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                }
                break;
            }
            case "perigosaConteinerizada":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 100
                        precoQuilometragemMotorista = 1; //Ver Não Existe
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 497.16;
                        precoQuilometragemMotorista = 4.2814;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 494.38;
                        precoQuilometragemMotorista = 4.7605;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 542.21;
                        precoQuilometragemMotorista = 5.4079;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 597.14;
                        precoQuilometragemMotorista = 6.1198;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 713.67;
                        precoQuilometragemMotorista = 6.8177;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 735.27;
                        precoQuilometragemMotorista = 7.6021;
                        break;
                    }
                }
                break;
            }
            case "perigosaGranelLiquido": //Ver Não Existe
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 100; 
                        precoQuilometragemMotorista = 1;
                        break;
                    }
                }
                break;
            }
            case "perigosaFrigorificada":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoMinimoMotorista = 487.62;
                        precoQuilometragemMotorista = 4.1857;
                        break;
                    }
                    case 3:
                    {
                        precoMinimoMotorista = 560.51;
                        precoQuilometragemMotorista = 5.1820;
                        break;
                    }
                    case 4:
                    {
                        precoMinimoMotorista = 567.72;
                        precoQuilometragemMotorista = 5.7613;
                        break;
                    }
                    case 5:
                    {
                        precoMinimoMotorista = 656.65;
                        precoQuilometragemMotorista = 6.6414;
                        break;
                    }
                    case 6:
                    {
                        precoMinimoMotorista = 711.58;
                        precoQuilometragemMotorista = 7.4479;
                        break;
                    }
                    case 7:
                    {
                        precoMinimoMotorista = 823.12;
                        precoQuilometragemMotorista = 8.1277;
                        break;
                    }
                    case 9:
                    {
                        precoMinimoMotorista = 857.86;
                        precoQuilometragemMotorista = 9.0754;
                        break;
                    }
                }
                break;
            }
        }
        valores = `R$${precoQuilometragemMotorista} + R$${precoMinimoMotorista}`;
        document.getElementById('valorValores').value = valores;
    }

    //Calculando frete conforme ANTT
    if (!isNaN(precoMinimoMotorista) && !isNaN(precoMinimoMotorista) && !isNaN(quilometragemTotal))
    {
        freteANTT = Math.fround(precoQuilometragemMotorista * quilometragemTotal + precoMinimoMotorista).toFixed(2);
        document.getElementById('valorFreteANTT').value = freteANTT;
    }

    //Pegando valor do pedagio
    if (!isNaN(pedagio_carga))
    {
        pedagio_motorista = pedagio_carga;
        document.getElementById('valorPedagio_motorista').value = pedagio_motorista;
    }

    //Calculando total autonomo
    if (!isNaN(freteANTT) && !isNaN(pedagio_motorista) && !isNaN(totalDespesaViagem))
    {
        totalAutonomo = Math.fround(parseFloat(freteANTT) + parseFloat(pedagio_motorista)).toFixed(2);
        document.getElementById('valorTotalAutonomo').value = totalAutonomo;
        lucroTotalAutonomo = Math.fround(parseFloat(totalAutonomo) - parseFloat(totalDespesaViagem)).toFixed(2);
        document.getElementById('valorLucroTotalAutonomo').value = lucroTotalAutonomo;
    }

    //Calculando lucro frete all in fechado
    if (!isNaN(freteAllFechado) && !isNaN(totalDespesaViagem))
    {
        lucroFreteAllFechado = Math.fround(freteAllFechado - totalDespesaViagem).toFixed(2);
        document.getElementById('valorLucroFreteAllFechado').value = lucroFreteAllFechado;
    }

    //Calculando lucro fechar em
    if (!isNaN(freteFecharEm) && !isNaN(totalDespesaViagem))
    {
        lucroFreteFecharEm = Math.fround( freteFecharEm - totalDespesaViagem).toFixed(2);
        document.getElementById('valorLucroFreteFecharEm').value = lucroFreteFecharEm;
    }

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------  Parte de Adicionais  --------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Colocando valor de utilizacao de isca
    if (tipoUtilizacaoIsca == "nao")
    {
        document.getElementById('valorUtilizacaoIsca').value = "ISENTO";
        document.getElementById('valorUtilizacaoIsca').readOnly = true;
    }
    else
    {
        if (tipoUtilizacaoIsca == "sim")
        {
            document.getElementById('valorUtilizacaoIsca').readOnly = false;
        }
    }

    //Colocando valor de monitoramento de isca
    if (tipoMonitoramentoIsca == "nao")
    {
        document.getElementById('valorMonitoramentoIsca').value = "ISENTO";
        document.getElementById('valorMonitoramentoIsca').readOnly = true;
    }
    else
    {
        if (tipoMonitoramentoIsca == "sim")
        {
            document.getElementById('valorMonitoramentoIsca').readOnly = false;
        }
    }

    //Colocando valor na escolta armada
    if (tipoEscoltaArmada == "nao")
    {
        document.getElementById('valorEscoltaArmada').value = "ISENTO";
        document.getElementById('valorEscoltaArmada').readOnly = true;
    }
    else
    {
        if (tipoEscoltaArmada == "sim")
        {
            document.getElementById('valorEscoltaArmada').readOnly = false;
        }
    }

    //Colocando valor no adicional de carga IMO
    if (tipoAdicionalCargaIMO == "nao")
    {
        document.getElementById('valorAdicionalCargaIMO').value = "NÃO APLICÁVEL";
        document.getElementById('valorAdicionalCargaIMO').readOnly = true;
    }
    else
    {
        (tipoAdicionalCargaIMO == "sim")
        {
            document.getElementById('valorAdicionalCargaIMO').value = 600;
            document.getElementById('valorAdicionalCargaIMO').readOnly = true;
        }
    }

    //Colocando valor no carregamento expresso
    if (tipoCarregamentoExpresso == "nao")
    {
        document.getElementById('valorCarregamentoExpresso').value = "NÃO APLICÁVEL";
        document.getElementById('valorCarregamentoExpresso').readOnly = true;
    }
    else
    {
        if (tipoCarregamentoExpresso == "sim")
        {
            document.getElementById('valorCarregamentoExpresso').value = 690;
            document.getElementById('valorCarregamentoExpresso').readOnly = true;
        }
        else
        {
            if (tipoCarregamentoExpresso == "isento")
            {
                document.getElementById('valorCarregamentoExpresso').value = "INSENTO COMERCIALMENTE";
                document.getElementById('valorCarregamentoExpresso').readOnly = true;
            }
        }
    }

    //Colocando valor na utilizacao do cavalo LS
    if (tipoUtilizacaoCavaloLS == "nao")
    {
        document.getElementById('valorUtilizacaoCavaloLS').value = "NÃO APLICÁVEL";
        document.getElementById('valorUtilizacaoCavaloLS').readOnly = true;
    }
    else
    {
        if (tipoUtilizacaoCavaloLS == "sim")
        {
            document.getElementById('valorUtilizacaoCavaloLS').value = 490;
            document.getElementById('valorUtilizacaoCavaloLS').readOnly = true;
        }
    }

    //Colocando valor na estadia especial
    if (tipoEstadiaEspecial == "nao")
    {
        document.getElementById('valorEstadiaEspecial').value = "NÃO APLICÁVEL";
        document.getElementById('valorEstadiaEspecial').readOnly = true;
    }
    else
    {
        if (tipoEstadiaEspecial == "sim")
        {
            document.getElementById('valorEstadiaEspecial').value = 590;
            document.getElementById('valorEstadiaEspecial').readOnly = true;
        }
    }

    //Colocando valor na sobrestadia de carregamento
    if (tipoSobrestadiaCarregamento == "nao")
    {
        document.getElementById('valorSobrestadiaCarregamento').value = "NÃO APLICÁVEL";
        document.getElementById('valorSobrestadiaCarregamento').readOnly = true;
    }
    else
    {
        if (tipoSobrestadiaCarregamento == "sim")
        {
            document.getElementById('valorSobrestadiaCarregamento').value = 59;
            document.getElementById('valorSobrestadiaCarregamento').readOnly = true;
        }
    }
}

function setMoeda(moeda)
{
    puxouMoeda = true;
    valoresMoedas = moeda;
    if (moeda)
    {
        tipoMoeda = document.getElementById('tipoMoedaEstrangeira').value;
        valorMoeda = document.getElementById('valorMoedaEstrangeira').value;
        if (tipoMoeda == "dolar")
        {
            valorMoeda = moeda.USDBRL.bid;
            document.getElementById('valorMoedaEstrangeira').value = (Math.fround(valorMoeda * 100)/ 100).toFixed(2); // Só consigo deixar 2 casas assim por algum motivo
        }
        else
        {
            if (tipoMoeda == "euro")
            {
                valorMoeda = moeda.EURBRL.bid;
                document.getElementById('valorMoedaEstrangeira').value = (Math.fround(valorMoeda * 100)/ 100).toFixed(2);
            }
        }
    }
}