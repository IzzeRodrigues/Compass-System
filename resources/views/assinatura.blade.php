
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>@yield('title')</title>
    <link rel="shortcut icon" href="/images/favicon/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="sb-nav-fixed dashboardTxt">

    <?php

        @session_start();

        if(isset($_SESSION['ErroAssinaturaCliente']))
        {
            $erro = $_SESSION['ErroAssinaturaCliente'];
            unset($_SESSION['ErroAssinaturaCliente']);
            echo("<script>alert('$erro')</script>");
        }

    ?>
    
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark bg-perso">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3 fs-5">ACL Cargo</a>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        </form>
        <div>
            <input type="checkbox" name="change-theme" id="change-theme" class="tema">
            <label for="change-theme">
                <i class="bi bi-sun"></i>
                <i class="bi bi-moon"></i>
            </label>
        </div>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">

        </ul>
    </nav>

    <div class="pt-4 ps-4">
        <div>
            <p class="fs-5 ">O cliente deseja assinar digitalmente?</p>
        </div>
        <div class="d-flex flex-column align-items-center">
            <p class="col-10">Para assinar o seu documento, precisamos revisar todas as informações.</p>
            <object class="col-10 localPDF" data="http://localhost/Compass/criadorPDF" type="application/pdf"></object>
        </div>
        <div class="col-12">
            <div class="d-flex flex-column align-items-center col-12">
                <p>Todas as informações estão corretas? </p>
                <div class="d-flex justify-content-evenly col-6">
                    <button id="sim" onclick='exibeRepresentante()' class="col-3 btn-compass-color border border-0 rounded-4 px-4 =">Sim</button>
                    <button id="nao" onclick='errado()' class="col-3 btn-compass-color border border-0 rounded-4 px-4 =">Não</button>
                </div>
            </div>
            <div id="exibicao" class="d-none col-12 justify-content-center">
                <div>
                    <form method="GET" action="/pegarValorAssinante">
                        <div class="d-flex flex-column align-items-center">
                            <p class="pt-5 col-10">Insira as informações necessárias para assinar sua proposta comercial de acordo.</p>
                            <div class="d-flex col-10">
                                <div class="col-3 pe-2">
                                    <label label for="nome">Nome completo</label>
                                    <input name="nomeAssinante" id="nomeAssinante" type="text"
                                        class="form-control" placeholder="João da Silva">
                                </div>
                                <div class="col-3 pe-1">
                                    <label for="documento">Documento de identidade (CPF)</label>
                                    <input name="docAssinante" id="docAssinante" type="text" class="form-control"
                                        placeholder="000.000.000-00">
                                </div>
                                <div class="col-3 ps-1">
                                    <label for="email">Email</label>
                                    <input name="emailAssinante" id="emailAssinante" type="text"
                                        class="form-control" placeholder="João.Representante@email.com">
                                </div>
                                <div class="col-3 ps-2">
                                    <label for="email">Token fornecido no Email</label>
                                    <input name="token" id="token" type="text"
                                        class="form-control" placeholder="000001">
                                </div>
                            </div>
                            <div>
                                <p class="mt-3 text-center">Política de uso e privacidade – Assinatura digital Compass</p>
                                    <textarea cols="60" rows="10"  style="resize: none" disabled>
