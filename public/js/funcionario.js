var pegouFuncionario = false;

if (!pegouFuncionario)
{
    var parametros = new URLSearchParams(window.location.search);
    var parametros = parametros.get('ID');
    fetch(`http://localhost:8000/pegarUsuario?ID=${parametros}`)
    .then((response) => response.json())
    .then((json) => preencherFuncionario(json))

    function preencherFuncionario(funcionario)
    {
        document.getElementById('nomeFuncionario').value = funcionario['Funcionario'][0].nm_nome_completo
        document.getElementById('CPFFuncionario').value = funcionario['Funcionario'][0].cd_cpf_usuario
        document.getElementById('cargo').value = funcionario['Funcionario'][0].nm_cargo_usuario
        document.getElementById('email').value = funcionario['Funcionario'][0].nm_email_usuario
        document.getElementById('privilegio').value = funcionario['Funcionario'][0].nm_privilegio
        document.getElementById('senha-func-add').value = funcionario['Funcionario'][0].cd_senha
        document.getElementById('idFuncionario').value = funcionario['Funcionario'][0].cd_usuario
    }
    pegouFuncionario = true;
}
