<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Post;

class PostsController extends Controller
{
    public function index()
    {
        $posts = Post::with('category')->published()->simplePaginate(9);

        return view('home.posts.index', compact('posts'));
    }

    public function show($slug)
    {
        $post = Post::where('slug', $slug)->published()->first();


        return view('home.posts.show', compact('post'));
    }
}
