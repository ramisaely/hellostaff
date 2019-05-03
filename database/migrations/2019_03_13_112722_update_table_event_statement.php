<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableEventStatement extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_statement', function (Blueprint $table) {
            $table->integer('agency_id')->index('idx_agency_id')->unsigned();
            $table->foreign('agency_id')->references('id')->on('agency')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_statement', function (Blueprint $table) {
            //
        });
    }
}
