<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffCertificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('staff_certifications', function (Blueprint $table) {
            $table->increments('staff_certification_id');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned()->nullable();
            $table->foreign('staff_id')->references('staff_id')->on('staff')->onDelete('cascade');
            $table->binary('actra');
            $table->binary('food_handling');
            $table->binary('uda');
            $table->binary('have_car');
            $table->binary('driver_license');
            $table->binary('driver_license_truck');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('staff_certifications');
    }
}
