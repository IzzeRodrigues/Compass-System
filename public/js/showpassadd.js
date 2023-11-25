//Eye Icon Password Input


function mostrarSenha(){
    var btnShowPassAdd = document.getElementById('eye-senha-func3')
    
    const senhaAdd = document.querySelector('.passcfg3');
    const btn = document.querySelector('.eye-open3');
    
    btn.onclick = () =>
    {
        if (senhaAdd.type == 'password')
        {
            senhaAdd.type = 'text';
            btnShowPassAdd.classList.replace('bi-eye', 'bi-eye-slash');
        }
        else
        {
            senhaAdd.type = 'password';
            btnShowPassAdd.classList.replace('bi-eye-slash', 'bi-eye');
        }
    }
}
