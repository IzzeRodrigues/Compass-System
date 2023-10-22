<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmailUsuario extends Model
{
    use HasFactory;

    protected $table = 'tb_email_usuario';

    protected $fillable = [
        'cd_email',
        'nm_email_usuario',
        'cd_usuario',
    ];

}
