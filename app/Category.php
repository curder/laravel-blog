<?php

namespace App;

use TCG\Voyager\Models\Category as baseModel;

class Category extends baseModel
{
    public function getRouteKeyName()
    {
        return 'slug';
    }
}
