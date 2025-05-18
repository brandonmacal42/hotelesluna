<?php

namespace App\Http\Controllers;

use App\Models\Hotel; // Asegúrate de tener el modelo Hotel
use Illuminate\Http\Request;

class HotelController extends Controller
{
    public function index()
    {
        // Obtener todos los hoteles
        $hoteles = Hotel::all();

        // Retornar los datos como JSON
        return response()->json($hoteles);
    }
}