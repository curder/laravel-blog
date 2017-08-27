<?php

namespace App\Http\Controllers\Home;

use App\Link;
use App\LinkVote;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class VotesController extends Controller
{
    public function store(Link $link)
    {
        auth()->user()->votes()->toggle($link);

//        auth()->user()->toggleVoteFor($link);


        return back();
    }
}
