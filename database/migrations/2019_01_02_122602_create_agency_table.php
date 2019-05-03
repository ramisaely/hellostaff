<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAgencyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agency', function (Blueprint $table) {
            $table->increments('agency_id');
            $table->string('name');
            $table->string('address');
            $table->integer('number')->unsigned()->nullable();
            $table->string('city');
            $table->string('tps')->nullable();;
            $table->string('tvq')->nullable();;
            $table->string('postal_code');
            $table->string('province');
            $table->string('country');
            $table->string('logo');
            $table->text('description_fr')->nullable();
            $table->text('description_en')->nullable();
            $table->string('phone')->unique();
            $table->string('email')->unique();
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
        Schema::dropIfExists('agency');
    }
}
