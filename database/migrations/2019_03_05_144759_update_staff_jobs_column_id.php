<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateStaffJobsColumnId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('staff_jobs', function (Blueprint $table) {
            $table->renameColumn('staff_job_id', 'id');
            $table->dropForeign('staff_jobs_staff_id_foreign');
            $table->foreign('staff_id')->references('id')->on('staff')->onDelete('cascade')->change();
            $table->dropForeign('staff_jobs_job_id_foreign');
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
        Schema::table('staff_jobs', function (Blueprint $table) {
            //
        });
    }
}
