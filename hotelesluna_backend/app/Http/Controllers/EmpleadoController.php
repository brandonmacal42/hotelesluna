<?php

namespace App\Http\Controllers;

use App\Models\Empleados\Recepcionista;
use App\Models\Empleados\Apoyo;
use Illuminate\Http\Request;

class EmpleadoController extends Controller
{
	// Lista todos los recepcionistas
	public function recepcionistas()
	{
		$recepcionistas = Recepcionista::all();
		return response()->json($recepcionistas);
	}

	// Lista todos los apoyos
	public function apoyos()
	{
		$apoyos = Apoyo::all();
		return response()->json($apoyos);
	}

	// Endpoint combinado
	public function todos()
	{
		$recepcionistas = Recepcionista::all();
		$apoyos = Apoyo::all();
		return response()->json([
			'recepcionistas' => $recepcionistas,
			'apoyos' => $apoyos,
		]);
	}
}
