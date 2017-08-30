<?php

namespace App\Queries;

use App\Post;

class PostsQuery
{
    public function get($sortByViews,$category)
    {
        $orderBy = $sortByViews ? 'views' : 'updated_at';

        return Post::with(['categoryId', 'authorId'])
            ->forCategory($category)
            ->published()
            ->groupBy('posts.id')
            ->orderBy($orderBy, 'desc')
            ->simplePaginate(9);
    }
}
