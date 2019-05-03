<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(LanguageTableSeeder::class);
        $this->call(MobilityTableSeeder::class);
        $this->call(MobilityTranslationTableSeeder::class);
        $this->call(AttributeTableSeeder::class);
        $this->call(AttributeTranslationTableSeeder::class);
        $this->call(JobTableSeeder::class);
        $this->call(JobTranslationTableSeeder::class);
        $this->call(AttributeOptionTableSeeder::class);
        $this->call(AttributeOptionTranslationTableSeeder::class);
        $this->call(GenderTableSeeder::class);
        $this->call(AttributeOptionGenderTableSeeder::class);
        $this->call(UserRoleTableSeeder::class);
    }
}
