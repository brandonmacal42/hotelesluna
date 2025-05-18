<?php

namespace App\Http\Controllers;

use App\Models\Huesped;
use Illuminate\Http\Request;

class HuespedController extends Controller
{
	public function index()
	{
		// Obtener todos los huéspedes
		$huespedes = Huesped::all();

		// Retornar los datos como JSON
		return response()->json($huespedes);
	}
}
