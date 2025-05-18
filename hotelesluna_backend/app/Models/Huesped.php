<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Huesped extends Model
{
	protected $table = 'huesped'; // nombre de la tabla en minúsculas
	protected $primaryKey = 'idhuesped'; // clave primaria

	public $timestamps = false; // si no tienes created_at y updated_at

	protected $fillable = [
		'idhuesped',
		'nombre',
		'apellidop',
		'apellidom',
		'genero',
		'nacionalidad',
		'fechanacimiento',
	];
}
