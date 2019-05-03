<?php

use Illuminate\Database\Seeder;
use App\Models\JobTranslation;

class JobTranslationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        		
        factory(JobTranslation::class)->create([
            'job_id' => 77,
			'name' => 'Ambassadeur de marque',
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 78,
			'name' => "Chef d'équipe",
			'language_id' => '1',
		]);
		
				
		factory(JobTranslation::class)->create([
		    'job_id' => 79,
			'name' => "Spécialiste Produit",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 80,
			'name' => "Hôte",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 81,
			'name' => "Coordinateur de terrain",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 82,
			'name' => "Equipe de montage/démontage",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 83,
			'name' => "Dégustation",
			'language_id' => '1',
		]);
		
				
		factory(JobTranslation::class)->create([
		    'job_id' => 84,
			'name' => "Distribution de dépliants",
			'language_id' => '1',
		]);
		
				
		factory(JobTranslation::class)->create([
		    'job_id' => 85,
			'name' => "Photographe",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 86,
			'name' => "Mascotte",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 87,
			'name' => "Serveur",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 88,
			'name' => "Plongueur",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 89,
			'name' => "Maître de cérémonie",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 90,
			'name' => "DJ",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 91,
			'name' => "Magicien",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 92,
			'name' => "Acteur",
			'language_id' => '1',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 93,
			'name' => "Danseur",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 94,
			'name' => "Chanteur",
			'language_id' => '1',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 95,
			'name' => "Caricaturiste",
			'language_id' => '1',
		]);
		
		
	    factory(JobTranslation::class)->create([
	        'job_id' => 77,
			'name' => 'Brand ambassador',
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 78,
			'name' => "Leader",
			'language_id' => '2',
		]);
		
				
		factory(JobTranslation::class)->create([
		    'job_id' => 79,
			'name' => "Product Specialist",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
		    'job_id' => 80,
			'name' => "Host",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 81,
			'name' => "Field coordinator",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 82,
			'name' => "Assembly / disassembly team",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
		    'job_id' => 83,
			'name' => "Tasting",
			'language_id' => '2',
		]);
		
				
		factory(JobTranslation::class)->create([
			'job_id' => 84,
			'name' => "Distribution of leaflets",
			'language_id' => '2',
		]);
		
				
		factory(JobTranslation::class)->create([
			'job_id' => 85,
			'name' => "Photographer",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 86,
			'name' => "Mascot",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 87,
			'name' => "Waiter",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
			'job_id' => 88,
			'name' => "Diver",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
			'job_id' => 89,
			'name' => "Master of Ceremonies",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
			'job_id' => 90,
			'name' => "DJ",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
			'job_id' => 91,
			'name' => "Magician",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
			'job_id' => 92,
			'name' => "Actor",
			'language_id' => '2',
		]);
		
		
		factory(JobTranslation::class)->create([
			'job_id' => 93,
			'name' => "Dancer",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 94,
			'name' => "Singer",
			'language_id' => '2',
		]);
		
		factory(JobTranslation::class)->create([
			'job_id' => 95,
			'name' => "Cartoonist",
			'language_id' => '2',
		]);
    }
}
