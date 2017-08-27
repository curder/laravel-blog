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

// Home Routers.

Route::get('/', function () {
    return view('home.welcome');
});

Route::group(['namespace' => 'Home'], function () {
    Auth::routes();
    Route::get('/home', 'HomeController@index')->name('home');
    Route::post('votes/{link}', 'VotesController@store')->name('votes.store'); // 点赞、取消点赞
    Route::get('links', 'LinksController@index')->name('links.index'); // 首页
    Route::post('links', 'LinksController@store')->name('links.store'); // 添加操作
    Route::get('links/{category}', 'LinksController@index')->name('links.category');// 频道筛选页

});

// Admin Routers.
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
