@extends('master')
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    @section('title', 'Compass - Impostos')
    <div id="layoutSidenav_content">
        <main>
    @section('master')
    @section('conteudo')
    <script src="/js/verificarPrivilegio.js"></script>
    <script>verificarPrivilegio("administrador")</script>

            <div class="container-fluid px-4">
                <h1 class="mt-4">Compass</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Gerenciar Impostos</li>
                </ol>
                <form method="get" action="/adicionarUsuario">
                    <div class="row">
                        <label>ICMS</label>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Origem</label>
                            <select class="form-control" name="">
                            <option value="naoSelecionado" selected disabled>Selecione...</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espírito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Destino</label>
                            <select class="form-control" name="">
                            <option value="naoSelecionado" selected disabled>Selecione...</option>
                                        <option value="AC">Acre</option>
                                        <option value="AL">Alagoas</option>
                                        <option value="AP">Amapá</option>
                                        <option value="AM">Amazonas</option>
                                        <option value="BA">Bahia</option>
                                        <option value="CE">Ceará</option>
                                        <option value="DF">Distrito Federal</option>
                                        <option value="ES">Espírito Santo</option>
                                        <option value="GO">Goiás</option>
                                        <option value="MA">Maranhão</option>
                                        <option value="MT">Mato Grosso</option>
                                        <option value="MS">Mato Grosso do Sul</option>
                                        <option value="MG">Minas Gerais</option>
                                        <option value="PA">Pará</option>
                                        <option value="PB">Paraíba</option>
                                        <option value="PR">Paraná</option>
                                        <option value="PE">Pernambuco</option>
                                        <option value="PI">Piauí</option>
                                        <option value="RJ">Rio de Janeiro</option>
                                        <option value="RN">Rio Grande do Norte</option>
                                        <option value="RS">Rio Grande do Sul</option>
                                        <option value="RO">Rondônia</option>
                                        <option value="RR">Roraima</option>
                                        <option value="SC">Santa Catarina</option>
                                        <option value="SP">São Paulo</option>
                                        <option value="SE">Sergipe</option>
                                        <option value="TO">Tocantins</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Valor %</label>
                            <input type="number" name="alterICMS" id="alterICMS" class="form-control">
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% PIS</label>
                            <input type="number" name="alterICMS" id="editPIS" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% IRPJ</label>
                            <input type="number" name="alterICMS" id="editICMS" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Adic IRPJ</label>
                            <input type="number" name="alterICMS" id="editAdicIRPJ" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% COFINS</label>
                            <input type="number" name="alterICMS" id="editCOFINS" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>Imp. Susp.</label>
                            <input type="number" name="alterICMS" id="editImpSusp" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCTRC</label>
                            <input type="number" name="alterICMS" id="editRCTRC" class="form-control">
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>RCFDC</label>
                            <input type="number" name="alterICMS" id="editRCFDC" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Simples Nac.</label>
                            <input type="number" name="alterICMS" id="editSimpNac" class="form-control">
                        </div>
                        <div class="col-md-2 col-sm-6 col-12 form-group mb-3">
                            <label>% Frete Peso</label>
                            <input type="number" name="alterICMS" id="editFretePeso" class="form-control">
                        </div>
                    </div>
                    <div class="row justify-content-end mt-3">
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6 col-6">
                            <a><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="submit">Salvar</button></a>
                        </div>
                        <div class="pt-1 mb-4 d-grid gap-2 col-md-3 col-sm-6 col-6">
                            <a><button class="btn btn-info btn-lg btn-block shadow-sm corpadrao larg-btn" role="button" type="submit">Cancelar</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
        @stop
        @stop
    </div>
    <script src="/js/showpassadd.js"></script>

</body>
</html>
