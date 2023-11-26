@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Gerenciar Funcionário')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')

            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
            {{-- <div class="table table-sm table-responsive-sm">
                <table class="table table-bordered table-hover" id="datatablesSimple">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome Completo</th>
                            <th scope="col">E-mail</th>
                            <th scope="col">Privilégio</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Marco Carvalho</td>
                            <td>marco.antonio@aclcargo.com.br</td>
                            <td>ADM</td>
                            <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Luiz Carlos</td>
                            <td>luiz@aclcargo.com.br</td>
                            <td>ADM</td>
                            <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Helena Carvalho</td>
                            <td>helena.carvalho@aclcargo.com.br</td>
                            <td>Usuário</td>
                            <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Cristiano Bexiga</td>
                            <td>cristiano.bexiga@aclcargo.com.br</td>
                            <td>Usuário</td>
                            <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>Bruno Nabuco</td>
                            <td>bruno.nabuco@aclcargo.com.br</td>
                            <td>Usuário</td>
                            <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <nav aria-label="Page navigation example    ">
                    <ul class="pagination paginate">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                </nav>
            </div> --}}
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    Gerenciar Funcionários
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome Completo</th>
                                <th>E-mail</th>
                                <th>Privilégio</th>
                                <th>Cargo</th>
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Nome Completo</th>
                                <th>E-mail</th>
                                <th>Privilégio</th>
                                <th>Cargo</th>
                                <th>Ação</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Marco Carvalho</td>
                                <td>marco.antonio@aclcargo.com</td>
                                <td>Administrador</td>
                                <td>Diretor Nacional de Negócios</td>
                                <td><a href="/verfuncionario"><button" class="btn btn-compass-color mx-1 btnhv">Ver/Editar</button></a><button type="button" class="btn btn-danger me-1 btnhv">Excluir</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        @stop
        @stop
    </div>


</body>
</html>
