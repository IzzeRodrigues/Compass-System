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
        var descricao = document.createElement("descricao");
        var item = descricao.text;

        const sgMail = require('@sendgrid/mail');
        const { SENDGRID_API_KEY } = process.env; 
        const sessao = {
            0: 'isa.prates@booat.com.br',
            1: 'Nome do Destinatário',
        };
        const link = 'link.com.br';
        const token = '123456';
        const msg = {
            to: {
                email: sessao[0],
                name: sessao[1],
            },
            from: {
                email: 'compassalgoritimo@gmail.com',
                name: 'Algoritmo - Compass',
            },
            subject: 'ERRO NA PROPOSTA! O CLIENTE tal ENVIOU UM ERRO REFERENTE A PROPOSTA DE ID acl0001',
            html: `${item}, acesse o link ${link} e insira o token a seguir: ${token}.`,
        };
        sgMail.setApiKey(SENDGRID_API_KEY);
        sgMail.send(msg)

            .then(() => {
                console.log('E-mail enviado com sucesso!');
            })
            .catch((error) => {
                console.error('Erro ao enviar e-mail:', error.toString());
            });


    };
}
