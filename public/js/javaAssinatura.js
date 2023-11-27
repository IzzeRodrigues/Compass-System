function exibeRepresentante(){
    var pegando = document.getElementById('exibicao')
    pegando.classList.remove('d-none');
    pegando.classList.add('d-block');
}
function voltaPreencher(){
    location.href = 'http://localhost:8000/addproposta';
}