<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableEventStaffJobs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_staff_jobs', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('event_staff_id')->index('idx_event_staff_id')->unsigned();
            $table->foreign('event_staff_id')->references('id')->on('event_staff')->onDelete('cascade');
            $table->integer('job_id')->index('idx_job_id')->unsigned();
            $table->foreign('job_id')->references('id')->on('jobs')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_staff_jobs');
    }
}
