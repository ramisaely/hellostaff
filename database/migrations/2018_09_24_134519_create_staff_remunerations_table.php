<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffRemunerationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('staff_remunerations', function (Blueprint $table) {
            $table->increments('staff_remuneration_id');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned()->nullable();
            $table->foreign('staff_id')->references('staff_id')->on('staff')->onDelete('cascade');
            $table->integer('price');
            $table->string('nas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('staff_remunerations');
    }
}
