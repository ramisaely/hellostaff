<?php

use Illuminate\Database\Seeder;
use App\Models\MobilityTranslation;

class MobilityTranslationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(MobilityTranslation::class)->create([
			'mobility_id' => 41,
			'name' => 'Montréal centre',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 42,
			'name' => 'Est de Montréal',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 43,
			'name' => 'Ouest de Montréal',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 44,
			'name' => 'Rive-Sud de Montréal',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 45,
			'name' => 'Rive nord de Montréal',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 46,
			'name' => 'Région de Québec',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 47,
			'name' => 'Reste du Québec',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 48,
			'name' => 'Hors Québec',
			'language_id' => 1
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 41,
			'name' => 'Montreal center',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 42,
			'name' => 'East of Montreal',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 43,
			'name' => 'West of Montreal',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 44,
			'name' => 'South Shore of Montreal',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 45,
			'name' => 'North Shore of Montreal',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 46,
			'name' => 'Quebec Region',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 47,
			'name' => 'Rest of Quebec',
			'language_id' => 2
		]);
		factory(MobilityTranslation::class)->create([
			'mobility_id' => 48,
			'name' => 'Outside Quebec',
			'language_id' => 2
		]);
    }
}
