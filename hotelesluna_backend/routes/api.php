<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HuespedController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\HabitacionController;

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
Route::get('/limpiezas', [EmpleadoController::class, 'limpiezas']);
Route::get('/comidas', [EmpleadoController::class, 'comidas']);
Route::get('/habitaciones/individuales', [HabitacionController::class, 'individuales']);
Route::get('/habitaciones/dobles', [HabitacionController::class, 'dobles']);
Route::get('/habitaciones/cuadruples', [HabitacionController::class, 'cuadruples']);
Route::get('/habitaciones/penthouses', [HabitacionController::class, 'penthouses']);
Route::get('/habitaciones/todas', [HabitacionController::class, 'todas']);