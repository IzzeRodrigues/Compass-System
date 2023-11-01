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

    valorMercadoria = parseFloat(document.getElementById('valorMercadoria').value);
    container = parseFloat(document.getElementById('container').value);
    porcentagemSusp = parseFloat(document.getElementById('porcentagemSusp').value);
    tipoOperacao = document.getElementById("tipoOperacao").value;
    valorSusp = document.getElementById('valorSusp').value;
    totalImpostoSeguro = document.getElementById('totalImpostoSeguro').value;
    fretePeso = parseFloat(document.getElementById('fretePeso').value);
    porcentagemRCTRC_operacao = parseFloat(document.getElementById('porcentagemRCTRC_operacao').value);
    rctrcOperacao = document.getElementById('valorRCTRC_operacao').value;
    porcentagemRCFDC_operacao = document.getElementById('porcentagemRCFDC_operacao').value;
    rcfdcOperacao = document.getElementById('valorRCFDC_operacao').value;
    checkGRIS = document.getElementById('checkGRIS').value;
    porcentagemGRIS = parseFloat(document.getElementById('porcentagemGRIS').value);
    GRIS = document.getElementById('valorGRIS').value;
    porcentagemICMS = document.getElementById('porcentagemICMS').value;
    ICMS = parseFloat(document.getElementById('valorICMS').value);
    estacionamento = parseFloat(document.getElementById('valorEstacionamento').value);
    IMO = parseFloat(document.getElementById('valorIMO').value);
    DTA_GVB = parseFloat(document.getElementById('valorDTA_GVB').value);
    ajudantes = parseFloat(document.getElementById('valorAjudantes').value);
    pedagio_operacao = parseFloat(document.getElementById('valorPedagio_operacao').value);
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
        if (valorMercadoria && container && porcentagemSusp)
        {
            valorSusp = valorMercadoria * (porcentagemSusp / 100);
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
    if (totalImpostoSeguro && porcentagemRCTRC_operacao)
    {
        rctrcOperacao = (totalImpostoSeguro * (porcentagemRCTRC_operacao / 100))
        document.getElementById('valorRCTRC_operacao').value = rctrcOperacao;
    }
    
    //Calculando RCFDC
    if(totalImpostoSeguro && porcentagemRCFDC_operacao)
    {
        rcfdcOperacao = (totalImpostoSeguro * (porcentagemRCFDC_operacao / 100))
        document.getElementById('valorRCFDC_operacao').value = rcfdcOperacao;
    }

    //Calculando GRIS
    if (checkGRIS == "sim" && porcentagemGRIS)
    {
        GRIS = totalImpostoSeguro * (porcentagemGRIS / 100);
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
    if (!isNaN(fretePeso) && !isNaN(rctrcOperacao) && !isNaN(rcfdcOperacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes) && !isNaN(porcentagemICMS))
    {
        totalOperacao = parseFloat(fretePeso) + parseFloat(valorSusp) + parseFloat(rctrcOperacao) + parseFloat(rcfdcOperacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes);
        coeficienteICMS = 1 - (porcentagemICMS / 100);
        valorICMS = totalOperacao / coeficienteICMS - totalOperacao;
        document.getElementById('valorICMS').value = (Math.round(valorICMS * 100)/ 100).toFixed(2);
        valorTotalPrest = totalOperacao / coeficienteICMS;
        document.getElementById('totalPrest').value = (Math.round(valorTotalPrest * 100 / 100)).toFixed(2);
        porcentagemTotalPrest = (Math.round((valorTotalPrest / totalImpostoSeguro) * 100) / 100).toFixed(2);
        document.getElementById('porcentagemTotalPrest').value = porcentagemTotalPrest;
    }

    //Passando valores iguais
    if (!isNaN(pedagio_carga))
    {
        document.getElementById('valorPedagio_despesa').value = pedagio_carga;
        document.getElementById('valorPedagio_operacao').value = pedagio_carga;
    }

    //Pegando outros valores
    

    //Calculando subTotal
    if (!isNaN(fretePeso) && !isNaN(rctrcOperacao) && !isNaN(rcfdcOperacao) && !isNaN(GRIS) && !isNaN(pedagio_operacao) && !isNaN(estacionamento) && !isNaN(IMO) && !isNaN(DTA_GVB) && !isNaN(ajudantes))
    {
        subTotal = parseFloat(fretePeso) + parseFloat(valorSusp) + parseFloat(rctrcOperacao) + parseFloat(rcfdcOperacao) + parseFloat(GRIS) + parseFloat(pedagio_operacao) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes);
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