<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
        'remember_token' => str_random(10),
    ];
});

$factory->define(\App\Models\Language::class, function (Faker $faker) {
	return [
		'language_name' => $faker->name,
		'language_code' => $faker->name
	];
});

$factory->define(\App\Models\Gender::class, function (Faker $faker) {
	return [
		'name' => $faker->name,
	];
});

$factory->define(\App\Models\Mobility::class, function (Faker $faker) {
	return [
		'created_by' => $faker->name,
		'created_at' => \Carbon\Carbon::now(),
		'updated_at' => \Carbon\Carbon::now()
	];
});

$factory->define(\App\Models\MobilityTranslation::class, function (Faker $faker) {
	return [
		'mobility_id' => $faker->name,
		'name' => $faker->name,
		'language_id' => $faker->name
	];
});

$factory->define(\App\Models\Job::class, function (Faker $faker) {
	return [
		'icon' => $faker->name,
		'created_by' => $faker->name,
		'created_at' => \Carbon\Carbon::now(),
		'updated_at' => \Carbon\Carbon::now()
	];
});

$factory->define(\App\Models\JobTranslation::class, function (Faker $faker) {
	return [
		'job_id' => $faker->name,
		'name' => $faker->name,
		'language_id' => $faker->name
	];
});

$factory->define(\App\Models\Attribute::class, function (Faker $faker) {
	return [
		'created_by' => $faker->name,
		'created_at' => \Carbon\Carbon::now(),
		'updated_at' => \Carbon\Carbon::now()
	];
});

$factory->define(\App\Models\AttributeTranslation::class, function (Faker $faker) {
	return [
		'attribute_id' => $faker->name,
		'name' => $faker->name,
		'language_id' => $faker->name
	];
});

$factory->define(\App\Models\AttributeOption::class, function (Faker $faker) {
	return [
		'attribute_id' => $faker->name,
		'sort_order' => $faker->name
	];
});

$factory->define(\App\Models\AttributeOptionTranslation::class, function (Faker $faker) {
	return [
		'attribute_option_id' => $faker->name,
		'value' => $faker->name,
		'language_id' => $faker->name
	];
});

$factory->define(\App\Models\AttributeOptionGender::class, function (Faker $faker) {
	return [
		'attribute_id' => $faker->name,
		'attribute_option_id' => $faker->name,
		'gender_id' => $faker->name
	];
});

$factory->define(\App\Models\UserRole::class, function (Faker $faker) {
	return [
		'role_name' => $faker->name,
		'created_at' => \Carbon\Carbon::now(),
		'updated_at' => \Carbon\Carbon::now()
	];
});