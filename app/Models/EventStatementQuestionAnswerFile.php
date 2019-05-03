<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use App\Models\EventAgencyStatementQuestionAnswer;

class eventStatementQuestionAnswerFile extends Model
{
    protected $table = 'event_statement_question_answer_file';
    protected $primarykey = "id";
    public $timestamps = false;
}
