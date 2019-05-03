@extends('front.staff.layout.master_account')

@section('additional-css')
 {!! Html::style('css/Front/staff/evaluate/evaluate.css') !!}
 {!! Html::style('css/Front/staff/evaluate/evaluate_responsive.css') !!}
@section('content')	
<div class="evaluation_staff_content">
	<section class="step_evaluation_staff">
		<label class="title_step_evaluation_staff">{!! trans('evaluate.Ratings_Reviews') !!}</label>
    </section>
    <section class="evaluation_content">
        @foreach($evaluations as $evaluation)
    	<div class="view_evaluation" data-id_user="68">
    		<div class="evaluation_note">
    			<div class="evaluation_avatar">
    				<div class="photo_candidates">
		              <img src="{!!$evaluation->agency->getImageProfilPath()!!}" alt="">
		            </div>
		            <div class="info_candidates">
		            	<span class="user_name">{!! trans('evaluate.Name_agency') !!}</span>
                        <span class="user_post">{{ $evaluation->agency->name }}</span>
		            </div>
    			</div>
    			 <div class="info_candidate event">
		            	<span class="user_name dateEvaluation">{{ getDateString($evaluation->created_at) }}</span>
		            	<span class="user_post">{{ $evaluation->eventAgency->name }}</span>
		        </div>
    			<fieldset class="rating">
                    <input type="radio" id="star{{$evaluation->id}}16" name="rating{{$evaluation->id}}" value="5" /><label class = "full" for="star{{$evaluation->id}}16" data-value="5"></label>

                    <input type="radio" id="star{{$evaluation->id}}half16" name="rating" value="4.5" /><label class="half" for="star{{$evaluation->id}}half16" data-value="4.5"></label>

                    <input type="radio" id="star{{$evaluation->id}}17" name="rating" value="4" /><label class = "full" for="star{{$evaluation->id}}17" data-value="4"></label>

                    <input type="radio" id="star{{$evaluation->id}}half17" name="rating" value="3.5" /><label class="half" for="star{{$evaluation->id}}half17" data-value="3.5"></label>

                    <input type="radio" id="star{{$evaluation->id}}18" name="rating" value="3" /><label class = "full" for="star{{$evaluation->id}}18" data-value="3"></label>

                    <input type="radio" id="star{{$evaluation->id}}half18" name="rating" value="2.5" /><label class="half" for="star{{$evaluation->id}}half18" data-value="2.5"></label>

                    <input type="radio" id="star{{$evaluation->id}}19" name="rating" value="2" /><label class = "full" for="star{{$evaluation->id}}19" data-value="2"></label>

                    <input type="radio" id="star{{$evaluation->id}}half19" name="rating" value="1.5" /><label class="half" for="star{{$evaluation->id}}half19" data-value="1.5"></label>

                    <input type="radio" id="star{{$evaluation->id}}20" name="rating" value="1" /><label class = "full" for="star{{$evaluation->id}}20" data-value="1"></label>

                    <input type="radio" id="star{{$evaluation->id}}half20" name="rating" value="half" /><label class="half" for="star{{$evaluation->id}}half20" data-value="0.5"></label>
                </fieldset>
                <input type="hidden" name="ratingResponse[]" class="ratingResponse" value="{{($evaluation)? $evaluation->rating:0}}">
    		</div>
    		<div class="evaluation_description">
    			{{ $evaluation->description }}
    		</div>
    	</div>
        @endforeach
    </section>
</div>

@endsection
@section('additional-scripts')
  {!! Html::script('js/Front/staff/evaluate.js') !!}
@endsection

