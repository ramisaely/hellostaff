<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableEventStatement extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_statement', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_id')->index('idx_event_id')->unsigned();
            $table->foreign('event_id')->references('id')->on('event')->onDelete('cascade');
            $table->integer('user_id')->index('idx_user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
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
        Schema::dropIfExists('event_statement');
    }
}
