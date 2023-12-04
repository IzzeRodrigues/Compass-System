@extends('telabase')
@section('conteudo')

<div class="pt-2 ps-4">
    <?php
        @session_start();
        if (isset($_SESSION['ErroAssinaturaDigitalACL']))
        {
            $erro = $_SESSION['ErroAssinaturaDigitalACL'];
            unset($_SESSION['ErroAssinaturaDigitalACL']);
            echo("<script>alert('$erro')</script>");
        }

    ?>
    <div>
        <p class="fs-5 ">O cliente deseja assinar digitalmente?</p>
        <p>Primeiro, vamos revisar as informações.</p>
    </div>
    <div class="col-12 d-flex justify-content-center">
        <object class="col-10 alturaPDF localPDF" data="http://localhost/Compass/criadorPDF" type="application/pdf" ></object>
    </div>
    <div class="col-12 d-flex justify-content-center">
        <div class="col-10 d-flex flex-column align-self-center align-items-center justify-content-center">
            <div class="col-6 align-items-center">
                <p class="text-center">Todas as informações estão corretas? </p>
                <div class="row d-flex justify-content-evenly">
                    <button id="sim" onclick='exibeRepresentante()' class="col-5 btn-compass-color border border-0 rounded-4 px-4 =">Sim</button>
                    <button id="nao" onclick='voltaPreencher()' class="col-5 btn-compass-color border border-0 rounded-4 px-4 =">Não</button>
                </div>
            </div>
            <div id="exibicao" class="d-none col-12">
                <p class="pt-2" >Insira as informações necessárias para representar a ACL CARGO abaixo:</p>
                <div class="col-12">
                    <form method="GET" action="/enviarConteudo">
                        <div class="col-12 justify-content-center">
                            <div class="col-12 d-flex">
                                <div class="col-4 pe-2">
                                    <label label for="nome">Nome completo do Representante</label>
                                    <input name="nomeRepresentante" id="nomeRepresentante" type="text" class="form-control" placeholder="João da Silva">
                                </div>
                                <div class="col-4">
                                    <label for="documento">Documento do Representante</label>
                                    <input name="docRepresentante" id="docRepresentante" type="text" class="form-control" placeholder="000.000.000-00">
                                </div>
                                <div class="col-4 ps-2">
                                    <label for="email">Email do Representante</label>
                                    <input name="emailRepresentante" id="emailRepresentante" type="text" class="form-control" placeholder="João.Representante@email.com">
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-center mt-3">
                                <button name='envio' value='envio' id='envio' class="col-1 btn-compass-color border border-0 rounded-4 col-4">Enviar Token</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/javaAssinatura.js" type="text/javascript"></script>
@endsection