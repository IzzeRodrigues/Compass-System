function verificarPrivilegio(pagina)
{
    const valor = `; ${document.cookie}`;
    const partes = valor.split('; privilegioUsuario=');
    if (partes.length === 2)
    {
        resultado = partes.pop().split(';').shift();
    };

    console.log(resultado);


    if (resultado != pagina)
    {
        if (resultado != 'comercial' && resultado != 'administrador')
        {
            document.cookie = "erro=privilegioInvalido; path=/;";
            window.location.replace("http://localhost:8000/");
        }
        if (pagina == 'comercial')
        {
            setTimeout(window.location.replace("http://www.localhost:8000/admindex"), 5000);
        }
        else
        {
            if (pagina == 'administrador')
            {
                setTimeout(window.location.replace("http://www.localhost:8000/comercial"), 5000);
            }
        }
    }
    else
    {

    }
}