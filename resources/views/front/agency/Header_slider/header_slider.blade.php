<div id="content_header_slider">
    <div class="slackSlider is_hidden">
        <!-- Slider -->
        <div class="header_slider">
            @if($events)
                @foreach($events as $key => $eventImage)
                    <div class="thumbnail" data-key="{{$key}}" data-id="{{ $eventImage->id }}" data-url_event="{{route('find_event_finished')}}">
                        <img src="{!! $eventImage->getImageSliderEventPath() !!}" alt="" />
                        <label class="title_event">{{ $eventImage->name }}</label>
                        <input type="hidden" name="name_event_click" class="name_event_click" value="{{ $eventImage->name }}">
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
