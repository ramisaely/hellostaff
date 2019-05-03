<div id="content_header_slider">
    <div class="slackSlider is_hidden">
        <!-- Slider -->
        <div class="header_slider">
            @if($events)
                @foreach($events as $key => $event)
                    <div class="thumbnail" data-key="{{$key}}" data-idEventStaff="@foreach($event->eventStaffs as $eventStaff){{ ($eventStaff)?$eventStaff->id:'' }}@endforeach" data-id="{{ $event->id }}" data-url_event="{{ route('find_event_staff') }}" data-finished_event="{{ route('find_finished_event_staff') }}">
                        <img src="{!! $event->getImageSliderEventPath() !!}" alt="{{ $event->name }}" />
                        <label class="title_event">{{ $event->name }}</label>
                        <input type="hidden" name="name_event_click" class="name_event_click" value="{{ $event->name }}">
                    </div>
                @endforeach
            @endif
        </div>
    </div>

    <!-- control arrows -->
    <nav class="slidernav">
        <div id="navbtns" class="clearfix">
            <a href="#" class="prev"><</a>
            <div class="separated_slide"></div>
            <a href="#" class="next">></a>
        </div>
    </nav>
</div>
