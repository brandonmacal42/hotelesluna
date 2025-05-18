<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recibo extends Model
{
	protected $table = 'recibo'; // Nombre de la tabla
	protected $primaryKey = 'idRecibo'; // Clave primaria

	public $timestamps = true; // Si tu tabla tiene created_at y updated_at

	protected $fillable = [
		'idHuesped',
		'idHotel',
		'NoHabitacion',
		'CheckIn',
		'Checkout',
		'NoMembresia',
		'esMiembro',
		'Mascota',
		'TipoHabitacion',
		'TipoPago',
	];
}
