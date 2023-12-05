function colocarDados()
{
    fetch("http://localhost:8000/puxandoValoresDashboard")
    .then((response) => response.json())
    .then((json) => colocarDados2(json));
    
    function colocarDados2(json)
    {
        mensal = json['LucroMensal'];
        if ((mensal % 1) == 0)
        {
            mensal = `${mensal}.00`;
        }
        document.getElementById('localLucroMensal').innerHTML = `R$ ${mensal}`;

        comissao = json['Comissao'];
        if ((comissao % 1) == 0)
        {
            comissao = `${comissao}.00`;
        }
        document.getElementById('localComissao').innerHTML = `R$ ${comissao}`;

        propostas = json['Propostas'];
        propostas.forEach(element => {
            document.getElementById('localPropostasPendentes').innerText += `${element}`;
            document.getElementById('localPropostasPendentes').innerText += <br>;
        });
    }
}

