function exibeRepresentante() {
    var pegando = document.getElementById('exibicao')
    pegando.classList.remove('d-none');
    pegando.classList.add('d-block');
}
function voltaPreencher() {
    location.href = 'http://localhost:8000/addproposta';
}
function errado() {
    var erro = prompt("Descreva com detalhes o que tem de errado com o seu contrato?");
    
    if (erro == null || erro == "") {
        alert("Sem erros no contrato, voltando para assinar!");
    } else {
        location.href = `http://localhost:8000/enviarErro?Erro=${erro}`
        alert("Reclamação enviada. Aguarde resposta do setor comercial.")
    };
}
function mudaBotao() {
    var pega = document.getElementById('envio')
    pega.classList.remove('disabled', 'btn-primary');
    pega.classList.add('btn-compass-color');
}