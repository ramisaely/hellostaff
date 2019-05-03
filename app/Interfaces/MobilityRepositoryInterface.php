<?php
 
namespace App\Interfaces;
 
interface MobilityRepositoryInterface
{
	function getAll();
 
	function getById($id);
 
	function create($attributes);
 
	function update($id, $attributes);
 
	function delete($id);
}