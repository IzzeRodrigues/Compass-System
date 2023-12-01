@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Dashboard')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
        <?php

                @session_start();
            
            if(isset($_SESSION['Usuario']))
            {
                if($_SESSION['Usuario']['privilegio'] != "Usuario")
                {
                    echo("<script>window.location.href = 'http://localhost:8000/admindex'</script>");
                }
            }

        ?>
        {{-- <script src="js/verificarPrivilegio.js" type="text/javascript"></script> --}}
        {{-- <script>verificarPrivilegio("comercial")</script> --}}
            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-primary text-white mb-4 bg-perso card-height">
                            <div class="card-body">Comissão Do Mês Atual</div>
                            <p class="card-text card-just">R$2.413,25</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">Ver Detalhes</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-warning text-white mb-4 bg-perso card-height">
                            <div class="card-body">Propostas Pendentes</div>
                            <p class="card-text card-just">ACL 0023 <br> ACL 0031 <br> ACL 0041</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">Ver Detalhes</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-success text-white mb-4 bg-perso card-height">
                            <div class="card-body">Últimas Atividades</div>
                            <p class="card-text card-just">Você alterou a proposta ACL 0046 <br> Você concluiu a proposta ACL 0049<br>Você cancelou a proposta ACL 0013</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">Ver Detalhes</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-danger text-white mb-4 bg-perso card-height">
                            <div class="card-body"></div>
                            <p class="card-text card-just"></p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">Ver Detalhes</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Propostas deste mês
                            </div>
                            <div class="card-body"><canvas id="myComercialAreaChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Propostas deste ano
                            </div>
                            <div class="card-body"><canvas id="myComercialBarChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Últimas Propostas
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Tipo de Operação</th>
                                    <th>Cliente</th>
                                    <th>ID Proposta</th>
                                    <th>Data de Início</th>
                                    <th>Lucro</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>Tipo de Operação</th>
                                    <th>Cliente</th>
                                    <th>ID Proposta</th>
                                    <th>Data de Início</th>
                                    <th>Lucro</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php 
                                    $usuario = DB::table('tb_email_usuario')->join('tb_usuario', 'tb_email_usuario.cd_usuario', '=', 'tb_usuario.cd_usuario')->select('tb_usuario.cd_usuario','nm_nome_completo', 'nm_email_usuario')->where('tb_email_usuario.nm_email_usuario', '=', $_SESSION['Usuario']['email'])->get();
                                    $usuario = $usuario[0]->cd_usuario;
                                    $propostas = DB::table('tb_proposta')->join('tb_operacao', 'tb_proposta.cd_proposta', '=', 'tb_operacao.cd_proposta')->join('tb_cliente', 'tb_proposta.cd_proposta', '=', 'tb_cliente.cd_proposta')->join('tb_usuario', 'tb_proposta.cd_usuario', '=', 'tb_usuario.cd_usuario')->select('nm_nome_completo', 'nm_tipo_operacao', 'nm_empresa_cliente', 'nm_referencia_acl', 'dt_proposta', 'vl_lucro_bruto_operacao')->where('tb_proposta.cd_usuario', '=', $usuario)->get();
                                    foreach ($propostas as $proposta)
                                    {
                                        echo("<tr>
                                                <td>$proposta->nm_nome_completo</td>
                                                <td>$proposta->nm_tipo_operacao</td>
                                                <td>$proposta->nm_empresa_cliente</td>
                                                <td>$proposta->nm_referencia_acl</td>
                                                <td>$proposta->dt_proposta</td>
                                                <td>$proposta->vl_lucro_bruto_operacao</td>
                                            </tr>");
                                    }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        @stop
        @stop
    </div>

</body>
</html>