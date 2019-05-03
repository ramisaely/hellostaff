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
            $table->renameColumn('event_staff_date_id', 'id');
            $table->dropForeign('event_staff_date_event_staff_id_foreign');
            $table->foreign('event_staff_id')->references('id')->on('event_staff')->onDelete('cascade')->change();
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
