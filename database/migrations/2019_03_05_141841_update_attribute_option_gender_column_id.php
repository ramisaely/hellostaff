<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateAttributeOptionGenderColumnId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('attribute_option_gender', function (Blueprint $table) {
            $table->renameColumn('attribute_option_gender_id', 'id');
            $table->dropForeign('attribute_option_gender_attribute_id_foreign');
            $table->foreign('attribute_id')->references('id')->on('attributes')->onDelete('cascade')->change();
            $table->dropForeign('attribute_option_gender_attribute_option_id_foreign');
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
        Schema::table('attribute_option_gender', function (Blueprint $table) {
            //
        });
    }
}
