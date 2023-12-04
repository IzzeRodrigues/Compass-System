@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Gerenciar Cliente')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')

            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Gerenciar Clientes
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome Empresa</th>
                                    <th>Responsável</th>
                                    <th>E-mail Responsável</th>
                                    <th>Contato Responsável</th>
                                    <th>Status</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome Empresa</th>
                                    <th>Responsável</th>
                                    <th>E-mail Responsável</th>
                                    <th>Contato Responsável</th>
                                    <th>Status</th>
                                    <th>Ação</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                    <?php 
                                        @session_start();
                                        $cliente = DB::table('tb_cliente')
                                        ->join('tb_responsavel_cliente', 'tb_cliente.cd_cliente', 'tb_responsavel_cliente.cd_cliente')
                                        ->join('tb_email_responsavel_cliente', 'tb_responsavel_cliente.cd_responsavel_cliente', 'tb_email_responsavel_cliente.cd_responsavel_cliente')
                                        ->get();
                                        // echo($cliente);
                                        foreach ($cliente as $cliente) {
                                        echo("<tr>
                                                <td>$cliente->cd_cliente</td>
                                                <td>$cliente->nm_empresa_cliente</td>
                                                <td>$cliente->nm_responsavel_cliente</td>
                                                <td>$cliente->nm_email_responsavel_cliente</td>
                                                <td>$cliente->nr_telefone_responsavel_cliente</td>
                                                <td>$cliente->ds_tipo_cliente</td>
                                                <td>
                                                    <div class='d-flex justify-content-center'>
                                                        <a href='/vercliente?ID=$cliente->cd_cliente'><button type='button' class='btn btn-compass-color mx-1 btnhv'>Ver/Editar</button></a>
                                                        ");
                                                        if ($_SESSION['Usuario']['privilegio'] == "Adm")
                                                        {
                                                            echo("
                                                            <a href='/deletarCliente?ID=$cliente->cd_cliente'><button type='button' class='btn btn-danger me-1 btnhv'>Excluir</button></a>
                                                            ");
                                                        }
                                                        echo("
                                                        </div>
                                                </td>
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
