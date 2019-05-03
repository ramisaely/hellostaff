<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(\App\Interfaces\StaffRepositoryInterface::class, \App\Repositories\StaffRepository::class);
        $this->app->bind(\App\Interfaces\MobilityRepositoryInterface::class, \App\Repositories\MobilityRepository::class);
        $this->app->bind(\App\Interfaces\JobRepositoryInterface::class, \App\Repositories\JobRepository::class);
        $this->app->bind(\App\Interfaces\AttributeRepositoryInterface::class, \App\Repositories\AttributeRepository::class);
        $this->app->bind(\App\Interfaces\AgencyRepositoryInterface::class, \App\Repositories\AgencyRepository::class);
        $this->app->bind(\App\Interfaces\EventRepositoryInterface::class, \App\Repositories\EventRepository::class);
        $this->app->bind(\App\Interfaces\AllLanguageRepositoryInterface::class, \App\Repositories\AllLanguageRepository::class);
        $this->app->bind(\App\Interfaces\AllLanguageChoiceRepositoryInterface::class, \App\Repositories\AllLanguageChoiceRepository::class);
    }
}
