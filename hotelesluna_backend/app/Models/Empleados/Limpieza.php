<?php

namespace App\Models\Empleados;

use Illuminate\Database\Eloquent\Model;

class Limpieza extends Model
{
	protected $table = 'limpieza'; // Nombre de la tabla
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
