function verificarLoginInicio()
{
    let resultado
    const valor = `; ${document.cookie}`;
    const partes = valor.split('; statusLogin=');
    if (partes.length === 2)
    {
        resultado = partes.pop().split(';').shift();
    };

    if (resultado !== undefined)
    {
        window.location.replace("http://localhost:8000/verificarUsuario")
    }
}

function verificarLoginPaginas()
{
    let resultado
    const valor = `; ${document.cookie}`;
    const partes = valor.split('; statusLogin=');
    if (partes.length === 2)
    {
        resultado = partes.pop().split(';').shift();
    };

    console.log(resultado)

    if (resultado === undefined)
    {
        window.location.replace("http://localhost:8000/deslogar")
    }
    else
    {

    }
}
