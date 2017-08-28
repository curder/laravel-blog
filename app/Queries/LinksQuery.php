<?php

namespace App\Queries;

use App\Link;

class LinksQuery
{
    /**
     * @param $sortByPopular
     * @param $category
     * @return mixed
     */
    public function get($sortByPopular, $category)
    {
        $orderBy = $sortByPopular ? 'votes_count' : 'updated_at';

        return Link::with(['categoryId', 'authorId'])
            ->withCount('votes')
            ->forChannel($category)
            ->where('approved', 1)
            ->groupBy('links.id')
            ->orderBy($orderBy, 'desc')
            ->paginate(25);
    }
}


