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
    <script src="js/admindex.js"></script>
        <?php

            @session_start();
            if(isset($_SESSION['Usuario']))
            {
                if($_SESSION['Usuario']['privilegio'] != "Adm")
                {
                    echo("<script>window.location.href = 'http://localhost:8000/comercial'</script>");
                }
            }

        ?>
        {{-- <script src="js/verificarPrivilegio.js" type="text/javascript"></script> --}}
        {{-- <script>verificarPrivilegio("administrador")</script> --}}
            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-primary text-white mb-4 bg-perso" style="height: 200px">
                            <div class="card-body">
                                Lucro Mensal
                                <div class="d-flex col-12 justify-content-center mt-5">
                                    <p class="card-text" style="font-size: 24px" id="localLucroMensal"><?php echo("<script>colocarDados()</script>") ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-warning text-white mb-4 bg-perso" style="height: 200px">
                            <div class="card-body">Propostas Pendentes</div>
                            <p class="card-text card-just" id="localPropostasPendentes">
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-danger text-white mb-4 bg-perso" style="height: 200px">
                            <div class="card-body">
                                Valor Total de Comissão
                                <div class="d-flex col-12 justify-content-center mt-5">
                                    <p class="card-text" style="font-size: 24px" id="localComissao"></p>
                                </div>
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
                            <div class="card-body"><canvas id="propostaMensal" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Propostas deste ano
                            </div>
                            <div class="card-body"><canvas id="propostaAnual" width="100%" height="40"></canvas></div>
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
                                    <th>Tipo de Assinatura</th>
                                    <th>Status</th>
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
                                    <th>Tipo de Assinatura</th>
                                    <th>Status</th>
                                    <th>Lucro</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                    <?php 
                                        @session_start();
                                        // var_dump($_SESSION['Usuario']['privilegio']);
                                        $propostas = DB::table('tb_proposta')->join('tb_operacao', 'tb_proposta.cd_proposta', '=', 'tb_operacao.cd_proposta')->join('tb_cliente_proposta', 'tb_proposta.cd_proposta', '=', 'tb_cliente_proposta.cd_proposta')->join('tb_usuario', 'tb_proposta.cd_usuario', '=', 'tb_usuario.cd_usuario')->select('nm_nome_completo', 'nm_tipo_operacao', 'nm_empresa_cliente', 'nm_referencia_acl', 'dt_proposta', 'vl_lucro_bruto_operacao', 'ds_tipo_assinatura', 'ds_status_proposta')->get();
                                        foreach ($propostas as $proposta)
                                        {
                                            echo("<tr>
                                                    <td>$proposta->nm_nome_completo</td>
                                                    <td>$proposta->nm_tipo_operacao</td>
                                                    <td>$proposta->nm_empresa_cliente</td>
                                                    <td>$proposta->nm_referencia_acl</td>
                                                    <td>$proposta->dt_proposta</td>
                                                    <td>$proposta->ds_tipo_assinatura</td>
                                                    <td>$proposta->ds_status_proposta</td>
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