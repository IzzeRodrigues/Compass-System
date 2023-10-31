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
    // let pallets = document.getElementById('pallets').value;
    // if (pallets > 6)
    // {
    //     document.getElementById('tipoVeiculo').value = "Baú Toco";
    //     document.getElementById('numeroEixos').value = 2;
    // }
    // else
    // {
    //     document.getElementById('tipoVeiculo').value = "Baú 3/4";
    //     document.getElementById('numeroEixos').value = 2;
    // }

    if(container == "container20")
    {
        document.getElementById('tipoVeiculo').value = "Truck";
        document.getElementById('numeroEixos').value = 3;
    }
    else
    {
        if(container == "container40-25tons")
        {
            document.getElementById('tipoVeiculo').value = "Cav e Bug";
            document.getElementById('numeroEixos').value = 5;
        }
        else
        {
            if(container == "container40-30tons")
            {
                document.getElementById('tipoVeiculo').value = "Cav e Bug";
                document.getElementById('numeroEixos').value = 6;
            }
            else
            {
                if(container == "container500kg")
                {
                    document.getElementById('tipoVeiculo').value = "Fiorino";
                    document.getElementById('numeroEixos').value = 1;
                }
                else
                {
                    if(container == "container1200kg")
                    {
                        document.getElementById('tipoVeiculo').value = "Van";
                        document.getElementById('numeroEixos').value = 1;
                    }
                    else
                    {
                        if(container == "container3500kg")
                        {
                            document.getElementById('tipoVeiculo').value = "Baú 3/4";
                            document.getElementById('numeroEixos').value = 2;
                        }
                        else
                        {
                            if(container == "container6000kg")
                            {
                                document.getElementById('tipoVeiculo').value = "Baú Toco";
                                document.getElementById('numeroEixos').value = 2;
                            }
                            else
                            {
                                if(container == "container12000kg")
                                {
                                    document.getElementById('tipoVeiculo').value = "Baú Truck";
                                    document.getElementById('numeroEixos').value = 3;
                                }
                                else
                                {
                                    if(container == "container25000kg")
                                    {
                                        document.getElementById('tipoVeiculo').value = "Carreta Baú";
                                        document.getElementById('numeroEixos').value = 5;
                                    }
                                    else
                                    {
                                        if(container == "outros")
                                        {
                                            document.getElementById('tipoVeiculo').value = "Carreta LS";
                                            document.getElementById('numeroEixos').value = 6;
                                        }
                                        else
                                        {
                                            document.getElementById('tipoVeiculo').value = "Tipo Inválido";
                                            document.getElementById('numeroEixos').value = 0;
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

function calcularImpostos()
{
    valorMercadoria = parseFloat(document.getElementById('valorMercadoria').value);
    container = parseFloat(document.getElementById('container').value);
    porcentagemSusp = parseFloat(document.getElementById('porcentagemSusp').value);

    tipoOperacao = document.getElementById("tipoOperacao").value;
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
    //Calculando o valor total do imposto do seguro
    valorSusp = document.getElementById('valorSusp').value;
    if (valorSusp != NaN && valorSusp != 0)
    {
        totalImpostoSeguro = valorMercadoria + container + parseFloat(valorSusp)
        document.getElementById('totalImpostoSeguro').value = totalImpostoSeguro;
    }
    fretePeso = parseFloat(document.getElementById('fretePeso').value);
    porcentagemRCTRC = parseFloat(document.getElementById('porcentagemRCTRC').value);
    //Calculando o valor de RCTRC
    rctrc = document.getElementById('valorRCTRC').value;
    if (totalImpostoSeguro && porcentagemRCTRC)
    {
        rctrc = (totalImpostoSeguro * (porcentagemRCTRC / 100))
        document.getElementById('valorRCTRC').value = rctrc;
    }
    porcentagemRCFDC = document.getElementById('porcentagemRCFDC').value;
    //Calculando valor RCFDC
    rcfdc = document.getElementById('valorRCFDC').value;
    if(totalImpostoSeguro && porcentagemRCFDC)
    {
        rcfdc = (totalImpostoSeguro * (porcentagemRCFDC / 100))
        document.getElementById('valorRCFDC').value = rcfdc;
    }

    checkGRIS = document.getElementById('checkGRIS').value;
    porcentagemGRIS = parseFloat(document.getElementById('porcentagemGRIS').value);
    GRIS = document.getElementById('valorGRIS').value;
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

    GRIS = parseFloat(document.getElementById('valorGRIS').value);
    pedagio = parseFloat(document.getElementById('valorPedagio').value);
    estacionamento = parseFloat(document.getElementById('valorEstacionamento').value);
    IMO = parseFloat(document.getElementById('valorIMO').value);
    DTA_GVB = parseFloat(document.getElementById('valorDTA_GVB').value);
    ajudantes = parseFloat(document.getElementById('valorAjudantes').value);
    ICMS = valorICMS = parseFloat(document.getElementById('valorICMS').value);
    // if ((fretePeso != "" && fretePeso != NaN && fretePeso != undefined && fretePeso != null) && (valorSusp != "" && valorSusp != NaN && valorSusp != undefined && valorSusp != null) && (rctrc != "" && rctrc != NaN && rctrc != undefined && rctrc != null) && (rcfdc != "" && rcfdc != NaN && rcfdc != undefined && rcfdc != null) && (GRIS != "" && GRIS != NaN && GRIS != undefined && GRIS != null) && (pedagio != "" && pedagio != NaN && pedagio != undefined && pedagio != null) && (estacionamento != "" && estacionamento != NaN && estacionamento != undefined && estacionamento != null) && (IMO != "" && IMO != NaN && IMO != undefined && IMO != null) && (DTA_GVB != "" && DTA_GVB != NaN && DTA_GVB != undefined && DTA_GVB != null) && (ajudantes != "" && ajudantes != NaN && ajudantes != undefined && ajudantes != null))
    // {
    //     console.log('entrandoContaFinal 2')
    //     subTotal = parseFloat(fretePeso) + parseFloat(valorSusp) + parseFloat(rctrc) + parseFloat(rcfdc) + parseFloat(GRIS) + parseFloat(pedagio) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes);
    //     console.log(subTotal);
    //     document.getElementById('subTotal').value = subTotal; 
    // }
    // console.log("Verificação de variáveis")

    // console.log(GRIS)
    // console.log(pedagio)
    // console.log(estacionamento)
    // console.log(IMO)
    // console.log(DTA_GVB)
    // console.log(ajudantes)
    // console.log(ICMS)

    // console.log("Fim da verificação")
    if (!isNaN(fretePeso))
    {
        if (!isNaN(valorSusp))
        {
            if (!isNaN(rctrc))
            {
                if (!isNaN(rcfdc))
                {
                    if (!isNaN(GRIS))
                    {
                        if (!isNaN(pedagio))
                        {
                            console.log("Entrando pedágio")
                            if (!isNaN(estacionamento))
                            {
                                console.log("Entrando estacionamento")
                                if (!isNaN(IMO))
                                {
                                    console.log("Entrando IMO")
                                    if (!isNaN(DTA_GVB))
                                    {
                                        console.log("Entrando DTA_GVB")
                                        if (!isNaN(ajudantes))
                                        {
                                            console.log('Entrando ajudantes')
                                            subTotal = parseFloat(fretePeso) + parseFloat(valorSusp) + parseFloat(rctrc) + parseFloat(rcfdc) + parseFloat(GRIS) + parseFloat(pedagio) + parseFloat(estacionamento) + parseFloat(IMO) + parseFloat(DTA_GVB) + parseFloat(ajudantes);
                                            console.log(subTotal);
                                            document.getElementById('subTotal').value = subTotal; 
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