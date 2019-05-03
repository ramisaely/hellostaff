<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableJobTranslationRenameForeiorereignKey extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('job_translation', function (Blueprint $table) {
            $table->renameColumn('job_translation_id', 'id');
            $table->dropForeign('job_translation_job_id_foreign');
            $table->foreign('job_id')->references('id')->on('jobs')->onDelete('cascade')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('job_translation', function (Blueprint $table) {
            //
        });
    }
}
