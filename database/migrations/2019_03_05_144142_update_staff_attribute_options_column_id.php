<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateStaffAttributeOptionsColumnId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('staff_attribute_options', function (Blueprint $table) {
            $table->renameColumn('staff_attribute_option_id', 'id');
            $table->dropForeign('staff_attribute_options_staff_attribut_id_foreign');
            $table->foreign('staff_attribut_id')->references('id')->on('staff_attribut')->onDelete('cascade')->change();
            $table->dropForeign('staff_attribute_options_attribute_id_foreign');
            $table->foreign('attribute_id')->references('id')->on('attributes')->onDelete('cascade')->change();
            $table->dropForeign('staff_attribute_options_attribute_option_id_foreign');
            $table->foreign('attribute_option_id')->references('id')->on('attribute_options')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('staff_attribute_options', function (Blueprint $table) {
            //
        });
    }
}
