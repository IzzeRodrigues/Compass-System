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

    // valorDecodificado = decodeURIComponent(document.cookie);
    // valor = `; ${valorDecodificado}`;
    // partes = valor.split('; nomeUsuario=');
    // if (partes.length === 2)
    // {
    //     resultado = partes.pop().split(';').shift();
    // }
    // if (resultado !== undefined)
    // {
    //     document.getElementById('nomeResponsavel').value = resultado;
    // }

    // data = new Date();

    // document.getElementById('dataPropsota').valueAsDate = data.getFullYear();

    curl -i -x OPTIONS -H ""

    console.log("Tá rodando");
    
    fetch('http://localhost/compassSlim/getUsuario')
    .then((response) => response.json())
    .then((json) => setNome(json))
}

function setNome(valor)
{
    console.log(valor);
    // document.getElementById('nomeResponsavel').value = valor.nm_nome_completo;
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
        if (valorMercadoria != "" && container != "" && porcentagemSusp != "")
        {
            document.getElementById('valorSusp').value = (valorMercadoria * (porcentagemSusp / 100));
        }
    }
    else
    {
        document.getElementById('valorSusp').value = 0;
    }
    //Calculando o valor total do imposto do seguro
    document.getElementById('totalImpostoSeguro').value = (valorMercadoria + container + parseFloat(document.getElementById('valorSusp').value));
    totalImpostoSeguro = document.getElementById('totalImpostoSeguro').value;
    porcentagemRCTRC = document.getElementById('porcentagemRCTRC').value;
    //Calculando o valor de RCTRC
    if (totalImpostoSeguro != "" && porcentagemRCTRC != "")
    {
        document.getElementById('valorRCTRC').value = (totalImpostoSeguro * (porcentagemRCTRC / 100));
    }
    porcentagemRCFDC = document.getElementById('porcentagemRCFDC').value;
    //Calculando valor RCFDC
    if(totalImpostoSeguro != "" && porcentagemRCFDC !="")
    {
        document.getElementById('valorRCFDC').value = (totalImpostoSeguro * (porcentagemRCFDC / 100));
    }
}   