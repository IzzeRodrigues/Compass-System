var pegouCliente = false;

if (!pegouCliente)
{
    fetch(`http://localhost:8000/pegarProposta?ID=${parametros}`)
    .then((response) => response.json())
    .then((json) => cliente = json['Cliente'])

    document.getElementById('nomeCliente').value = cliente[0].nm_empresa_cliente;
    document.getElementById('tipoCliente').value = cliente[0].ds_tipo_cliente;
    document.getElementById('valorNomeContatoCliente').value = cliente[0].
    document.getElementById('valorEmailContatoCliente').value = cliente[0].nm_email_responsavel_cliente
    document.getElementById('valorTelefoneContatoCliente').value = cliente[0].
}