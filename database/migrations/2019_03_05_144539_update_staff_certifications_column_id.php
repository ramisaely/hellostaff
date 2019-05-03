<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateStaffCertificationsColumnId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('staff_certifications', function (Blueprint $table) {
            $table->renameColumn('staff_certification_id', 'id');
            $table->dropForeign('staff_certifications_staff_id_foreign');
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
        Schema::table('staff_certifications', function (Blueprint $table) {
            //
        });
    }
}
