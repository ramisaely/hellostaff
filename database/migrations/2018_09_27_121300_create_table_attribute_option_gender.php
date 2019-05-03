<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableAttributeOptionGender extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attribute_option_gender', function (Blueprint $table) {
            $table->increments('attribute_option_gender_id');
            $table->integer('attribute_id')->index('idx_attribute_id')->unsigned()->nullable();
            $table->foreign('attribute_id')->references('attribute_id')->on('attributes')->onDelete('cascade');
            $table->integer('attribute_option_id')->index('idx_attribute_option_id')->unsigned()->nullable();
            $table->foreign('attribute_option_id')->references('attribute_option_id')->on('attribute_options')->onDelete('cascade');
            $table->integer('gender_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attribute_option_gender');
    }
}
