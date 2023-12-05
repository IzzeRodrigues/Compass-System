
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
            <?php
                
                @session_start();
                $texto = $_SESSION['AvisoEnvioFinalEmail']
                
            ?>
        </div>
    </div>
</body>
<script src="js/javaAssinatura.js" type="text/javascript"></script>
