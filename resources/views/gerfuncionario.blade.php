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
                                    <th>Nome Completo</th>
                                    <th>Cargo</th>
                                    <th>E-mail</th>
                                    <th>Privilégios</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome Completo</th>
                                    <th>Cargo</th>
                                    <th>E-mail</th>
                                    <th>Privilégios</th>
                                    <th>Ação</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php

                                    @session_start();
                                    $usuario = DB::table('tb_usuario')
                                    ->join('tb_privilegio', 'tb_usuario.cd_usuario', 'tb_privilegio.cd_usuario')
                                    ->join('tb_email_usuario', 'tb_usuario.cd_usuario', 'tb_email_usuario.cd_usuario')
                                    ->get();

                                    foreach ($usuario as $usuario) {
                                        echo("<tr>
                                                <td>$usuario->cd_usuario</td>
                                                <td>$usuario->nm_nome_completo</td>
                                                <td>$usuario->nm_cargo_usuario</td>
                                                <td>$usuario->nm_email_usuario</td>
                                                <td>$usuario->nm_privilegio</td>
                                                <td>
                                                    <div class='d-flex justify-content-center'>
                                                        <a href='/verfuncionario?ID=$usuario->cd_usuario'><button type='button' class='btn btn-compass-color mx-1 btnhv'>Ver/Editar</button></a>
                                                        ");
                                                        if ($_SESSION['Usuario']['privilegio'] == "Adm")
                                                        {
                                                            echo("
                                                            <a href='/deletarUsuario?ID=$usuario->cd_usuario'><button type='button' class='btn btn-danger me-1 btnhv'>Excluir</button></a>
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
