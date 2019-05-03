<?php

use Illuminate\Database\Seeder;
use App\Models\Language;

class LanguageTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		factory(Language::class)->create([
			'language_name' => 'French',
			'language_code' => 'fr'
		]);
		
        factory(Language::class)->create([
			'language_name' => 'English',
			'language_code' => 'en'
		]);

    }
}
