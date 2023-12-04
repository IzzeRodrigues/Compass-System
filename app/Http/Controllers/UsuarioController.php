<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Usuario;
use App\Models\EmailUsuario;
use Illuminate\Http\Response;

class UsuarioController extends Controller
{
    public function verificarUsuario(Request $request)
    {
        @session_start();
        // if (isset($_COOKIE['statusLogin']))
        // {
        //     $resultado = DB::select("select * from tb_usuario where nm_nome_completo = '" . $_COOKIE['nomeUsuario'].  "'");
        //     $resultado = DB::select("select * from tb_privilegio where cd_usuario = " . $resultado[0]->cd_usuario);

        //     if($resultado[0]->nm_privilegio == "Adm")
        //     {
        //         setcookie(
        //             "privilegioUsuario",
        //             "administrador",
        //             time() + (60 * 60),
        //             "/"
        //         );
        //         return redirect()->route('admindex');
        //     }

        //     if($resultado[0]->nm_privilegio == "Usuario")
        //     {
        //         setcookie(
        //             "privilegioUsuario",
        //             "comercial",
        //             time() + (60 * 60),
        //             "/"
        //         );
        //         return redirect()->route('comercial');
        //     }
        // }
        // else
        // {
        //     $usuario = $request->usuario;
        //     $senha = $request->senha;

        //     // $resultado = Usuario::query()->where('nm_nome_completo', $usuario)->get();

        //     // $resultado = DB::select("select * from tb_usuario where nm");

        //     $resultado = DB::select("select * from tb_email_usuario where nm_email_usuario = '$usuario'");


        //     if(!isset($resultado[0]))
        //     {
        //         setcookie(
        //             "erro",
        //             "erroEmailSenha",
        //             time() + 30,
        //             "/",
        //         );
        //         return redirect()->route('inicio');
        //     }

        //     $resultado = DB::select("select * from tb_usuario where cd_usuario = " . $resultado[0]->cd_usuario);

        //     if($senha != $resultado[0]->cd_senha)
        //     {
        //         setcookie(
        //             "erro",
        //             "erroEmailSenha",
        //             time() + 30,
        //             "/",
        //         );
        //         return redirect()->route('inicio');
        //     }

        //     setcookie(
        //         "nomeUsuario",
        //         $resultado[0]->nm_nome_completo,
        //         time() + (60 * 60),
        //         "/",
        //     );
        //     setcookie(
        //         "cargoUsuario",
        //         $resultado[0]->nm_cargo_usuario,
        //         time() + (60 * 60),
        //         "/",
        //     );
        //     setcookie(
        //         "statusLogin",
        //         true,
        //         time() + (60 * 60),
        //         "/",
        //     );

        //     $resultado = DB::select("select * from tb_email_usuario where cd_usuario = " . $resultado[0]->cd_usuario);

        //     setcookie(
        //         "emailUsuario",
        //         $resultado[0]->nm_email_usuario,
        //         time() + (60 * 60),
        //         "/",
        //     );

        //     $resultado = DB::select("select * from tb_privilegio where cd_usuario = " . $resultado[0]->cd_usuario);

        //     // $resultado = Privilegio::query()->where('cd_usuario', $resultado[0]->cd_usuario)->get();
            

        //     if($resultado[0]->nm_privilegio == "Adm")
        //     {
        //         setcookie(
        //             "privilegioUsuario",
        //             "administrador",
        //             time() + (60 * 60),
        //             "/"
        //         );
        //         return redirect()->route('admindex');
        //     }

        //     if($resultado[0]->nm_privilegio == "Usuario")
        //     {
        //         setcookie(
        //             "privilegioUsuario",
        //             "comercial",
        //             time() + (60 * 60),
        //             "/"
        //         );
        //         return redirect()->route('comercial');
        //     }

        //     return redirect()->route('inicio', ['situacao' => 'Erro encontrado']);
        // }

        // Novo login

        
        if(isset($_SESSION['Usuario']))
        {
            if($_SESSION['Usuario']['logado'])
            {
                if($_SESSION['Usuario']['privilegio'] == "Adm")
                {
                    echo("<script>window.location.href = 'http://localhost:8000/admindex'</script>");
                }
                else
                {
                    if($_SESSION['Usuario']['privilegio'] == "Usuario")
                    {
                        echo("<script>window.location.href = 'http://localhost:8000/comercial'</script>");
                    }
                }
            }
        }
        else
        {
            $usuario = $request->usuario;
            $senha = $request->senha;
            
            $usuario = DB::table('tb_email_usuario')
            ->join('tb_usuario', 'tb_email_usuario.cd_usuario', '=', 'tb_usuario.cd_usuario')
            ->join('tb_privilegio', 'tb_email_usuario.cd_usuario', '=', 'tb_privilegio.cd_usuario')
            ->where('nm_email_usuario', '=', $usuario)
            ->where('cd_senha', '=', $senha)
            ->get();
            
            // dd($usuario);
            if (isset($usuario[0]))
            {
                $_SESSION['Usuario'] = ['logado' => true, 'nome' => $usuario[0]->nm_nome_completo, 'email' => $usuario[0]->nm_email_usuario, 'cargo' => $usuario[0]->nm_cargo_usuario, 'cpf' => $usuario[0]->cd_cpf_usuario, 'privilegio' => $usuario[0]->nm_privilegio];
                if ($usuario[0]->nm_privilegio == "Adm")
                {
                    return redirect()->route('admindex');
                }
                else
                {
                    if ($usuario[0]->nm_privilegio == "Usuario")
                    {
                        return redirect()->route('comercial');
                    }
                    else
                    {
                        $_SESSION['Erro'] = "Email e/ou senha incorretos";
                        return redirect()->route('login');
                    }
                }
            }
            else
            {
                $_SESSION['Erro'] = "Email e/ou senha incorretos";
                return redirect()->route('login');
            }
        }

        
    }

