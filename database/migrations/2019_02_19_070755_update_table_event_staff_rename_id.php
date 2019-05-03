<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableEventStaffRenameId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event_staff', function (Blueprint $table) {
            $table->renameColumn('id', 'id');
            $table->dropForeign('event_staff_event_id_foreign');
            $table->foreign('event_id')->references('id')->on('event')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_staff', function (Blueprint $table) {
            //
        });
    }
}
