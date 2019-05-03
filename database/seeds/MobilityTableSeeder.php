<?php

use Illuminate\Database\Seeder;
use App\Models\Mobility;

class MobilityTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		factory(Mobility::class)->create([
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
    }
}
