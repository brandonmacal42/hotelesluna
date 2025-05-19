<?php

namespace App\Models\Habitaciones;

use Illuminate\Database\Eloquent\Model;

class Pent_house extends Model
{
	protected $table = 'pent_house'; // Nombre de la tabla
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
