<?php

namespace plugin\acms\app\model;

use support\Model;
use plugin\user\app\model\User;

class UserLike extends Model
{
    protected $table = 'acms_user_likes';
    
    protected $fillable = ['user_id', 'article_id'];
    
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function article()
    {
        return $this->belongsTo(Article::class);
    }
}