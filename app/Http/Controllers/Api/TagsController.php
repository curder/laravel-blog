<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Cviebrock\EloquentTaggable\Models\Tag;
use Illuminate\Http\Request;

class TagsController extends Controller
{
    public function index(Request $request)
    {
        return Tag::select(['tag_id', 'name'])
            ->where('name', 'like', '%' . $request->query('q') . '%')
            ->get();
    }
}
