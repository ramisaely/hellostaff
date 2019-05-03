<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableEventStaffDate extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_staff_date', function (Blueprint $table) {
            $table->dropColumn('date');
            $table->date('date_start')->nullable();
            $table->date('date_end')->nullable();
            $table->time('start_hour_event_staff_date')->change();
            $table->string('color_event_staff_date')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_staff_date', function (Blueprint $table) {
            //
        });
    }
}
