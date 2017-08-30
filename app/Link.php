<?php

namespace App;

use App\Exceptions\LinkAlreadySubmitted;
use Auth;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;


class Link extends Model
{
    use Translatable;

    const APPROVED = 1;
    protected $fillable = ['category_id', 'name', 'url', 'description'];

    protected $translatable = ['category_id', 'description', 'name'];

    public function save(array $options = [])
    {
        // If no author has been assigned, assign the current user's id as the author of the post
        if (!$this->author_id && Auth::user()) {
            $this->author_id = Auth::user()->id;
        }

        parent::save();
    }

    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeApproved(Builder $query)
    {
        return $query->where('status', '=', static::APPROVED);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function categoryId()
    {
        return $this->hasOne(Voyager::modelClass('Category'), 'id', 'category_id');
    }

    public function authorId()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'author_id', 'id');
    }


    /**
     * A link may have many votes.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function votes()
    {
        return $this->hasMany(LinkVote::class, 'link_id');
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
     *
     * @param User $user
     *
     * @return static
     */
    public static function from(User $user)
    {
        $link = new static;

        $link->author_id = $user->id;

        if ($user->isTrusted()) {
            $link->approve();
        }

        return $link;
    }

    /**
     * 投稿
     *
     * @param $attributes
     *
     * @return bool
     * @throws \Illuminate\Database\Eloquent\MassAssignmentException
     * @throws LinkAlreadySubmitted
     */
    public function contribute($attributes)
    {
        if ($existing = $this->hasAlreadyBeenExists($attributes['url'])) {
            $existing->touch();

            throw new LinkAlreadySubmitted;
        }

        return $this->fill($attributes)->save();
    }

    /**
     * 审核用户提交的数据
     *
     * @return $this
     */
    public function approve()
    {
        $this->approved = true;
        return $this;
    }

    /**
     * 检查数据是否存在
     *
     * @param string $url
     *
     * @return mixed
     */
    protected function hasAlreadyBeenExists($url)
    {
        return static::where('url', $url)->first();
    }
}
