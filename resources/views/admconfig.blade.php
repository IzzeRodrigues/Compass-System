@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Configurações')
    @section('master')
    @section('conteudo')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Compass</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Configurações</li>
        </ol>
        <div class="row">
            <h3>Senha</h3>
            <div class="col-md-3 col-sm-6 col-12 mb-3">
                <label>Alterar Senha</label>
                <input type="password" class="form-control">
            </div>
            <div class="col-md-3 col-sm-6 col-12 mb-3">
                <label>Confirmar Senha</label>
                <input type="password" class="form-control">
            </div>
        </div>
        <div class="row">
            <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="submit">Salvar</button></a>
            </div>
            <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6">
                <a href="#"><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="">Cancelar</button></a>
            </div>
        </div>
    </div>
    @stop
    @stop

</body>
</html>