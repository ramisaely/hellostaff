<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffAttributeOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('staff_attribute_options', function (Blueprint $table) {
            $table->increments('staff_attribute_option_id');
            $table->integer('staff_attribut_id')->index('idx_staff_attribut_id')->unsigned()->nullable();
            $table->foreign('staff_attribut_id')->references('staff_attribut_id')->on('staff_attribut')->onDelete('cascade');
            $table->integer('attribute_id')->index('idx_attribute_id')->unsigned()->nullable();
            $table->foreign('attribute_id')->references('attribute_id')->on('attributes')->onDelete('cascade');
            $table->integer('attribute_option_id')->index('idxattribute_option_id')->unsigned()->nullable();
            $table->foreign('attribute_option_id')->references('attribute_option_id')->on('attribute_options')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('staff_attribute_options');
    }
}
