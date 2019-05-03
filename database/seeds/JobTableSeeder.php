<?php

use Illuminate\Database\Seeder;
use App\Models\Job;

class JobTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        factory(Job::class)->create([
			'icon' => 'megaphone.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'user.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
				
		factory(Job::class)->create([
			'icon' => 'Group_2254.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'hostess.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'coordinating-people.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'settigns.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'chinese-food-bowl-from-side-view-and-chopsticks.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
				
		factory(Job::class)->create([
			'icon' => 'folding-map.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
				
		factory(Job::class)->create([
			'icon' => 'photo-camera.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'github.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'serving-drinks.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'liquid-soap.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'speech.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'dj-playing-records.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'magician.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'theatre-masks.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		
		factory(Job::class)->create([
			'icon' => 'black-shoes.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'microphone.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
		
		factory(Job::class)->create([
			'icon' => 'hand-writing-with-ballpen.svg',
			'created_by'=>"1",
			'created_at' => \Carbon\Carbon::now(),
			'updated_at' => \Carbon\Carbon::now(),
		]);
        
    }
}
