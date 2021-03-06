<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'trusted'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    /**
     * @return bool
     */
    public function isTrusted()
    {
        return (bool)$this->trusted;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function votes()
    {
        return $this->belongsToMany(Link::class, 'links_votes')
            ->withTimestamps();
    }

    /**
     * @param Link $link
     *
     * @return mixed
     */
    public function votedFor(Link $link)
    {
        return $link->votes->contains('user_id', $this->id);
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function links()
    {
        return $this->hasMany(Link::class, 'author_id', 'id');
    }
}
