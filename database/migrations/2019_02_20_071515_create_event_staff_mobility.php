<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventStaffMobility extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_staff_mobility', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_staff_id')->index('idx_event_staff_id')->unsigned();
            $table->foreign('event_staff_id')->references('id')->on('event_staff')->onDelete('cascade');
            $table->integer('mobility_id')->index('idx_mobility_id')->unsigned();
            $table->foreign('mobility_id')->references('id')->on('mobility')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_staff_mobility');
    }
}
