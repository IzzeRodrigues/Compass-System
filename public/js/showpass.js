//Eye Icon Password Input

var btnShowPass = document.getElementById('open-eye')

const senha = document.querySelector('.passcfg');
const btn = document.querySelector('.eye-open');

btn.onclick = () =>
{
    if (senha.type == 'password')
    {
        senha.type = 'text';
        btnShowPass.classList.replace('bi-eye', 'bi-eye-slash');
    }
    else
    {
        senha.type = 'password';
        btnShowPass.classList.replace('bi-eye-slash', 'bi-eye');
    }
}
