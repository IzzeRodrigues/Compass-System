
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
            <p>Para assinar o seu documento, precisamos revisar todas as informações.</p>
        </div>
        <div class="d-flex justify-content-center localPDF">
            <object class="col-10" data="http://localhost/Compass/criadorPDF" type="application/pdf"></object>
        </div>
        <div class="col-12">
            <div class="d-flex flex-column align-items-center col-12">
                <p>Todas as informações estão corretas? </p>
                <div class="d-flex justify-content-evenly col-6">
                    <button id="sim" onclick='exibeRepresentante()' class="col-5 btn-compass-color border border-0 rounded-4 px-4 =">Sim</button>
                    <button id="nao" onclick='errado()' class="col-5 btn-compass-color border border-0 rounded-4 px-4 =">Não</button>
                </div>
            </div>
            <div id="exibicao" class="d-none">
                <p class="pt-5">Insira as informações necessárias para assinar sua proposta comercial de acordo.</p>
                <div>
                    <form method="GET" action="/pegarValorAssinante">
                        <div class="d-flex flex-column align-items-center">
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
                            <button name='envio' value='envio' id='envio'
                                class="col-3 btn-compass-color border border-0 rounded-4 mt-3">Assinar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="js/javaAssinatura.js" type="text/javascript"></script>
