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
    @section('title', 'Compass - Ver/Editas Funcionário')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
    <script src="/js/verificarPrivilegio.js"></script>
    <script>verificarPrivilegio("administrador")</script>

            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Ver/Editar Funcionário</li>
                </ol>
                <form method="get" action="/adicionarUsuario">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-12 form-group mb-3">
                            <label>Nome Completo</label>
                            <input type="text" name="nomeFuncionario" class="form-control">
                        </div>
                        <div class="col-md-6 col-sm-6 col-12 form-group mb-3">
                            <label>Cargo</label>
                            <select class="form-control" name="cargo">
                                <option selected disabled>Selecione...</option>
                                <option value="Diretoria Geral">Diretoria Geral</option>
                                <option value="Diretoria Nacional de Negócios">Diretoria Nacional de Negócios</option>
                                <option value="Líder de Negócios">Líder de Negócios</option>
                                <option value="Vendas e Relacionamento">Vendas e Relacionamento</option>
                            </select>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-5 col-sm-12 col-12 form-group mb-3">
                            <label>E-mail</label>
                            <div class="input-group">
                            <input type="text" class="form-control" name="email" placeholder="exemplo@acl.com.br">
                            <span class="input-group-text span-class" id="basic-addon2">@aclcargo.com.br</span>
                        </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3">
                            <label>Privilégios</label>
                            <select class="form-control" name="privilegio">
                                <option selected disabled>Selecione...</option>
                                <option value="Adm">Administrador</option>
                                <option value="Usuario">Usuário</option>
                            </select>
                        </div>

                        <div class="col-md-3 col-sm-6 col-12 form-group mb-3 input-senhafunc">
                            <label>Senha</label>
                            <input type="password" id="senha-func" class="form-control passcfg2">
                            <i class="bi bi-eye eye-open2" id="eye-senha-func2" name="open-eye" onclick="mostrarSenha()"></i>
                        </div>
                    </div>
                    <div class="row justify-content-end mt-3">
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6 col-6">
                            <a><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="submit">Salvar</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6 col-6">
                            <a><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn danger" role="button" type="">Excluir</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6 col-6">
                            <a><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="">Cancelar</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
        @stop
        @stop
    </div>
    <script src="/js/showpassfunc.js"></script>

</body>
</html>
