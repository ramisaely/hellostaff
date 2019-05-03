<?php
 
namespace App\Interfaces;
 
interface StaffRepositoryInterface
{
	function getAll();
 
	function getById($id);
 
	function create($attributes, $file_name);
 
	function update($id, $attributes, $file_name);
 
	function delete($id);

	function insertAnswer($attributes, $file_name);
}