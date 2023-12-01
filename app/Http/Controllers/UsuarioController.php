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
        session_start();
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

        // if(isset($_SESSION['Usuario']))
        // {
            // if($_SESSION['Usuario']['logado'])
            // {
            //     if($_SESSION['Usuario']['privilegio'] == "Adm")
            //     {
            //         return redirect()->route('admindex');
            //     }
            //     else
            //     {
            //         if($_SESSION['Usuario']['privilegio'] == "Usuario")
            //         {
            //             return redirect()->route('comercial');
            //         }
            //     }
            // }
        // }
        // else
        // {
            $usuario = $request->usuario;
            $senha = $request->senha;
            // dd($usuario);
            // dd($senha);

            $usuario = DB::table('tb_email_usuario')->join('tb_usuario', 'tb_email_usuario.cd_usuario', '=', 'tb_email_usuario.cd_usuario')
            ->join('tb_privilegio', 'tb_email_usuario.cd_usuario', '=', 'tb_privilegio.cd_usuario')
            // ->where('tb_email_usuario.nm_email_usuario', '=', $usuario)
            ->get();
            dd($usuario);
            if ($usuario)
            {
                $_SESSION['Usuario'] = ['logado' => true, 'nome' => $usuario[0]->nm_nome_completo, 'email' => $usuario[0]->nm_email_usuario, 'cargo' => $usuario[0]->nm_cargo_usuario, 'privilegio' => $usuario[0]->nm_privilegio];
                if ($usuario[0]->nm_privilegio == "Adm")
                {
                    // return redirect()->route('admindex');
                    // dd($_SESSION['Usuario']);
                }
                else
                {
                    if ($usuario[0]->nm_privilegio == "Usuario")
                    {
                        // return redirect()->route('comercial');
                        // dd($_SESSION['Usuario']);
                    }
                    else
                    {
                        // $_SESSION['Erro'] = "Email e/ou senha incorretos";
                        // return redirect()->route('login');
                    }
                }
            }
            else
            {
                $_SESSION['Erro'] = "Email e/ou senha incorretos";
                return redirect()->route('login');
            }
        // }

        
    }

    public function deslogar()
    {
        setcookie(
            "nomeUsuario",
            '',
            0,
        );
        setcookie(
            "cargoUsuario",
            '',
            0,
        );
        setcookie(
            "statusLogin",
            false,
            0,
        );
        setcookie(
            "privilegioUsuario",
            '',
            0,
        );
        
        return redirect()->route('inicio');
    }

    public function adicionarUsuario(Request $request)
    {
        if(isset($_COOKIE['statusLogin']))
        {
            if($_COOKIE['statusLogin'])
            {
                $nomeFuncionario = $request->nomeFuncionario;
                $cargo = $request->cargo;
                $email = $request->email."@aclcargo.com.br";
                $privilegio = $request->privilegio;
                $senha = $request->senha;

                $resultado = DB::select("select * from tb_usuario where nm_nome_completo = '$nomeFuncionario'");

                var_dump($resultado);

                // if(isset($resultado[0]))
                // {
                //     return redirect()->route('admindex');
                // }

                DB::insert("insert into tb_usuario (nm_nome_completo, nm_cargo_usuario, cd_senha) values (?, ?, ?)", [$nomeFuncionario, $cargo, $senha]);

                $resultado = DB::select ("select * from tb_usuario where nm_nome_completo = '$nomeFuncionario'");


                DB::insert("insert into tb_email_usuario (nm_email_usuario, cd_usuario) values (?, ?)", [$email, $resultado[0]->cd_usuario]);

                DB::insert("insert into tb_privilegio (nm_privilegio, cd_usuario) values (?, ?)", [$privilegio, $resultado[0]->cd_usuario]);

                return redirect()->route('addfuncionario');
            }
        }
        else
        {
            return redirect()->route('inicio');
        }

    }
    
}
