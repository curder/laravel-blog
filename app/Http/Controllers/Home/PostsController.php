<?php

namespace App\Http\Controllers\Home;

use App\Category;
use App\Http\Controllers\Controller;
use App\Post;

class PostsController extends Controller
{
    public function index()
    {
        return view('home.posts.index');
    }

    public function show($slug)
    {
        $post = Post::where('slug', $slug)->first();
        return view('home.posts.show', compact('post'));
    }
}
