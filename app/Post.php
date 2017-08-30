<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Laravel\Scout\Searchable;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\Post as baseModel;

class Post extends baseModel
{
    use Searchable;

    protected static function boot()
    {
        static::creating(function ($post) {
            $post->slug = translug($post->title);
        });
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function categoryId()
    {
        return $this->hasOne(Category::class, 'id', 'category_id');
    }

    /**
     * 获取分类下的数据
     *
     * @param Builder $builder
     * @param Category $category
     *
     * @return mixed
     */
    public function scopeForCategory($builder, $category)
    {
        if (!is_null($category->id)) {
            return $builder->where('category_id', $category->id);
        }
        return $builder;
    }

    /**
     * @return mixed
     */
    public function incr()
    {
        return $this->increment('views');
    }

    /**
     * @param $class
     * @return mixed|string
     */
    public function Status2Class($class)
    {
        $className = '';
        $arr = [
            'DRAFT' => 'danger',
            'PENDING' => 'info',
            'PUBLISHED' => '',
        ];
        return $class ? (isset($arr[$class]) ? $arr[$class] : '') : $className;
    }

    /**
     * posts URLs.
     * @return string
     */
    public function url()
    {
        return route('posts.show', $this->slug);
    }

    /**
     * posts image.
     */
    public function cover()
    {
        $image = $this->image ?? $this->categoryId->image;
        return asset(Voyager::image($image));
    }

    /**
     * get the prev posts.
     *
     * @return mixed
     */
    public function prev()
    {
        return static::where('id', '<', $this->id)
            ->where('category_id', '=', $this->category_id)
            ->published()
            ->orderBy('id')->first();
    }

    /**
     * get the next posts.
     *
     * @return mixed
     */
    public function next()
    {
        return static::where('id', '>', $this->id)
            ->where('category_id', '=', $this->category_id)
            ->published()
            ->orderBy('id')->first();
    }

}
