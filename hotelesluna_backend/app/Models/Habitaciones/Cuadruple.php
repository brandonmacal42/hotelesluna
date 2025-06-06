<?php

namespace App\Models\Habitaciones;

use Illuminate\Database\Eloquent\Model;

class Cuadruple extends Model
{
	protected $table = 'cuadruple'; // Nombre de la tabla
	protected $primaryKey = 'NoHabitacion';
	public $timestamps = false;

	protected $fillable = [
		'NoHabitacion',
		'IdHotel',
		'IdEmpleado',
		'NoCama',
		'Disponible',
		'CostoNoche',
	];
}
