<?php

use Illuminate\Database\Seeder;
use App\Models\Gender;

class GenderTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Gender::class)->create([
			'name' => 'Homme',
		]);
		
		factory(Gender::class)->create([
			'name' => 'Femme',
		]);
    }
}
