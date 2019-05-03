<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableAllLanguageChoiceTranslation extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('all_language_choice_translation', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('all_language_choice_id')->index('idx_all_language_choice_id')->unsigned()->nullable();
            $table->foreign('all_language_choice_id')->references('id')->on('all_language_choice')->onDelete('cascade');
            $table->string('name');
            $table->integer('language_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('all_language_choice_translation');
    }
}
