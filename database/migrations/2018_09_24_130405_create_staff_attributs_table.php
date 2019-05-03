<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffAttributsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('staff_attribut', function (Blueprint $table) {
            $table->increments('staff_attribut_id');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned()->nullable();
            $table->foreign('staff_id')->references('staff_id')->on('staff')->onDelete('cascade');
            $table->string('tattoo');
            $table->string('piercing');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('staff_attributs');
    }
}
