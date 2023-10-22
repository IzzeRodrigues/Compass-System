<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Privilegio extends Model
{
    use HasFactory;

    protected $table = 'tb_privilegio';

    protected $fillable = [
        'cd_privilegio',
        'nm_privilegio',
        'cd_usuario',
    ];

}
