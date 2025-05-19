<?php

namespace App\Http\Controllers;

use App\Models\Habitaciones\Individual;
use App\Models\Habitaciones\Doble;
use App\Models\Habitaciones\Cuadruple;
use App\Models\Habitaciones\Pent_house;
use Illuminate\Http\Request;

class HabitacionController extends Controller
{
	// Lista todas las habitaciones individuales
	public function individuales()
	{
		$individuales = Individual::all();
		return response()->json($individuales);
	}

	// Lista todas las habitaciones dobles
	public function dobles()
	{
		$dobles = Doble::all();
		return response()->json($dobles);
	}

	// Lista todas las habitaciones cuádruples
	public function cuadruples()
	{
		$cuadruples = Cuadruple::all();
		return response()->json($cuadruples);
	}

	// Lista todas las habitaciones pent house
	public function penthouses()
	{
		$penthouses = Pent_house::all();
		return response()->json($penthouses);
	}

	// Endpoint combinado
	public function todas()
	{
		$individuales = Individual::all();
		$dobles = Doble::all();
		$cuadruples = Cuadruple::all();
		$penthouses = Pent_house::all();

		return response()->json([
			'individuales' => $individuales,
			'dobles' => $dobles,
			'cuadruples' => $cuadruples,
			'penthouses' => $penthouses,
		]);
	}
}
