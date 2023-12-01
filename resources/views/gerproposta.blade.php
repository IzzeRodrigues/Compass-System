@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Gerenciar Propostas')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')

            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        Gerenciar Propostas
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Referência ACL</th>
                                    <th>Tipo de Proposta</th>
                                    <th>Nome da Empresa</th>
                                    <th>Origem</th>
                                    <th>Destino</th>
                                    <th>Tipo Veículo</th>
                                    <th>Tipo Operação</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Referência ACL</th>
                                    <th>Tipo de Proposta</th>
                                    <th>Nome da Empresa</th>
                                    <th>Origem</th>
                                    <th>Destino</th>
                                    <th>Tipo Veículo</th>
                                    <th>Tipo Operação</th>
                                    <th>Ação</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php
                                    @session_start();
                                    $usuario = DB::table('tb_email_usuario')->join('tb_usuario', 'tb_email_usuario.cd_usuario', '=', 'tb_usuario.cd_usuario')->where('tb_email_usuario.nm_email_usuario', '=', $_SESSION['Usuario']['email'])->get();
                                    $usuario = $usuario[0]->cd_usuario;
                                    if ($_SESSION['Usuario']['privilegio'] == 'Adm')
                                    {
                                        $propostas = DB::table('tb_proposta')->join('tb_cliente', 'tb_proposta.cd_proposta', '=', 'tb_cliente.cd_proposta')->join('tb_rota', 'tb_proposta.cd_proposta', '=', 'tb_rota.cd_proposta')->join('tb_veiculo', 'tb_proposta.cd_proposta', '=', 'tb_veiculo.cd_proposta')->join('tb_operacao', 'tb_proposta.cd_proposta', '=', 'tb_operacao.cd_proposta')->get();
                                    }
                                    else
                                    {
                                        if($_SESSION['Usuario']['privilegio'] == "Usuario")
                                        $propostas = DB::table('tb_proposta')->join('tb_cliente', 'tb_proposta.cd_proposta', '=', 'tb_cliente.cd_proposta')->join('tb_rota', 'tb_proposta.cd_proposta', '=', 'tb_rota.cd_proposta')->join('tb_veiculo', 'tb_proposta.cd_proposta', '=', 'tb_veiculo.cd_proposta')->join('tb_operacao', 'tb_proposta.cd_proposta', '=', 'tb_operacao.cd_proposta')->where('tb_proposta.cd_usuario', '=', $usuario)->get();
                                    }
                                    // var_dump($propostas);
                                    foreach ($propostas as $proposta) {
                                        echo("<tr>
                                                <td>$proposta->nm_referencia_acl</td>
                                                <td>$proposta->ds_tipo_proposta</td>
                                                <td>$proposta->nm_empresa_cliente</td>
                                                <td>$proposta->nm_cidade_origem_rota</td>
                                                <td>$proposta->nm_cidade_destino_rota</td>
                                                <td>$proposta->nm_veiculo</td>
                                                <td>$proposta->nm_tipo_operacao</td>
                                                <td><a href='/verproposta?ID=$proposta->cd_proposta'><button type='button' class='btn btn-compass-color mx-1 btnhv'>Ver/Editar</button></a><button type='button' class='btn btn-danger me-1 btnhv'>Excluir</button></td>
                                            </tr>");
                                    }
                                    
                                ?>
                            </tbody>
                        </table>
                    </div>
        </main>
        @stop
        @stop
    </div>


</body>
</html>
