<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateMobilityTranslationRenameId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('mobility_translation', function (Blueprint $table) {
            $table->renameColumn('mobility_translation_id', 'id');
            $table->dropForeign('mobility_translation_mobility_id_foreign');
            $table->foreign('mobility_id')->references('id')->on('mobility')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('mobility_translation', function (Blueprint $table) {
            //
        });
    }
}
