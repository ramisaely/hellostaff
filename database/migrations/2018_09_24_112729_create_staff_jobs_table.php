<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffJobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        Schema::create('jobs', function (Blueprint $table) {
            $table->increments('job_id');
            $table->string('icon');
            $table->integer('created_by');
            $table->timestamps();
        });
        
        DB::statement("ALTER TABLE jobs AUTO_INCREMENT = 77;");
        
        Schema::create('job_translation', function (Blueprint $table) {
            $table->increments('job_translation_id');
            $table->integer('job_id')->index('idx_job_id')->unsigned()->nullable();
            $table->foreign('job_id')->references('job_id')->on('jobs')->onDelete('set null');
            $table->string('name');
            $table->integer('language_id'); 
        });
        
        Schema::create('staff_jobs', function (Blueprint $table) {
            $table->increments('staff_job_id');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned()->nullable();
            $table->foreign('staff_id')->references('staff_id')->on('staff')->onDelete('cascade');
            $table->integer('job_id')->index('idx_job_id')->unsigned()->nullable();
            $table->foreign('job_id')->references('job_id')->on('jobs')->onDelete('set null');
            $table->integer('experience_year');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('staff_jobs');
        Schema::dropIfExists('jobs');    
    }
}
