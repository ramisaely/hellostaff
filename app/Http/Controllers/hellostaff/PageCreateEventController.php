<?php

namespace App\Http\Controllers\hellostaff;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\event;
use Calendar;
use DateTime;

class PageCreateEventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $events = [];  
        $data = event::all();  
        if($data->count()) {  
            foreach ($data as $key => $value) {  
                $events[] = Calendar::event(  
                    $value->name,  
                    true,  
                    new DateTime($value->start_date),  
                    new DateTime($value->end_date.' +1 day'),
                    null,
                    [
                        'color' => '#ff0000',
                        'url' => 'pass here url and any route',
                    ]
                );
            }  
        }  
        $calendar = Calendar::addEvents($events); 
        //view inscription hellostaff
        return view('create_event.page.index', compact('calendar'));
    }
    
    public function create_event()
    {
        $events = [];  
        $data = event::all();  
        if($data->count()) {  
            foreach ($data as $key => $value) {  
                $events[] = Calendar::event(  
                    $value->name,  
                    true,  
                    new DateTime($value->start_date),  
                    new DateTime($value->end_date.' +1 day'),
                    null,
                    [
                        'color' => '#ff0000',
                        'url' => 'pass here url and any route',
                    ]
                );
            }  
        }  
        $calendar = Calendar::addEvents($events); 
        //view inscription hellostaff
        return view('create_event.page.index', compact('calendar'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
