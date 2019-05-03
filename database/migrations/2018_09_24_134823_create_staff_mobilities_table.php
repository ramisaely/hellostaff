<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStaffMobilitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mobility', function (Blueprint $table) {
            $table->increments('mobility_id');
            $table->integer('created_by');
            $table->timestamps();
        });
        
        DB::statement("ALTER TABLE mobility AUTO_INCREMENT = 41;");

        Schema::create('mobility_translation',function (Blueprint $table) {
            $table->increments('mobility_translation_id');
            $table->integer('mobility_id')->index('idx_mobility_id')->unsigned()->nullable();
            $table->foreign('mobility_id')->references('mobility_id')->on('mobility')->onDelete('cascade');
            $table->string('name');
            $table->integer('language_id');
        });
        
        Schema::create('staff_mobility', function (Blueprint $table) {
            $table->increments('staff_mobility_id');
            $table->integer('staff_id')->index('idx_staff_id')->unsigned()->nullable();
            $table->foreign('staff_id')->references('staff_id')->on('staff')->onDelete('cascade');
            $table->integer('mobility_id')->index('idx_mobility_id')->unsigned()->nullable();
            $table->foreign('mobility_id')->references('mobility_id')->on('mobility')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mobility');
    }
}
