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
        {{-- <script src="/js/verificarLogin.js"></script> --}}
        {{-- <script>verificarLoginPaginas()</script> --}}
        <?php
            @session_start();
            if (isset($_SESSION['Usuario']))
            {
                if ($_SESSION['Usuario']['logado'] == "true")
                {

                }
                else
                {
                    echo("<script>window.location.href = 'http://localhost:8000/deslogar'</script>");
                }
            }
            else
            {
                echo("<script>window.location.href = 'http://localhost:8000/deslogar'</script>");
            }
        ?>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark bg-perso">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3 fs-5" href="/admindex">ACL Cargo</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Pesquisa..." aria-label="Pesquisa..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
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
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/admconfig">Configurações</a></li>
                        <li><a class="dropdown-item" href="#!">Atividades</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/deslogar">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark bg-perso" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading side-title">Principal</div>

                            <?php
                            if (isset($_SESSION['Usuario']['privilegio']))
                            {
                                if ($_SESSION['Usuario']['privilegio'] == "Adm")
                                {
                                    echo("
                                    <a class='nav-link' href='/admindex'>
                                        <div class='sb-nav-link-icon'><i class='fas fa-tachometer-alt'></i></div>
                                        Dashboard
                                    </a>
                                    <div class='sb-sidenav-menu-heading side-title'>Admin</div>
                                    <a class='nav-link collapsed' href='#' data-bs-toggle='collapse' data-bs-target='#collapseLayouts' aria-expanded='false' aria-controls='collapseLayouts'>
                                        <div class='sb-nav-link-icon'><i class='fas fa-columns'></i></div>
                                        Funcionários
                                        <div class='sb-sidenav-collapse-arrow'><i class='fas fa-angle-down'></i></div>
                                    </a>

                                    <div class='collapse' id='collapseLayouts' aria-labelledby='headingOne' data-bs-parent='#sidenavAccordion'>
                                        <nav class='sb-sidenav-menu-nested nav'>
                                            <a class='nav-link' href='/addfuncionario'>Adicionar</a>
                                            <a class='nav-link' href='/gerfuncionario'>Procurar</a>
                                        </nav>
                                    </div>");
                                }
                                else
                                {
                                    if ($_SESSION['Usuario']['privilegio'] == "Usuario")
                                    {
                                        echo
                                        ("
                                            <a class='nav-link' href='/comercial'>
                                                <div class='sb-nav-link-icon'><i class='fas fa-tachometer-alt'></i></div>
                                                Dashboard
                                            </a>
                                        ");
                                    }
                                }
                            }


                            ?>



                            <div class="sb-sidenav-menu-heading side-title">Comercial</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Propostas
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="/addproposta">Adicionar</a>
                                    <a class="nav-link collapsed" href="/gerproposta">Procurar</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseClientes" aria-expanded="false" aria-controls="collapseClientes">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Clientes
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseClientes" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="/addcliente">Adicionar</a>
                                    <a class="nav-link collapsed" href="/gercliente">Procurar</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer bg-perso">
                        <div class="small side-title">Olá,&nbsp; <?php if(isset($_SESSION['Usuario']['cargo'])){echo($_SESSION['Usuario']['cargo']);} ?></div>
                        <div class="side-title"><?php if(isset($_SESSION['Usuario']['nome'])){echo($_SESSION['Usuario']['nome']);}?></div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    @yield ('conteudo')
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Compass 2023 - Todos os direitos reservados.</div>
                            <div>
                                <a href="#">Política de Privacidade</a>
                                &middot;
                                <a href="#">Termos &amp; Condições</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/comercial-chart-area-demo.js"></script>
        <script src="assets/demo/comercial-chart-bar-demo.js"></script>
        <script src="js/scripts.js"></script>
        {{-- <script src="js/showpass.js"></script> --}}
        <script src="js/script.js" defer></script>
    </body>
</html>
