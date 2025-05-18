<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HuespedController;
use App\Http\Controllers\EmpleadoController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Aquí es donde puedes registrar las rutas de tu API. Estas rutas son
| automáticamente cargadas por el RouteServiceProvider dentro de un grupo
| que está asignado al middleware "api".
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
	return $request->user();
});

// Aquí puedes agregar tus rutas personalizadas para el frontend
// Por ejemplo, si tienes un controlador HotelController:
Route::get('/hoteles', [App\Http\Controllers\HotelController::class, 'index']);
Route::get('/huespedes', [HuespedController::class, 'index']);
// Route::get('/empleados', [EmpleadoController::class, 'todos']);
Route::get('/recepcionistas', [EmpleadoController::class, 'recepcionistas']);
Route::get('/apoyos', [EmpleadoController::class, 'apoyos']);
