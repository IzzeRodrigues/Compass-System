<?php

use App\Http\Controllers\CompassController;
use App\Http\Controllers\UsuarioController;
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

Route::get('/comercial', [CompassController::class, 'comercial'])->name('comercial');
Route::get('/admindex', [CompassController::class, 'admindex'])->name('admindex');
Route::get('/login', [CompassController::class, 'login'])->name('login');
Route::get('/addproposta', [CompassController::class, 'addproposta'])->name('addproposta');
Route::get('/addfuncionario', [CompassController::class, 'addfuncionario'])->name('addfuncionario');
Route::get('/addcliente', [CompassController::class, 'addcliente'])->name('addcliente');
Route::get('/forgotpass', [CompassController::class, 'forgotpass'])->name('forgotpass');
Route::get('/admconfig', [CompassController::class, 'admconfig'])->name('admconfig');
Route::get('/gerfuncionario', [CompassController::class, 'gerfuncionario'])->name('gerfuncionario');
Route::get('/gercliente', [CompassController::class, 'gercliente'])->name('gercliente');

Route::get('/verificarUsuario', [UsuarioController::class, 'verificarUsuario'])->name('verificarUsuario');
Route::get('/adicionarUsuario', [UsuarioController::class, 'adicionarUsuario'])->name('adicionarUsuario');
Route::get('/deslogar', [UsuarioController::class, 'deslogar'])->name('deslogar');
