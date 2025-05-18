<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PruebaController extends Controller
{
    public function test()
    {
        try {
            // Ejecutamos una consulta directa a la tabla "Hotel"
            $hoteles = DB::select('SELECT * FROM "Hotel"');
            return response()->json($hoteles);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}