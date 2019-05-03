<?php
 
namespace App\Interfaces;
 
interface EventRepositoryInterface
{
	function getAll();
 
	function getById($id);
 
	function create($attributes, $file_name);
 
	function update($attributes, $file_name);
 
	function delete($id);
}