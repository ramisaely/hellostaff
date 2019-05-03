<?php
 
namespace App\Interfaces;
 
interface AllLanguageRepositoryInterface
{
	function getAll();
 
	function getById($id);
 
	function create($attributes);
 
	function update($id, $attributes);
 
	function delete($id);
}