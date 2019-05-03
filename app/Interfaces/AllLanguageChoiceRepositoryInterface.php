<?php
 
namespace App\Interfaces;
 
interface AllLanguageChoiceRepositoryInterface
{
	function getAll();
 
	function getById($id);
 
	function create($attributes);
 
	function update($id, $attributes);
 
	function delete($id);
}