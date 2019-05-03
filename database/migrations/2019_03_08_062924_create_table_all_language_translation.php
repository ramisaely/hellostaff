<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableAllLanguageTranslation extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('all_language_translation', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('all_language_id')->index('idx_all_language_id')->unsigned()->nullable();
            $table->foreign('all_language_id')->references('id')->on('all_language')->onDelete('cascade');
            $table->string('name');
            $table->string('decription')->nullable();
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
        Schema::dropIfExists('all_language_translation');
    }
}
