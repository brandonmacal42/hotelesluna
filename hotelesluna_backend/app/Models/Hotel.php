<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    protected $table = 'hotel';
    protected $primaryKey = 'idhotel'; // en minúscula

    public $timestamps = false;

    protected $fillable = [
        'nombreestablecimiento',
        'calle',
        'numerointerior',
        'numeroexterior',
        'colonia',
        'estado',
        'checkin',
        'checkout',
        'petfriendly',
        'servicio',
    ];
}
