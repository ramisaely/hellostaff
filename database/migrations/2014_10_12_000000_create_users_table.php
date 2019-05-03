<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_role', function (Blueprint $table){
            $table->increments('role_id');
			$table->string('role_name');
			$table->timestamps();
        });
        
        Schema::create('users', function (Blueprint $table) {
            $table->increments('user_id');
            $table->integer('role_id')->index('idx_role_id')->unsigned()->nullable();
            $table->foreign('role_id')
				->references('role_id')->on('user_role')
				->onDelete('set null');        
            $table->string('first_name');
            $table->string('last_name');
            $table->string('email')->unique();
            $table->string('phone')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
        
        Schema::create('staff', function(Blueprint $table){
            $table->increments('staff_id');
            $table->integer('user_id')->index('idx_user_id')->unsigned()->nullable();
            $table->foreign('user_id')
				->references('user_id')->on('users')
				->onDelete('set null');   
			$table->binary('kind');
			$table->date('birthday');
			$table->string('city');
			$table->string('address');
			$table->string('zip_code');
			$table->string('source');
            $table->string('portrait_pic')->nullable();
            $table->string('single_storey_pic')->nullable();
            $table->string('cv')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_role');
        Schema::dropIfExists('users');
        Schema::dropIfExists('staff');
    }
}