Definições:
Cliente / Assinante: indivíduo solicitado a participar de um processo de assinaturas via plataforma Compass desenvolvido pela Algoritmo.
Operador / Contratante: indivíduo com acesso à plataforma Compass, com poder de solicitar assinaturas via site e, dependendo do seu nível de acesso, pode criar documentos.
Operador Compass: É o meio utilizado para disparar documentos para assinatura, acessar arquivos já enviados, enviar notificações, baixar cópias de contratos, entre outras ações.
Dados: qualquer informação relativa a uma pessoa, empresa ou documento, identificada ou não.
Documentos: arquivos em PDF anexado na plataforma via site para ser assinado via Compass.
Legislação As assinaturas digitais estão previstas na MP 2.200-2/2001, e a plataforma Compass está amparado no artigo 10, § 2o:
MP 2.200-2/2001 (http://www.planalto.gov.br/ccivil_03/mpv/antigas_2001/2200-2.htm)
MEDIDA PROVISÓRIA No 2.200-2, DE 24 DE AGOSTO DE 2001.
“Art. 10. Consideram-se documentos públicos ou particulares, para todos os fins legais, os documentos eletrônicos de que trata esta Medida Provisória.
§ 2o O disposto nesta Medida Provisória não obsta a utilização de outro meio de comprovação da autoria e integridade de documentos em forma eletrônica, inclusive os que utilizem certificados não emitidos pela ICP-Brasil, desde que admitido pelas partes como válido ou aceito pela pessoa a quem for oposto o documento.”
LEI Nº 14.063, DE 23 DE SETEMBRO DE 2020
“Art. 4º Para efeitos desta Lei, as assinaturas eletrônicas são classificadas em:
I - Assinatura eletrônica simples:
a) a que permite identificar o seu signatário;
b) a que anexa ou associa dados a outros dados em formato eletrônico do signatário;
II - Assinatura eletrônica avançada: a que utiliza certificados não emitidos pela ICP-Brasil ou outro meio de comprovação da autoria e da integridade de documentos em forma eletrônica, desde que admitido pelas partes como válido ou aceito pela pessoa a quem for oposto o documento, com as seguintes características:
a) está associada ao signatário de maneira unívoca;
b) utiliza dados para a criação de assinatura eletrônica cujo signatário pode, com elevado nível de confiança, operar sob o seu controle exclusivo;
c) está relacionada aos dados a ela associados de tal modo que qualquer modificação posterior é detectável;
III - assinatura eletrônica qualificada: a que utiliza certificado digital, nos termos do § 1º do art. 10 da Medida Provisória nº 2.200-2, de 24 de agosto de 2001.
§ 1º Os 3 (três) tipos de assinatura referidos nos incisos I, II e III do caput deste artigo caracterizam o nível de confiança sobre a identidade e a manifestação de vontade de seu titular, e a assinatura eletrônica qualificada é a que possui nível mais elevado de confiabilidade a partir de suas normas, de seus padrões e de seus procedimentos específicos.
§ 2º Devem ser asseguradas formas de revogação ou de cancelamento definitivo do meio utilizado para as assinaturas previstas nesta Lei, sobretudo em casos de comprometimento de sua segurança ou de vazamento de dados.”
Funcionamento e Confiabilidade da Plataforma:
Todo cadastro de documentos e signatários inicia-se com uma proposta criada a partir da plataforma Compass. O operador insere os dados do cliente a serem assinados e as pessoas envolvidas na assinatura, os dados para identificar o indivíduo.
Esses dados são: Nome completo, CPF, Email.
Outros dados escolhidos para identificar os signatários (como RG, Passaporte etc.) Precisam ser informadas anteriormente ao operador.
Cada pessoa envolvida para assinar um documento recebe uma notificação em seu e-mail com um código (token) temporário, e um link pessoal e intransferível.
Com o link, o cliente visualizará o documento enviado para assinatura e, caso todas as informações estiverem corretas, para assinar, deverá confirmar seu e-mail, nome completo, CPF e um código (token) gerado com duração limitada para preencher na tela. Após o preenchimento, teremos a confirmação se o e-mail é realmente da pessoa.
Solicitação de uso do token público emitido pelo ICP Brasil.
As partes envolvidas poderão acompanhar quem já assinou e, ao final, o cliente recebe um e-mail com o documento assinado, já assinado e cadastrado com um código único, totalmente protegido de falsificações ou alterações do conteúdo. Já o operador, receberá o documento assinado dentro da dashboard do sistema Compass. Eles poderão copiar, guardar em pastas, na nuvem, no pen drive, entre outras possibilidades. A duração é eterna.
</textarea>
                                </div>
                            <button name='envio' value='envio' id='envio'
                                class="col-2 btn-compass-color border border-0 rounded-4 mt-3 mb-5">Assinar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="js/javaAssinatura.js" type="text/javascript"></script>
