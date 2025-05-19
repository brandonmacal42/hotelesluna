<?php

namespace App\Models\Empleados;

use Illuminate\Database\Eloquent\Model;

class Comida extends Model
{
	protected $table = 'comida'; // Nombre de la tabla
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
