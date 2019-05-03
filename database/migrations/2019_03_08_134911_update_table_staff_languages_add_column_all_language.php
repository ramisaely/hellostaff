<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTableStaffLanguagesAddColumnAllLanguage extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('staff_languages', function (Blueprint $table) {
            $table->dropColumn('name');
            $table->dropColumn('level');
            $table->integer('all_language_id');
            $table->integer('all_language_choice_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('staff_languages', function (Blueprint $table) {
            //
        });
    }
}
