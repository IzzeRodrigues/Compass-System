<?php

use App\Http\Controllers\AssinarDigitalController;
use App\Http\Controllers\CompassController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\PropostaController;
use App\Http\Controllers\EmailController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('login');
})->name('inicio');

Route::get('/telabase', [CompassController::class, 'telabase'])->name('telabase');

Route::get('/comercial', [CompassController::class, 'comercial'])->name('comercial');
Route::get('/admindex', [CompassController::class, 'admindex'])->name('admindex');
Route::get('/login', [CompassController::class, 'login'])->name('login');
Route::get('/addproposta', [CompassController::class, 'addproposta'])->name('addproposta');
Route::get('/gerproposta', [CompassController::class, 'gerproposta'])->name('gerproposta');
Route::get('/verproposta', [CompassController::class, 'verproposta'])->name('verproposta');
Route::get('/addfuncionario', [CompassController::class, 'addfuncionario'])->name('addfuncionario');
Route::get('/gerfuncionario', [CompassController::class, 'gerfuncionario'])->name('gerfuncionario');
Route::get('/verfuncionario', [CompassController::class, 'verfuncionario'])->name('verfuncionario');
Route::get('/addcliente', [CompassController::class, 'addcliente'])->name('addcliente');
Route::get('/gercliente', [CompassController::class, 'gercliente'])->name('gercliente');
Route::get('/vercliente', [CompassController::class, 'vercliente'])->name('vercliente');
Route::get('/forgotpass', [CompassController::class, 'forgotpass'])->name('forgotpass');
Route::get('/admconfig', [CompassController::class, 'admconfig'])->name('admconfig');
Route::get('/impostos', [CompassController::class, 'impostos'])->name('impostos');

Route::get('/assdigital', [CompassController::class, 'assdigital'])->name('assdigital');
Route::get('/enviarConteudo', [AssinarDigitalController::class, 'enviarConteudo'])->name('enviarConteudo');
Route::get('/emailCliente', [EmailController::class, 'EnviarEmail'])->name('EnviarEmail');
Route::get('/assinatura', [CompassController::class, 'assinatura'])->name('assinatura');


Route::get('/acoesProposta', [PropostaController::class, 'escolherAcao'])->name('acoesProposta');
Route::get('/salvarProposta', [PropostaController::class, 'salvarProposta'])->name('salvarProposta');
Route::get('/gerarProposta', [PropostaController::class, 'gerarPDF'])->name('gerarPDF');
Route::get('/testePDF', [CompassController::class, 'testePDF'])->name('testePDF');

Route::get('/verificarUsuario', [UsuarioController::class, 'verificarUsuario'])->name('verificarUsuario');
Route::get('/adicionarUsuario', [UsuarioController::class, 'adicionarUsuario'])->name('adicionarUsuario');
Route::get('/deslogar', [UsuarioController::class, 'deslogar'])->name('deslogar');

