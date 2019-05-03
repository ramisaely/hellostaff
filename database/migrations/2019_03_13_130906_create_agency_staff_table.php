<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAgencyStaffTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agency_staff', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('agency_id')->index('idx_agency_id')->unsigned();
            $table->foreign('agency_id')->references('id')->on('agency')->onDelete('cascade');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned();
            $table->foreign('staff_id')->references('id')->on('staff')->onDelete('cascade');
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
        Schema::dropIfExists('agency_staff');
    }
}
