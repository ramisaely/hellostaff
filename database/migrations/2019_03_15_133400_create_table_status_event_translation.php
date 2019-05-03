<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableStatusEventTranslation extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('status_event_translation', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('status_id')->index('idx_status_id')->unsigned();
            $table->foreign('status_id')->references('id')->on('status_event')->onDelete('cascade');
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
        Schema::dropIfExists('status_event_translation');
    }
}
