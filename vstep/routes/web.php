<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'VStepController@index')->name('home');
Route::get('/challenge/{id}', 'VStepController@challenge')->name('challenge.view');
Route::get('/challenge/{id}/register', 'VStepController@register')->name('challenge.register');
Route::post('/challenge/{id}/register', 'VStepController@postRegister')->name('challenge.confirm');
Route::get('/create/challenge', 'VStepController@create')->name('challenge.create');
Route::post('/create/challenge', 'VStepController@postCreate')->name('challenge.postCreate');

Route::get('/account/challenges', 'AccountController@challenges')->name('account.challenges');
Route::get('/account/common', 'AccountController@common')->name('account.common');



Route::get('/create', 'VStepController@create');
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
