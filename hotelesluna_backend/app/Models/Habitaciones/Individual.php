<?php

namespace App\Models\Habitaciones;

use Illuminate\Database\Eloquent\Model;

class Individual extends Model
{
	protected $table = 'individual'; // Nombre de la tabla
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
