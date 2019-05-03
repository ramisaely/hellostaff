<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateStaffAttributColumnId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('staff_attribut', function (Blueprint $table) {
            $table->renameColumn('staff_attribut_id', 'id');
            $table->dropForeign('staff_attribut_staff_id_foreign');
            $table->foreign('staff_id')->references('id')->on('staff')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('staff_attribut', function (Blueprint $table) {
            //
        });
    }
}