    public function deslogar()
    {
        @session_start();
        unset($_SESSION['Usuario']);
        return redirect()->route('inicio');
    }

    public function adicionarUsuario(Request $request)
    {
        $nomeFuncionario = $request->nomeFuncionario;
        $cargo = $request->cargo;
        $email = $request->email;
        $privilegio = $request->privilegio;
        $senha = $request->senha;
        $cpf = $request->CPFFuncionario;

        $idUsuario = DB::table('tb_usuario')->insertGetId(['nm_nome_completo' => $nomeFuncionario, 'nm_cargo_usuario' => $cargo, 'cd_senha' => $senha, 'cd_cpf_usuario' => $cpf]);

        $idPrivilegio = DB::table('tb_privilegio')->insertGetId(['nm_privilegio' => $privilegio, 'cd_usuario' => $idUsuario]);

        $idEmailUsuario = DB::table('tb_email_usuario')->insertGetId(['nm_email_usuario' => $email, 'cd_usuario' => $idUsuario]);

        $resultado = DB::select("select * from tb_usuario where nm_nome_completo = '$nomeFuncionario'");

        // var_dump($resultado);

        // if(isset($resultado[0]))
        // {
        //     return redirect()->route('admindex');
        // }

        // DB::insert("insert into tb_usuario (nm_nome_completo, nm_cargo_usuario, cd_senha) values (?, ?, ?)", [$nomeFuncionario, $cargo, $senha]);

        // $resultado = DB::select ("select * from tb_usuario where nm_nome_completo = '$nomeFuncionario'");


        // DB::insert("insert into tb_email_usuario (nm_email_usuario, cd_usuario) values (?, ?)", [$email, $resultado[0]->cd_usuario]);

        // DB::insert("insert into tb_privilegio (nm_privilegio, cd_usuario) values (?, ?)", [$privilegio, $resultado[0]->cd_usuario]);

        return redirect()->route('gerfuncionario');

    }

    function pegarUsuario(Request $request)
    {
        $idFuncionario = $request->ID;
        $funcionario = DB::table('tb_usuario')
        ->join('tb_privilegio', 'tb_usuario.cd_usuario', 'tb_privilegio.cd_usuario')
        ->join('tb_email_usuario', 'tb_usuario.cd_usuario', 'tb_email_usuario.cd_usuario')
        ->where('tb_usuario.cd_usuario', $idFuncionario)
        ->get();

        return ['Funcionario' => $funcionario];
    }

    function atualizarUsuario(Request $request)
    {
        $funcionario = $request->all();
        $alterandoUsuario = DB::table('tb_usuario')->where('tb_usuario.cd_usuario', $funcionario['idFuncionario'])->update(['nm_nome_completo' => $funcionario['nomeFuncionario'], 'nm_cargo_usuario' => $funcionario['cargo'], 'cd_senha' => $funcionario['senha'], 'cd_cpf_usuario' => $funcionario['CPFFuncionario']]);

        $alterandoPrivilegio = DB::table('tb_privilegio')->where('tb_privilegio.cd_usuario', $funcionario['idFuncionario'])->update(['nm_privilegio' => $funcionario['privilegio']]);

        $alterandoEmail = DB::table('tb_email_usuario')->where('tb_email_usuario.cd_usuario', $funcionario['idFuncionario'])->update(['nm_email_usuario' => $funcionario['email']]);

        return redirect()->route('gerfuncionario');
    }

    function deletarUsuario(Request $request)
    {
        $idFuncionario = $request->ID;
        $deletandoUsuario = DB::table('tb_usuario')->where('tb_usuario.cd_usuario', $idFuncionario)->delete();
        
        return redirect()->route('gerfuncionario');
    }
    
}
