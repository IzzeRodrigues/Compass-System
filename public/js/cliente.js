var pegouCliente = false;

if (!pegouCliente)
{
    var parametros = new URLSearchParams(window.location.search);
    var parametros = parametros.get('ID');
    fetch(`http://localhost:8000/pegarCliente?ID=${parametros}`)
    .then((response) => response.json())
    .then((json) => preencherCliente(json))

    function preencherCliente(cliente)
    {
        console.log(cliente);
        document.getElementById('nomeCliente').value = cliente['Cliente'][0].nm_empresa_cliente;
        document.getElementById('tipoCliente').value = cliente['Cliente'][0].ds_tipo_cliente;
        document.getElementById('valorNomeContatoCliente').value = cliente['Cliente'][0].nm_responsavel_cliente
        document.getElementById('valorEmailContatoCliente').value = cliente['Cliente'][0].nm_email_responsavel_cliente;
        document.getElementById('valorTelefoneContatoCliente').value = cliente['Cliente'][0].nr_telefone_responsavel_cliente;
        document.getElementById('idCliente').value = cliente['Cliente'][0].cd_cliente;
    }
    pegouCliente = true;
}
