<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

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
}
