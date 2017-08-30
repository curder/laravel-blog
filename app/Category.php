<?php

namespace App;

use TCG\Voyager\Models\Category as baseModel;

/**
 * Class Category
 * @package App
 */
class Category extends baseModel
{
    /**
     * @return string
     */
    public function getRouteKeyName()
    {
        return 'slug';
    }

    /**
     * @return string
     */
    public function postUrl()
    {
        return route('posts.category',$this);
    }
}
