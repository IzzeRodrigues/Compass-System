//Eye Icon Password Input


function mostrarSenha(){
    var btnShowPassFunc = document.getElementById('eye-senha-func2')
    
    const senhafunc = document.querySelector('.passcfg2');
    const btn = document.querySelector('.eye-open2');
    
    btn.onclick = () =>
    {
        if (senhafunc.type == 'password')
        {
            senhafunc.type = 'text';
            btnShowPassFunc.classList.replace('bi-eye', 'bi-eye-slash');
        }
        else
        {
            senhafunc.type = 'password';
            btnShowPassFunc.classList.replace('bi-eye-slash', 'bi-eye');
        }
    }
}
