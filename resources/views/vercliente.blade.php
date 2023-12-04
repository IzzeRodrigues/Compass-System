@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/favicon/favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Ver/Editar Clientes')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Ver/Editar Clientes</li>
                </ol>
                <form method="GET" action="/alterarCliente">
                    <input type="hidden" id="idCliente" name="idCliente">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>Nome da Empresa</label>
                            <input id="nomeCliente" name="nomeCliente" type="text" class="form-control" placeholder="Danone Ltda">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>ACL</label>
                            <select id="tipoCliente" name="tipoCliente" class="form-control">
                                <option value="naoSelecionado"selected disabled>Selecione...</option>
                                <option value="Cliente Cargo">Cliente Cargo</option>
                                <option value="Cliente Multi">Cliente Multi</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>Responsável</label>
                            <input id="valorNomeContatoCliente" name="valorNomeContatoCliente" type="text" class="form-control" placeholder="João">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>E-mail Responsável</label>
                            <input id="valorEmailContatoCliente" name="valorEmailContatoCliente" type="text" class="form-control" placeholder="exemplo@email.com.br">
                        </div>
                        <div class="col-md-4 col-sm-6 col-12 mb-3">
                            <label>Contato Responsável</label>
                            <input id="valorTelefoneContatoCliente" name="valorTelefoneContatoCliente" type="tel" class="form-control" placeholder="(13)99123-4567">
                        </div>
                    </div>
                    <div class="row justify-content-end mt-1">
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="submit">Salvar</button>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="/gercliente"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="button">Cancelar</button></a>
                        </div>
                    </div>    
                </form>
            </div>
        </main>
        <script src="js/cliente.js"></script>
            @stop
    @stop
    </div>


</body>
</html>
