<?php

namespace App\Http\Controllers;

use App\Models\Empleados\Recepcionista;
use App\Models\Empleados\Apoyo;
use App\Models\Empleados\Limpieza;
use App\Models\Empleados\Comida;
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
	public function limpiezas()
	{
		$limpiezas = Limpieza::all();
		return response()->json($limpiezas);
	}
	public function comidas()
	{
		$comidas = Comida::all();
		return response()->json($comidas);
	}
	// Endpoint combinado
	public function todos()
	{
		$recepcionistas = Recepcionista::all();
		$apoyos = Apoyo::all();
		$limpiezas = Limpieza::all();
		$comidas = Comida::all();

		return response()->json([
			'recepcionistas' => $recepcionistas,
			'apoyos' => $apoyos,
			'limpiezas' => $limpiezas,
			'comidas' => $comidas
		]);
	}
}
