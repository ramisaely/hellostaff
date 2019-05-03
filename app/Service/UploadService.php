<?php
namespace App\Service;

use Carbon\Carbon;

Class UploadService
{
    public function __construct()
    {
    }
    public function upload($file,$path, $append_timestamp = true)
    {
        $timestamp = str_replace([' ', ':'], '-', Carbon::now()->toDateTimeString());
        $file_name = str_replace(' ', '_', $file->getClientOriginalName()) ;
		if($append_timestamp){
			$image_name = $timestamp . '-' . $file_name;
		} else {
			$image_name = $file_name;
		}
        $file->move(public_path() .'/'.$path , $image_name);
        return $image_name;
    }
}