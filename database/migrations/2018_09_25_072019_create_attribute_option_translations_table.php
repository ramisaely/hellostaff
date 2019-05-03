<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAttributeOptionTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attribute_option_translations', function (Blueprint $table) {
            $table->increments('attribute_option_translation_id');
            $table->integer('attribute_option_id')->index('idx_attribute_option_id')->unsigned()->nullable();
            $table->foreign('attribute_option_id')->references('attribute_option_id')->on('attribute_options')->onDelete('cascade');            
            $table->string('value');
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
        Schema::dropIfExists('attribute_option_translations');
    }
}
