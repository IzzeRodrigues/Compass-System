//Eye Icon Password Input

// function mostrarSenha() {
//     var inputPass = document.getElementsByName('senha');
//     var btnShowPass = document.getElementById('open-eye');

//     if(inputPass.type === 'password'){
//         inputPass.setAttribute('type','text');
//         btnShowPass.classList.replace('bi-eye','bi-eye-slash');
//         console.log('Mudou!')
//     }
// }

const senha = document.querySelector('.passcfg');
const btn = document.querySelector('.eye-open');

btn.onclick = () =>
{
    if (senha.type == 'password')
    {
        senha.type = 'text';
    }
    else
    {
        senha.type = 'password';
    }
}
