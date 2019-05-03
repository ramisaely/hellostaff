<?php
 
namespace App\Repositories;
 
use App\Models\AllLanguage;
use App\Interfaces\AllLanguageRepositoryInterface;

class AllLanguageRepository implements AllLanguageRepositoryInterface 
{
    /**
	 * @var $model
	 */
	private $model;
 
	/**
	 * EloquentTask constructor.
	 *
	 * @param App\Task $model
	 */
	public function __construct(AllLanguage $model)
	{
		$this->model = $model;
	}
 
	/**
	 * Get all tasks.
	 **/
	public function getAll()
	{
		return $this->model->with('translation')->get();
	}
 
	/**
	 * Get task by id.
	 **/
	public function getById($id)
	{
		return $this->model->find($id);
	}
 
	/**
	 * Create a new task.
	 **/
	public function create($attributes)
	{
		return $this->model->create($attributes);
	}
 
	/**
	 * Update a task.
	 **/
	public function update($id, $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}
 
	/**
	 * Delete a task.
	 **/
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}
}