<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * Class CommunityLinkVote
 *
 * @package \App
 */
class LinkVote extends Model
{
    protected $table = 'links_votes';

    protected $fillable = ['user_id', 'link_id'];

    public function toggle()
    {
        if ($this->exists) {
            return $this->delete();
        }
        $this->save();
    }
}
