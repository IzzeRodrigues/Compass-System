<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Compass - Login</title>
    <link rel="shortcut icon" href="/images/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

    <script src="/js/verificarLogin.js"></script>
    <script>verificarLoginInicio()</script>

    <?php
        // if(isset($_COOKIE['statusLogin']))
        // {
        //     if($_COOKIE['statusLogin'])
        //     {
        //         return redirect()->route("verificarUsuario");
        //     };
        // };
    ?>

    <div class="container-fluid standartTxt align-items-end at100vh d-flex flex-column justify-content-between col-12 px-0">
        <header></header>
        <main class="col-12">

            <section>

                

                <div class="altura">
                    <div class="row d-block d-lg-none text-center">
                        <img class="img-mobile mx-auto" src="/images/compass-logo-horizontal.png" alt="Compass Logo">
                    </div>
                    <div class="row text-center altura col-12 m-0">
                        <div class="col-12 col-sm-12 col-lg-6 text-center mx-sm-auto">
                            <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-xl-0 mt-xl-n5">

                                <form class="mx-sm-auto" method="get" action="/verificarUsuario">
                                    <h3 class="fw-normal mb-3 pb-3 welcometxt">Seja Bem-vindo(a)</h3>

                                    <div class="form-outline mb-4 ">
                                        <div class="input-group">
                                            <input type="email" name="usuario" id="form2Example17" class="form-control form-control-lg icon-user standartTxt shadow-sm input-log plog" placeholder="Usuário" />
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example18" name="senha" class="form-control form-control-lg form-text-pad icon-pass standartTxt shadow-sm input-log" placeholder="Senha" />
                                    </div>
                                    <div class="row">
                                        <div class="form-check col-6 text-start">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                            Lembrar-me
                                            </label>
                                        </div>
                                        <div class="col-6">
                                        <p class="text-end small mb-5 pb-lg-2"><a href="/forgotpass">Esqueceu sua senha?</a></p>
                                        </div>
                                    </div>
                                    <div class="pt-1 mb-4 d-grid gap-2">
                                        <a><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="submit" type="submit">Entrar</button></a>
                                    </div>

                                    <p class="small mb-5 pb-lg-2">Não tem cadastro? Contate o Administrador de sua empresa.</p>

                                </form>

                            </div>

                        </div>
                        <div class="col-lg-6 px-0 d-none d-lg-block posicao">
                            <div  class="logimg">
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
    <footer class="row d-flex flex-wrap justify-content-between align-items-center footerBg col-12 mx-0">
    <div class="col-md-4 d-flex align-items-center justify-content-start ps-1">
      <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
        <img  class="img-fluid algLogo" src="/images/algoritmo-logo.png" alt="Logo Compass">
      </a>
      <span class="mb-3 mb-md-0 footerFont">&copy; 2023 Algoritmo todos os direitos reservados.</span>
    </div>

    <ul class="nav col-md-4 justify-content-center list-unstyled d-flex pe-1">
        <li class="ms-3"><a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
            <img  class="img-fluid footerLogo" src="/images/facebook-logo.png" alt="Logo Facebook"></a>
        </li>
        <li class="ms-3"><a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
            <img  class="img-fluid footerLogo" src="/images/insta-logo.png" alt="Logo Instagram"></a>
        </li>
        <li class="ms-3"><a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
            <img  class="img-fluid footerLogo" src="/images/linkedin-logo.png" alt="Logo Linkedin"></a>
        </li>
    </ul>
    <div class="col-md-4 tog-log mx-0 pe-5">
                <input type="checkbox" name="change-theme" id="change-theme" class="tema">
                <label for="change-theme">
                    <i class="bi bi-sun"></i>
                    <i class="bi bi-moon"></i>
                </label>
            </div>
  </footer>
  </div>
  <script src="/js/bootstrap.js"></script>
  <script src="/js/script.js"></script>
  <script src="/js/erroLogin.js"></script>
</body>
</html>
