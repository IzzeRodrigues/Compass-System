let resultado = ""
const valor = `; ${document.cookie}`;
const partes = valor.split('; erro=');
if (partes.length === 2)
{
    resultado = partes.pop().split(';').shift();
};

if (resultado == "erroEmailSenha")
{
    resultado = "Email e/ou senha inválidos."
    alert(resultado);
    document.cookie = "erro=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}
else
{
    if (resultado == "privilegioInvalido")
    {
        resultado = "Ocorreu um erro, tente novamente."
        document.cookie = "erro=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    }
}