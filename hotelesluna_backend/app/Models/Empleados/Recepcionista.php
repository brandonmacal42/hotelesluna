<?php

namespace App\Models\Empleados;

use Illuminate\Database\Eloquent\Model;

class Recepcionista extends Model
{
	protected $table = 'recepcionista'; // Nombre de la tabla
	protected $primaryKey = 'idEmpleado';
	public $timestamps = false;

	protected $fillable = [
		'idEmpleado',
		'idHotel',
		'Nombre',
		'ApellidoP',
		'ApellidoM',
		'Calle',
		'NumeroInterior',
		'NumeroExterior',
		'Colonia',
		'Estado',
		'Horario',
		'FechaNacimiento',
		'FechaContratacion',
		'Genero',
		'RFC',
	];
}
