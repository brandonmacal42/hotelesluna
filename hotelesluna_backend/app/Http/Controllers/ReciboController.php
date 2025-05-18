<?php

namespace App\Http\Controllers;

use App\Models\Recibo; // Asegúrate de tener el modelo Hotel
use Illuminate\Http\Request;

class ReciboController extends Controller
{
	public function index()
	{
		// Obtener todos los hoteles
		$recibo = Recibo::all();

		// Retornar los datos como JSON
		return response()->json($recibo);
	}
}
