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
    impostoSuspenso = parseFloat(document.getElementById('valorImpostoSuspenso').value);
    totalImpostoSeguro = parseFloat(document.getElementById('valorTotalImpostoSeguro').value);
    fretePeso = parseFloat(document.getElementById('valorFretePeso').value);
    porcentRCTRC_operacao = parseFloat(document.getElementById('porcentagemRCTRC_operacao').value);
    rctrc_operacao = parseFloat(document.getElementById('valorRCTRC_operacao').value);
    porcentRCFDC_operacao = parseFloat(document.getElementById('porcentagemRCFDC_operacao').value);
    rcfdc_operacao = parseFloat(document.getElementById('valorRCFDC_operacao').value);
    checkGRIS = document.getElementById('valorCheckGRIS').value;
    porcentGRIS = parseFloat(document.getElementById('porcentagemGRIS').value);
    GRIS = parseFloat(document.getElementById('valorGRIS').value);
    porcentICMS = parseFloat(document.getElementById('porcentagemICMS').value);
    ICMS = parseFloat(document.getElementById('valorICMS').value);
    estacionamento = parseFloat(document.getElementById('valorEstacionamento').value);
    IMO = parseFloat(document.getElementById('valorIMO').value);
    DTA_GVB = parseFloat(document.getElementById('valorDTA_GVB').value);
    ajudantes_operacao = parseFloat(document.getElementById('valorAjudantes_operacao').value);
    pedagio_operacao = parseFloat(document.getElementById('valorPedagio_operacao').value);
    totalPrest = parseFloat(document.getElementById('valorTotalPrest').value);
    despesas_operacao = parseFloat(document.getElementById('valorDespesas_operacao').value);
    lucroBruto = parseFloat(document.getElementById('valorLucroBruto').value);
    porcentLucroBruto = parseFloat(document.getElementById('porcentagemLucroBruto').value);
    margem = parseFloat(document.getElementById('valorMargemLucroBruto').value);


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
    tipoMoeda = parseFloat(document.getElementById('tipoMoedaEstrangeira').value);
    moedaEstrangeira = parseFloat(document.getElementById('valorMoedaEstrangeira').value);
    cargaUSD_EUR = parseFloat(document.getElementById('valorCargaUSD_EUR').value);
    cargaBRL = parseFloat(document.getElementById('valorCargaBRL').value);

    //Motorista
    valores = parseFloat(document.getElementById('valorValores').value);
    freteANTT = parseFloat(document.getElementById('valorFreteANTT').value);
    pedagio_motorista = parseFloat(document.getElementById('valorPedagio_motorista').value);
    totalAutonomo = parseFloat(document.getElementById('valorTotalAutonomo').value);
    lucroTotalAutonomo = parseFloat(document.getElementById('valorLucroTotalAutonomo').value);
    freteAllFechado = parseFloat(document.getElementById('valorFreteAllFechado').value);
    lucroFreteAllFechado = parseFloat(document.getElementById('valorLucroFreteAllFechado').value);
    freteFecharEm = parseFloat(document.getElementById('valorFreteFecharEm').value);
    lucroFreteAllFechado = parseFloat(document.getElementById('valorTotal').value);


    //74 variáveis até o momento

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------  Parte da Operação  ------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    precoQuilometragemMotista = NaN;
    precoMinimoMotorista = NaN;


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
        rctrc_operacao = Math.round(totalImpostoSeguro * (porcentRCTRC_operacao / 100)).toFixed(2);
        document.getElementById('valorRCTRC_operacao').value = rctrc_operacao;
    }
    
    //Calculando RCFDC
    if(!isNaN(totalImpostoSeguro) && !isNaN(porcentRCFDC_operacao))
    {
        rcfdc_operacao = Math.round(totalImpostoSeguro * (porcentRCFDC_operacao / 100)).toFixed(2);
        document.getElementById('valorRCFDC_operacao').value = rcfdc_operacao;
    }

    //Calculando GRIS
    if (checkGRIS == "sim" && !isNaN(porcentGRIS))
    {
        GRIS = Math.round(totalImpostoSeguro * (porcentGRIS / 100)).toFixed(2);
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
    if (!isNaN(fretePeso) && !isNaN(rctrc_operacao) && !isNaN(rcfdc_operacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes_operacao) && !isNaN(porcentICMS))
    {
        totalOperacao = parseFloat(fretePeso) + parseFloat(rctrc_operacao) + parseFloat(rcfdc_operacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes_operacao);
        coeficienteICMS = 1 - (porcentICMS / 100);
        valorICMS = Math.round(totalOperacao / coeficienteICMS - totalOperacao).toFixed(2);
        document.getElementById('valorICMS').value = valorICMS;
        totalPrest = Math.round(totalOperacao / coeficienteICMS).toFixed(2);
        document.getElementById('valorTotalPrest').value = totalPrest;
        porcentTotalPrest = Math.round(totalPrest / totalImpostoSeguro).toFixed(2);
        document.getElementById('porcentagemTotalPrest').value = porcentTotalPrest;
    }

    //Passando valor de pedagio
    if (!isNaN(pedagio_carga))
    {
        document.getElementById('valorPedagio_operacao').value = pedagio_carga;
    }
    
    //Calculando subTotal
    if (!isNaN(fretePeso) && !isNaN(rctrc_operacao) && !isNaN(rcfdc_operacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes_operacao))
    {
        subTotal = parseFloat(fretePeso) + parseFloat(impostoSuspenso) + parseFloat(rctrc_operacao) + parseFloat(rcfdc_operacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes_operacao);
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
        lucroBruto = Math.round(totalPrest - despesas_operacao).toFixed(2);
        document.getElementById('valorLucroBruto').value = lucroBruto;
        porcentLucroBruto = Math.round(lucroBruto / subTotal * 100).toFixed(2);
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
            document.getElementById('valorMargemLucroBruto').style.color = "red";
        }
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
    if (!isNaN(porcentIRPJ) && !isNaN(totalPrest))
    {
        IRPJ = Math.round(totalPrest * (porcentIRPJ / 100)).toFixed(2);
        document.getElementById('valorIRPJ').value = IRPJ;
    }

    //Calculando adicional IRPJ
    if (!isNaN(porcentAdicionalIRPJ) && !isNaN(totalPrest))
    {
        adicionalIRPJ = Math.round(totalPrest * (porcentAdicionalIRPJ / 100)).toFixed(2);
        document.getElementById('valorAdicionalIRPJ').value = adicionalIRPJ;
    }

    //Calculando PIS
    if (!isNaN(porcentPIS) && !isNaN(totalPrest))
    {
        PIS = Math.round(totalPrest * (porcentPIS / 100)).toFixed(2);
        document.getElementById('valorPIS').value = PIS;
    }

    //Calculando COFINS
    if (!isNaN(porcentCOFINS) && !isNaN(totalPrest))
    {
        COFINS = Math.round(totalPrest * (porcentCOFINS / 100)).toFixed(2);
        document.getElementById('valorCOFINS').value = COFINS;
    }

    //Calculando ICMS
    if (!isNaN(porcentICMS_despesa) && !isNaN(totalPrest))
    {
        ICMS_despesa = Math.round(totalPrest * (porcentICMS_despesa / 100)).toFixed(2);
        document.getElementById('valorICMS_despesa').value = ICMS_despesa;
    }

    //Calculando comissão
    if (!isNaN(fretePeso) && !isNaN(profit) && !isNaN(porcentComissao))
    {
        comissao = Math.round((fretePeso - profit) * (porcentComissao / 100)).toFixed(2);
        document.getElementById('valorComissao').value = comissao;
    }

    //Calculando despesas
    if (!isNaN(motoristaAutonomo) && !isNaN(pedagio_despesa) && !isNaN(rcfdc_despesa) && !isNaN(rctrc_despesa) && !isNaN(simplesNAC) && !isNaN(IRPJ) && !isNaN(adicionalIRPJ) && !isNaN(PIS) && !isNaN(COFINS) && !isNaN(ICMS_despesa) && !isNaN(buonnyCadastro) && !isNaN(GRISRastreamento) && !isNaN(DTA_DI) && !isNaN(estacionamento_despesa) && !isNaN(ajudantes_despesa) && !isNaN(profit) && !isNaN(comissao))
    {
        despesas_despesa = Math.round(parseFloat(motoristaAutonomo) + parseFloat(pedagio_despesa) + parseFloat(rcfdc_despesa) + parseFloat(rctrc_despesa) + parseFloat(simplesNAC) + parseFloat(IRPJ) + parseFloat(adicionalIRPJ) + parseFloat(PIS) + parseFloat(COFINS) + parseFloat(ICMS_despesa) + parseFloat(buonnyCadastro) + parseFloat(GRISRastreamento) + parseFloat(DTA_DI) + parseFloat(estacionamento_despesa) + parseFloat(ajudantes_despesa) + parseFloat(profit) + parseFloat(comissao)).toFixed(2);
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
        totalCombustivelLitros = Math.round(quilometragemTotal / consumoMedioQuilometroLitro).toFixed(2);
        document.getElementById('valorTotalCombustivelLitros').value = totalCombustivelLitros;
        totalCombustivel = Math.round(totalCombustivelLitros * precoCombustivelLitro).toFixed(2);
        document.getElementById('valorTotalCombustivel').value = totalCombustivel;
    }
    

    //Calculando despesa total
    if(!isNaN(totalCombustivel) && !isNaN(pedagio_carga))
    {
        totalDespesaViagem = Math.round(parseFloat(totalCombustivel) + parseFloat(pedagio_carga)).toFixed(2);
        document.getElementById('valorTotalDespesaViagem').value = totalDespesaViagem;
    }

    //Calculando valor da carga
    if (!isNaN(cargaUSD_EUR) && !isNaN(moedaEstrangeira))
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

    /*
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------------------------  Parte do Motorista  ---------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */

    if (!isNaN(tipoCarga) && !isNaN(eixosCarga))
    {
        switch (tipoCarga)
        {
            case "cargaGeral":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoQuilometragemMotista = 3.2479;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.5685;
                        break;
                    }
                }
                break;
            }
            case "granelSolido":
            {
                switch (eixosCarga)
                {
                    case 2:
                    {
                        precoQuilometragemMotista = 3.8516;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.9030;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 5.5061;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 6.4257;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 7.2770;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 7.9360;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 8.9270;
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
                        precoQuilometragemMotista = 3.2479; //Ver Não Existe
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.5685;
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
                        precoQuilometragemMotista = 3.2479;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.5685;
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
                        precoQuilometragemMotista = 3.2479;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.5685;
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
                        precoQuilometragemMotista = 3.8516;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.9030;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 5.5061;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 6.4257;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 7.2770;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 7.9360;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 8.9270;
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
                        precoQuilometragemMotista = 3.4140;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.2814;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.7605;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.4079;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.1198;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.8177;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.6021;
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
                        precoQuilometragemMotista = 3.2479;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.5685;
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
                        precoQuilometragemMotista = 3.2479; //Ver Não Existe
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.2814;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.7605;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.4079;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.1198;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.8177;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.6021;
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
                        precoQuilometragemMotista = 3.2479;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 4.1594;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 4.6405;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 5.3195;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 6.0672;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 6.7492;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 7.5685;
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
                        precoQuilometragemMotista = 4.1857;
                        break;
                    }
                    case 3:
                    {
                        precoQuilometragemMotista = 5.1820;
                        break;
                    }
                    case 4:
                    {
                        precoQuilometragemMotista = 5.7613;
                        break;
                    }
                    case 5:
                    {
                        precoQuilometragemMotista = 6.6414;
                        break;
                    }
                    case 6:
                    {
                        precoQuilometragemMotista = 7.4479;
                        break;
                    }
                    case 7:
                    {
                        precoQuilometragemMotista = 8.1277;
                        break;
                    }
                    case 9:
                    {
                        precoQuilometragemMotista = 9.0754;
                        break;
                    }
                }
                break;
            }
        }
    }

    if (!isNaN(tipoCarga) && tipoCarga != "" && isNaN(quilometragemTotal))
    {
        if (quilometragemTotal < 100)
        {
            precoQuilometragemMotista = 2.19;
        }
        else
        {
            if (quilometragemTotal < 200)
            {
                precoQuilometragemMotista = 1.35;
            }
            else
            {
                if (quilometragemTotal < 300)
                {
                    precoQuilometragemMotista = 1.18;
                }
                else
                {
                    if (quilometragemTotal < 400)
                    {
                        precoQuilometragemMotista = 1.11;
                    }
                    else
                    {
                        if (quilometragemTotal < 500)
                        {
                            precoQuilometragemMotista = 1.07;
                        }
                        else
                        {
                            if (quilometragemTotal < 600)
                            {
                                precoQuilometragemMotista = 1.04;
                            }
                            else
                            {
                                if (quilometragemTotal < 700)
                                {
                                    precoQuilometragemMotista = 1.02;
                                }
                                else
                                {
                                    if (quilometragemTotal < 800)
                                    {
                                        precoQuilometragemMotista = 1.01;
                                    }
                                    else
                                    {
                                        if (quilometragemTotal < 900)
                                        {
                                            precoQuilometragemMotista = 1;
                                        }
                                        else
                                        {
                                            if (quilometragemTotal < 1000)
                                            {
                                                precoQuilometragemMotista = 0.99;
                                            }
                                            else
                                            {
                                                if (quilometragemTotal < 1100)
                                                {
                                                    precoQuilometragemMotista = 0.99;
                                                }
                                                else
                                                {
                                                    if (quilometragemTotal < 1200)
                                                    {
                                                        precoQuilometragemMotista = 0.98;
                                                    }
                                                    else
                                                    {
                                                        if (quilometragemTotal < 1300)
                                                        {
                                                            precoQuilometragemMotista = 0.98;
                                                        }
                                                        else
                                                        {
                                                            if (quilometragemTotal < 1400)
                                                            {
                                                                precoQuilometragemMotista = 0.97;
                                                            }
                                                            else
                                                            {
                                                                if (quilometragemTotal < 1500)
                                                                {
                                                                    precoQuilometragemMotista = 0.97;
                                                                }
                                                                else
                                                                {
                                                                    
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
                        }
                    }
                }
            }
        }
    }

    
    if (!isNaN(precoMinimoMotorista) && !isNaN(precoQuilometragemMotista) && (!isNaN(tipoCarga) && tipoCarga != ""))
    {
        
    }