let puxouMoeda = false;
let valoresMoedas;

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
    let container = document.getElementById('tipoContainer').value;

    if(container == "container20")
    {
        document.getElementById('tipoVeiculo').value = "Truck";
        document.getElementById('valorEixos_cabecalho').value = 3;
        document.getElementById('valorEixos_carga').value = 3;
    }
    else
    {
        if(container == "container40-25tons")
        {
            document.getElementById('tipoVeiculo').value = "Cav e Bug";
            document.getElementById('valorEixos_cabecalho').value = 5;
            document.getElementById('valorEixos_carga').value = 5;
        }
        else
        {
            if(container == "container40-30tons")
            {
                document.getElementById('tipoVeiculo').value = "Cav e Bug";
                document.getElementById('valorEixos_cabecalho').value = 6;
                document.getElementById('valorEixos_carga').value = 6;
            }
            else
            {
                if(container == "container500kg")
                {
                    document.getElementById('tipoVeiculo').value = "Fiorino";
                    document.getElementById('valorEixos_cabecalho').value = 1;
                    document.getElementById('valorEixos_carga').value = 1;
                }
                else
                {
                    if(container == "container1200kg")
                    {
                        document.getElementById('tipoVeiculo').value = "Van";
                        document.getElementById('valorEixos_cabecalho').value = 1;
                        document.getElementById('valorEixos_carga').value = 1;
                    }
                    else
                    {
                        if(container == "container3500kg")
                        {
                            document.getElementById('tipoVeiculo').value = "Baú 3/4";
                            document.getElementById('valorEixos_cabecalho').value = 2;
                            document.getElementById('valorEixos_carga').value = 2;
                        }
                        else
                        {
                            if(container == "container6000kg")
                            {
                                document.getElementById('tipoVeiculo').value = "Baú Toco";
                                document.getElementById('valorEixos_cabecalho').value = 2;
                                document.getElementById('valorEixos_carga').value = 2;
                            }
                            else
                            {
                                if(container == "container12000kg")
                                {
                                    document.getElementById('tipoVeiculo').value = "Baú Truck";
                                    document.getElementById('valorEixos_cabecalho').value = 3;
                                    document.getElementById('valorEixos_carga').value = 3;
                                }
                                else
                                {
                                    if(container == "container25000kg")
                                    {
                                        document.getElementById('tipoVeiculo').value = "Carreta Baú";
                                        document.getElementById('valorEixos_cabecalho').value = 5;
                                        document.getElementById('valorEixos_carga').value = 5;
                                    }
                                    else
                                    {
                                        if(container == "outros")
                                        {
                                            document.getElementById('tipoVeiculo').value = "Carreta LS";
                                            document.getElementById('valorEixos_cabecalho').value = 6;
                                            document.getElementById('valorEixos_carga').value = 6;
                                        }
                                        else
                                        {
                                            document.getElementById('tipoVeiculo').value = "Tipo Inválido";
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

    //Operacao
    valorMercadoria = parseFloat(document.getElementById('valorMercadoria').value);
    container = parseFloat(document.getElementById('container').value);
    porcentSusp = parseFloat(document.getElementById('porcentagemSusp').value);
    tipoOperacao = document.getElementById("tipoOperacao").value;
    valorSusp = document.getElementById('valorSusp').value;
    totalImpostoSeguro = document.getElementById('totalImpostoSeguro').value;
    fretePeso = parseFloat(document.getElementById('fretePeso').value);
    porcentRCTRC_operacao = parseFloat(document.getElementById('porcentagemRCTRC_operacao').value);
    rctrc_operacao = document.getElementById('valorRCTRC_operacao').value;
    porcentRCFDC_operacao = document.getElementById('porcentagemRCFDC_operacao').value;
    rcfdc_operacao = document.getElementById('valorRCFDC_operacao').value;
    checkGRIS = document.getElementById('checkGRIS').value;
    porcentGRIS = parseFloat(document.getElementById('porcentagemGRIS').value);
    GRIS = document.getElementById('valorGRIS').value;
    porcentICMS = document.getElementById('porcentagemICMS').value;
    ICMS = parseFloat(document.getElementById('valorICMS').value);
    estacionamento = parseFloat(document.getElementById('valorEstacionamento').value);
    IMO = parseFloat(document.getElementById('valorIMO').value);
    DTA_GVB = parseFloat(document.getElementById('valorDTA_GVB').value);
    ajudantes = parseFloat(document.getElementById('valorAjudantes').value);
    pedagio_operacao = parseFloat(document.getElementById('valorPedagio_operacao').value);

    //Despesa
    porcentRCFDC_despesa = document.getElementById('porcentagemRCFDC_despesa').value;
    rcfdc_despesa = document.getElementById('valorRCFDC_despesa').value;
    porcentRCTRC_despesa = document.getElementById('porcentagemRCTRC_despesa').value;
    rctrc_despesa = document.getElementById('valorRCTRC_despesa').value;
    porcentSimplesNAC = document.getElementById('porcentagemSimplesNAC').value;
    simplesNAC = document.getElementById('valorSimplesNAC').value;
    porcentIRPJ = document.getElementById('porcentagemIRPJ').value;
    IRPJ = document.getElementById('valorIRPJ').value;
    porcentAdicionalIRPJ = document.getElementById('porcentagemAdicionalIRPJ').value;
    adicionalIRPJ = document.getElementById('valorAdicionalIRPJ').value;
    porcentPIS = document.getElementById('porcentagemPIS').value;
    PIS = document.getElementById('valorPIS').value;
    porcentCOFINS = document.getElementById('porcentagemCOFINS').value;
    COFINS = document.getElementById('valorCOFINS').value;
    porcentICMS_despesa = document.getElementById('porcentagemICMS_despesa').value;
    ICMS_despesa = document.getElementById('valorICMS_despesa').value;
    buonnyCadastro = document.getElementById('valorBuonnyCadastro').value;
    GRISRastreamento = document.getElementById('valorGRISRastreamento').value;
    DTA_DI = document.getElementById('valorDTA_DI').value;
    estacionamento_despesa = document.getElementById('valorEstacionamento_despesa').value;
    ajudantes_despesa = document.getElementById('valorAjudantes_despesa').value;
    profit = document.getElementById('valorProfit').value;
    comissao = document.getElementById('valorComissao').value;
    porcentComissao = document.getElementById('porcentagemComissao').value;

    //Carga
    quilometragemIda = document.getElementById('valorQuilometragemIda').value;
    quilometragemVolta = document.getElementById('valorQuilometragemVolta').value;
    quilometragemTotal = document.getElementById('valorQuilometragemTotal').value;
    pedagioEixoIda = document.getElementById('valorPedagioEixoIda').value;
    pedagioEixoVolta = document.getElementById('valorPedagioEixoVolta').value;
    eixosCarga = document.getElementById('valorEixos_carga').value;
    pedagio_carga = document.getElementById('valorPedagio_carga').value;
    consumoMedioQuilometroLitro = document.getElementById('valorConsumoMedioQuilometroLitro').value;
    precoCombustivelLitro = document.getElementById('valorPrecoCombustivelLitro').value;
    totalCombustivelLitros = document.getElementById('valorTotalCombustivelLitros').value;
    totalCombustivel = document.getElementById('valorTotalCombustivel').value;
    tipoMoeda = document.getElementById('tipoMoedaEstrangeira').value;
    moedaEstrangeira = document.getElementById('valorMoedaEstrangeira').value;
    cargaUSD_EUR = document.getElementById('valorCargaUSD_EUR').value;
    cargaBRL = document.getElementById('valorCargaBRL').value;

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
            valorSusp = valorMercadoria * (porcentSusp / 100);
            document.getElementById('valorSusp').value = valorSusp;
        }
    }
    else
    {
        document.getElementById('valorSusp').value = 0;
    }

    //Calculando total do imposto do seguro
    if (valorSusp != NaN && valorSusp != 0)
    {
        totalImpostoSeguro = valorMercadoria + container + parseFloat(valorSusp)
        document.getElementById('totalImpostoSeguro').value = totalImpostoSeguro;
    }

    
    //Calculando RCTRC
    if (totalImpostoSeguro && porcentRCTRC_operacao)
    {
        rctrc_operacao = (totalImpostoSeguro * (porcentRCTRC_operacao / 100))
        document.getElementById('valorRCTRC_operacao').value = rctrc_operacao;
    }
    
    //Calculando RCFDC
    if(totalImpostoSeguro && porcentRCFDC_operacao)
    {
        rcfdc_operacao = (totalImpostoSeguro * (porcentRCFDC_operacao / 100))
        document.getElementById('valorRCFDC_operacao').value = rcfdc_operacao;
    }

    //Calculando GRIS
    if (checkGRIS == "sim" && porcentGRIS)
    {
        GRIS = totalImpostoSeguro * (porcentGRIS / 100);
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

    //Calculando ICMS e Total Prest
    if (!isNaN(fretePeso) && !isNaN(rctrc_operacao) && !isNaN(rcfdc_operacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes) && !isNaN(porcentICMS))
    {
        totalOperacao = parseFloat(fretePeso) + parseFloat(valorSusp) + parseFloat(rctrc_operacao) + parseFloat(rcfdc_operacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes);
        coeficienteICMS = 1 - (porcentICMS / 100);
        valorICMS = totalOperacao / coeficienteICMS - totalOperacao;
        document.getElementById('valorICMS').value = (Math.round(valorICMS * 100)/ 100).toFixed(2);
        totalPrest = totalOperacao / coeficienteICMS;
        document.getElementById('valorTotalPrest').value = (Math.round(totalPrest * 100 / 100)).toFixed(2);
        porcentTotalPrest = (Math.round((totalPrest / totalImpostoSeguro) * 100) / 100).toFixed(2);
        document.getElementById('porcentagemTotalPrest').value = porcentTotalPrest;
    }

    //Passando valor de pedagio
    if (!isNaN(pedagio_carga))
    {
        document.getElementById('valorPedagio_operacao').value = pedagio_carga;
    }

    //Pegando outros valores
    

    //Calculando subTotal
    if (!isNaN(fretePeso) && !isNaN(rctrc_operacao) && !isNaN(rcfdc_operacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes))
    {
        subTotal = parseFloat(fretePeso) + parseFloat(valorSusp) + parseFloat(rctrc_operacao) + parseFloat(rcfdc_operacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes);
        document.getElementById('subTotal').value = subTotal; 
    }
    
    
    //Calculando quilometragemTotal
    if ((!isNaN(quilometragemIda) && quilometragemIda != "") && (!isNaN(quilometragemVolta) && quilometragemVolta != ""))
    {
        quilometragemTotal = parseFloat(quilometragemIda) + parseFloat(quilometragemVolta);
        document.getElementById('valorQuilometragemTotal').value = quilometragemTotal;
    }
    
    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------  Parte da Despesa  ------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Passando valor de pedagio
    if(!isNaN(pedagio_carga))
    {
        document.getElementById('valorPedagio_despesa').value = pedagio_carga;
    }

    //Calculando RCFDC
    if (!isNaN(porcentRCFDC_despesa) && !isNaN(totalImpostoSeguro))
    {
        rcfdc_despesa = Math.round(totalImpostoSeguro * (porcentRCFDC_despesa / 100)).toFixed(2);
        document.getElementById('valorRCFDC_despesa').value = rcfdc_despesa;
    }

    //Calculando RCTRC
    if (!isNaN(porcentRCTRC_despesa) && !isNaN(totalImpostoSeguro))
    {
        rctrc_despesa = Math.round(totalImpostoSeguro * (porcentRCTRC_despesa / 100)).toFixed(2);
        document.getElementById('valorRCTRC_despesa').value = rctrc_despesa;
    }

    //Calculando Simples NAC
    if (!isNaN(porcentSimplesNAC) && !isNaN(totalPrest))
    {
        simplesNAC = Math.round(totalPrest * (porcentSimplesNAC / 100)).toFixed(2);
        document.getElementById('valorSimplesNAC').value = simplesNAC;
    }

    //Calculando IRPJ
    if (!isNaN(porcentAdicionalIRPJ) && !isNaN(totalImpostoSeguro))
    {
        adicionalIRPJ = Math.round(totalPrest * (porcentAdicionalIRPJ / 100)).toFixed(2);
        document.getElementById('valorIRPJ').value = adicionalIRPJ;
    }

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------  Parte da Carga  -------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    //Calculando pedágio
    

    if ((!isNaN(pedagioEixoIda) && pedagioEixoIda != "") && (!isNaN(pedagioEixoVolta) && pedagioEixoVolta != "") && (!isNaN(eixosCarga) && eixosCarga != ""))
    {
        pedagio_carga = pedagioEixoIda * eixosCarga + pedagioEixoVolta * eixosCarga;
        document.getElementById('valorPedagio_carga').value = pedagio_carga;
    }
    //Calculando combustível
    

    if ((!isNaN(consumoMedioQuilometroLitro) && consumoMedioQuilometroLitro != "") && (!isNaN(precoCombustivelLitro) && precoCombustivelLitro != "") && (!isNaN(quilometragemTotal) && quilometragemTotal != ""))
    {
        totalCombustivelLitros = Math.round(quilometragemTotal / consumoMedioQuilometroLitro).toFixed(2);
        document.getElementById('valorTotalCombustivelLitros').value = totalCombustivelLitros;
        totalCombustivel = Math.round(totalCombustivelLitros * precoCombustivelLitro).toFixed(2);
        document.getElementById('valorTotalCombustivel').value = totalCombustivel;
    }
    

    //Calculando despesa total

    if((!isNaN(totalCombustivel) && totalCombustivel != "") && (!isNaN(pedagio_carga) && pedagio_carga != ""))
    {
        totalDespesaViagem = Math.round(parseFloat(totalCombustivel) + parseFloat(pedagio_carga)).toFixed(2);
        document.getElementById('valorTotalDespesaViagem').value = totalDespesaViagem;
    }

    //Calculando valor da carga
    if ((!isNaN(cargaUSD_EUR) && cargaUSD_EUR != "") && (!isNaN(moedaEstrangeira) && moedaEstrangeira != ""))
    {
        cargaBRL = Math.round(parseFloat(cargaUSD_EUR) * parseFloat(moedaEstrangeira)).toFixed(2);
        document.getElementById('valorCargaBRL').value = cargaBRL;
    }

    if(!puxouMoeda)
    {
        fetch('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL')
        .then((response) => response.json())
        .then((json) => setMoeda(json))
    }
}

function setMoeda(moeda)
{
    puxouMoeda = true;
    valoresMoedas = moeda;
    tipoMoeda = document.getElementById('tipoMoedaEstrangeira').value;
    valorMoeda = document.getElementById('valorMoedaEstrangeira').value;
    if (tipoMoeda == "dolar")
    {
        valorMoeda = moeda.USDBRL.bid;
        document.getElementById('valorMoedaEstrangeira').value = (Math.round(valorMoeda * 100)/ 100).toFixed(2); // Só consigo deixar 2 casas assim por algum motivo
    }
    else
    {
        if (tipoMoeda == "euro")
        {
            valorMoeda = moeda.EURBRL.bid;
            document.getElementById('valorMoedaEstrangeira').value = (Math.round(valorMoeda * 100)/ 100).toFixed(2);
        }
    }
}