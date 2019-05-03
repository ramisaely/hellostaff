<?php

namespace App\Models;
use App\User;
use App\Models\EventAgencyStatement;
use App\Models\EventStatementQuestionAnswerFile;

use Illuminate\Support\Facades\URL;

use Illuminate\Database\Eloquent\Model;

class EventAgencyStatementQuestionAnswer extends Model
{
    protected $table = 'event_statement_question_answer';
    protected $primarykey = "id";

    public function EventAgencyStatement() {
        return $this->hasOne(EventAgencyStatement::class, 'event_statement_id', 'id');
    }

    public function eventStatementQuestionAnswerFile() {
    	return $this->hasMany(EventStatementQuestionAnswerFile::class, 'question_answer_id', 'id');
    }
    
}