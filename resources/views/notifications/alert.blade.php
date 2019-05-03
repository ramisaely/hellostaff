@if ($errors->any())
    <div class="alert_notification">
	    <div class="alert danger">
	    	<span class="close">&times;</span>
	        <ul>
	            @foreach ($errors->all() as $error)
	                <li>{{ $error }}</li>
	            @endforeach
	        </ul>
	    </div>
	</div>    
@endif
@if (session('status'))
    <div class="alert_notification">
        <div class="alert success">
            {{ session('status') }}
        </div>
    </div>
@endif