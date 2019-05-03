<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableEventStatementQuestionAnswer extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_statement_question_answer', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_statement_id')->index('idx_event_statement_id')->unsigned();
            $table->foreign('event_statement_id')->references('id')->on('event_statement')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_statement_question_answer');
    }
}
