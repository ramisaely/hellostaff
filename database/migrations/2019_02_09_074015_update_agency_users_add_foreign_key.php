<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateAgencyUsersAddForeignKey extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('agency_users', function (Blueprint $table) {
            $table->integer('agency_id')->index('idx_agency_id')->unsigned()->change();
            $table->foreign('agency_id')->references('id')->on('agency')->onDelete('cascade');  
            $table->integer('user_id')->index('idx_user_id')->unsigned()->change();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');  
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
