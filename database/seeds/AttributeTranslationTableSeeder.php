<?php

use Illuminate\Database\Seeder;

class AttributeTranslationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(\App\Models\AttributeTranslation::class)->create([
			'attribute_id'=>1,
			'name' => "Veste/Chemises",
			'language_id' => 1,
		]);
		factory(\App\Models\AttributeTranslation::class)->create([
			'attribute_id'=>1,
			'name' => "Jacket/Shirts",
			'language_id' => 2,
		]);
		
		factory(\App\Models\AttributeTranslation::class)->create([
			'attribute_id'=>2,
			'name' => "Pantalons",
			'language_id' => 1,
		]);
		factory(\App\Models\AttributeTranslation::class)->create([
			'attribute_id'=>2,
			'name' => "Pants",
			'language_id' => 2,
		]);
		
		factory(\App\Models\AttributeTranslation::class)->create([
			'attribute_id'=>3,
			'name' => "Chaussures",
			'language_id' => 1,
		]);
		factory(\App\Models\AttributeTranslation::class)->create([
			'attribute_id'=>3,
			'name' => "Shoes",
			'language_id' => 2,
		]);
    }
}
