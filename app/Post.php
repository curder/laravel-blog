<?php
namespace App;

use TCG\Voyager\Models\Post as baseModel;

class Post extends baseModel
{
    protected static function boot()
    {
        static::creating(function ($post) {
            $post->slug = translug($post->title);
        });
    }

    public function categoryId()
    {
        return $this->belongsTo(Category::class);
    }
}
