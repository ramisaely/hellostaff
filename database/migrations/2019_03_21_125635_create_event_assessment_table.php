<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventAssessmentTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_assessment', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned();
            $table->foreign('staff_id')->references('id')->on('staff')->onDelete('cascade');
            $table->integer('event_id')->index('idx_event_id')->unsigned();
            $table->foreign('event_id')->references('id')->on('event')->onDelete('cascade');
            $table->integer('agency_id')->index('idx_agency_id')->unsigned();
            $table->foreign('agency_id')->references('id')->on('agency')->onDelete('cascade');
            $table->integer('event_staff_id')->index('idx_event_staff_id')->unsigned();
            $table->foreign('event_staff_id')->references('id')->on('event_staff')->onDelete('cascade');
            $table->integer('rating');
            $table->string('description');
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
        Schema::dropIfExists('event_assessment');
    }
}
