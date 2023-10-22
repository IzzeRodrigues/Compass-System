<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;

    protected $table = 'tb_usuario';

    protected $fillable = [
        'cd_usuario',
        'nm_nome_completo',
        'nm_cargo_vendedor',
        'cd_senha',
        'cd_proposta',
    ];
}
