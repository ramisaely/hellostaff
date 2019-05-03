<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event', function (Blueprint $table) {
            $table->increments('event_id');
            $table->integer('agency_id')->index('idx_agency_id')->unsigned();
            $table->foreign('agency_id')->references('agency_id')->on('agency')->onDelete('cascade');  
            $table->string('name');
            $table->string('customer')->nullable();
            $table->string('location_event');
            $table->string('zip_event');
            $table->string('country_event');
            $table->string('zone_event');
            $table->date('start_date');
            $table->date('end_date');
            $table->string('description_fr_event')->nullable();
            $table->string('description_en_event')->nullable();
            $table->time('start_hour_event');
            $table->time('end_hour_event');
            $table->string('picture_event');
            $table->timestamps();
        });
        Schema::create('event_staff', function (Blueprint $table) {
            $table->increments('event_staff_id');
            $table->integer('event_id')->index('idx_event_id')->unsigned();
            $table->foreign('event_id')->references('event_id')->on('event')->onDelete('cascade');  
            $table->string('post');
            $table->integer('necessary_staff');
            $table->string('location_event_staff');
            $table->string('zip_event_staff');
            $table->string('country_event_staff');
            $table->string('zone_event_staff');
            $table->string('color_event_staff');
            $table->integer('hour_rate');
            $table->string('description_fr_event_staff')->nullable();
            $table->string('description_en_event_staff')->nullable();
            $table->double('distance');
            $table->integer('per_diem');
            $table->timestamps();
        });
        Schema::create('event_staff_date', function (Blueprint $table) {
            $table->increments('event_staff_date_id');
            $table->integer('event_staff_id')->index('idx_event_staff_id')->unsigned();
            $table->foreign('event_staff_id')->references('event_staff_id')->on('event_staff')->onDelete('cascade');  
            $table->date('date');
            $table->integer('start_hour_event_staff_date');
            $table->time('end_hour_event_staff_date');
            $table->time('color_event_staff_date');
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
        Schema::dropIfExists('event');
        Schema::dropIfExists('event_staff');
        Schema::dropIfExists('event_staff_date');
    }
}
