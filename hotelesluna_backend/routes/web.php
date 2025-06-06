<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\PruebaController; // Asegúrate de importar el controlador

Route::get('/', function () {
    return Inertia::render('welcome');
})->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', function () {
        return Inertia::render('dashboard');
    })->name('dashboard');
});

// Ruta de prueba para conexión a PostgreSQL
Route::get('/test-db', [PruebaController::class, 'test']);

require __DIR__ . '/settings.php';
require __DIR__ . '/auth.php';