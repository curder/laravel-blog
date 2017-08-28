<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Post;

class PostsController extends Controller
{
    public function index()
    {
        $post = Post::with('category')->paginate();

        return view('home.posts.index', compact('post'));
    }

    public function show($slug)
    {
        $post = Post::where('slug', $slug)->first();
        return view('home.posts.show', compact('post'));
    }
}
