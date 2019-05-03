<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Doctrine\DBAL\Types\FloatType;
use Doctrine\DBAL\Types\Type;

class UpdateTableEventStaffNullableDistanceAndPerdiem extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Type::hasType('double')) {
            Type::addType('double', FloatType::class);
        }
        
        Schema::table('event_staff', function (Blueprint $table) {
            $table->double('distance')->nullable()->change();
            $table->integer('per_diem')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event_staff', function (Blueprint $table) {
            $table->double('distance')->change();
            $table->integer('per_diem')->change();
        });
    }
}
