@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Adicionar Cliente')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Adicionar Cliente</li>
                </ol>
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-12 mb-3">
                        <label>Nome da Empresa</label>
                        <input type="text" class="form-control" placeholder="Danone Ltda">
                    </div>
                    <div class="col-md-4 col-sm-6 col-12 mb-3">
                        <label>Responsável</label>
                        <input type="text" class="form-control" placeholder="João">
                    </div>
                    <div class="col-md-4 col-sm-6 col-12 mb-3">
                        <label>E-mail Responsável</label>
                        <input type="text" class="form-control" placeholder="exemplo@email.com.br">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-12 mb-3">
                        <label>Contato Responsável</label>
                        <input type="tel" class="form-control" placeholder="(13)99123-4567">
                    </div>
                    <div class="col-md-4 col-sm-6 col-12 mb-3">
                        <label>Status</label>
                        <select class="form-control">
                            <option selected disabled>Selecione...</option>
                            <option>Prospectando</option>
                            <option>Em Cotação</option>
                            <option>Operação em Andamento</option>
                            <option>Cliente Cargo</option>
                            <option>Cliente MM</option>
                        </select>
                    </div>
                </div>
                    <div class="row justify-content-end mt-1">

                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="submit">Salvar</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                            <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="button">Cancelar</button></a>
                        </div>
                    </div>
            </div>
        </main>
            @stop
    @stop
    </div>


</body>
</html>