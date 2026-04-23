<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\InventoryController;

Route::get('/', fn() => redirect()->route('login'));

// Guest routes
Route::middleware('guest')->group(function () {
    Route::get('/login',           [LoginController::class, 'create'])->name('login');
    Route::post('/login',          [LoginController::class, 'store']);
    Route::get('/register',        [RegisterController::class, 'create'])->name('register');
    Route::post('/register',       [RegisterController::class, 'store']);
    Route::get('/forgot-password', [ForgotPasswordController::class, 'create'])->name('password.request');
    Route::post('/forgot-password',[ForgotPasswordController::class, 'store'])->name('password.reset');
});

// Auth routes
Route::post('/logout', [LoginController::class, 'destroy'])->name('logout');

Route::middleware('auth')->group(function () {
    Route::get('/inventory', [InventoryController::class, 'index'])->name('inventory');
    Route::post('/inventory/profile-picture', [InventoryController::class, 'uploadProfilePicture'])->name('inventory.profile_picture');
    Route::post('/inventory/import', [InventoryController::class, 'importItems'])->name('inventory.import');
    Route::post('/inventory/db-import', [InventoryController::class, 'importDatabase'])->name('inventory.db_import');
});
