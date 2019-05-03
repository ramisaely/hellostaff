<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateAttributeTranslationsColumnId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('attribute_translations', function (Blueprint $table) {
            $table->renameColumn('attribute_translation_id', 'id');
            $table->dropForeign('attribute_translations_attribute_id_foreign');
            $table->foreign('attribute_id')->references('id')->on('attributes')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('attribute_translations', function (Blueprint $table) {
            //
        });
    }
}
