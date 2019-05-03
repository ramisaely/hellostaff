<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventFactureTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_facture', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_staff_id')->index('idx_event_staff_id')->unsigned();
            $table->foreign('event_staff_id')->references('id')->on('event_staff')->onDelete('cascade');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned();
            $table->foreign('staff_id')->references('id')->on('staff')->onDelete('cascade');
            $table->integer('event_staff_date_id')->index('idx_event_staff_date_id')->unsigned();
            $table->foreign('event_staff_date_id')->references('id')->on('event_staff_date')->onDelete('cascade');
            $table->integer('range_done');
            $table->integer('expense');
            $table->integer('remuneration');
            $table->string('additional_info');
            $table->integer('net_total');
            $table->integer('start_hour_done');
            $table->integer('end_hour_done');
            $table->date('startDate_event');
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
        Schema::dropIfExists('event_facture');
    }
}
