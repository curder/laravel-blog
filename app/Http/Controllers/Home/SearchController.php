<?php

namespace App\Http\Controllers\Home;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SearchController extends Controller
{
    /**
     * Search
     */
    public function index()
    {
         $keyword = request()->get('keyword');




         return view('home.search.index',compact('keyword'));
    }
}
