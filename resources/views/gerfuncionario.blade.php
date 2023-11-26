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
                                <tr>
                                    <td>1</td>
                                    <td>Marco Antonio Carvalho</td>
                                    <td>Diretor Nacional de Negócios</td>
                                    <td>marco.antonio@aclcargo.com.br</td>
                                    <td>Administrador</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Luiz Carlos B. dos Santos</td>
                                    <td>Diretor Geral</td>
                                    <td>luiz@aclcargo.com.br</td>
                                    <td>Administrador</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Douglas Schiavoni</td>
                                    <td>Vendas e Relacionamento</td>
                                    <td>comercialmg@aclcargo.com.br</td>
                                    <td>Usuário</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Cristiano Bexiga</td>
                                    <td>Vendas e Relacionamento</td>
                                    <td>comercial@aclcargo.com.br</td>
                                    <td>Usuário</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Bruno Nabuco</td>
                                    <td>Líder de Negócios</td>
                                    <td>comercialsp@aclcargo.com.br</td>
                                    <td>Usuário</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Patrícia Barbosa</td>
                                    <td>Vendas e Relacionamento</td>
                                    <td>comercial.pr@aclcargo.com.br</td>
                                    <td>Usuário</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Helena Carvalho</td>
                                    <td>Vendas e Relacionamento</td>
                                    <td>helena@aclcargo.com.br</td>
                                    <td>Usuário</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Rafael Pedroso</td>
                                    <td>Vendas e Relacionamento</td>
                                    <td>comercialgo@aclcargo.com.br</td>
                                    <td>Usuário</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
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
