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
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Danone</td>
                                    <td>Marcia Lopes</td>
                                    <td>Marcia.lopes@danone.com.br</td>
                                    <td>(31) 3111-2222</td>
                                    <td>Cliente MM</td>
                                    <td><a href="/vercliente"><button type="button" class="btn btn-compass-color mx-1 btnhv">Ver/Alterar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
        </main>
        @stop
        @stop
    </div>


</body>
</html>
