<?php

namespace App\Http\Controllers\Home;

use App\Category;
use App\Http\Controllers\Controller;
use App\Post;
use App\Queries\PostsQuery;

class PostsController extends Controller
{
    public function index(Category $category = null)
    {
        $posts = (new PostsQuery())->get(request()->exists('views'), $category);

        $categories = Category::orderBy('order')->get();

        return view('home.posts.index', compact('posts', 'categories', 'category'));
    }

    public function show($slug)
    {
        $post = Post::where('slug', $slug)->published()->first();

        // increment 1
        $post->incr();

        return view('home.posts.show', compact('post'));
    }
}
