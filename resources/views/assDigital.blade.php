@extends('telabase')
@section('conteudo')
<div class="pt-4 ps-4">
    <div>
        <p class="fs-5 ">O cliente deseja assinar digitalmente?</p>
        <p>Primeiro, vamos revisar as informações.</p>
    </div>
    <div>
        <object class="col-8" data="http://localhost/Compass/criadorPDF" type="application/pdf" ></object>
    </div>
    <div>
            <p>Todas as informações estão corretas? </p>
            <button id="sim" onclick='exibeRepresentante()' class="btn-compass-color border border-0 rounded-4 px-4 =">Sim</button>
            <button id="nao" onclick='voltaPreencher()' class="btn-compass-color border border-0 rounded-4 px-4 =">Não</button>
       
        <div id="exibicao" class="d-none">
        <p class="pt-5" >Insira as informações necessárias para representar a ACL CARGO abaixo:</p>
        <div>
            <form action="GET">
                <div class="d-flex me-5">
                        <div>
                            <label label for="nome">Nome completo do Representante</label>
                            <input type="text" class="rounded-4 py-1" placeholder="João da Silva">
                        </div>
                        <div>
                            <label for="documento">Documento do Representante</label>
                            <input type="text" class="rounded-4 py-1" placeholder="000.000.000-00">
                        </div>
                        <div>
                            <label for="email">Email do Representante</label>
                            <input type="text" class="rounded-4 py-1" placeholder="João.Representante@email.com">
                        </div>
                        <button class="btn-compass-color border border-0 rounded-4  ">Enviar Token</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="js/javaAssinatura.js" type="text/javascript"></script>
@endsection