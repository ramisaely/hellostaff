<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableEventCandidate extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_candidate', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_staff_id')->index('idx_event_staff_id')->unsigned();
            $table->foreign('event_staff_id')->references('id')->on('event_staff')->onDelete('cascade');  
            $table->integer('staff_id')->index('idx_staff_id')->unsigned()->nullable();
            $table->foreign('staff_id')->references('id')->on('staff')->onDelete('cascade');
            $table->string('status');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_candidate');
    }
}
