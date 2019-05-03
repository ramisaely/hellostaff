<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableEventStatementQuestionAnswerFile extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_statement_question_answer_file', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('question_answer_id')->index('idx_question_answer_id')->unsigned();
            $table->foreign('question_answer_id')->references('id')->on('event_statement_question_answer')->onDelete('cascade');
            $table->string('name');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_statement_question_answer_file');
    }
}
