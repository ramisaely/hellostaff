<div class="job_experience">
	<?php 
            if(Session::has('staffData')) {
                $staff_data = Session::get('staffData');
            }else
            	$staff_data = ['job77'=>'','job78'=>'','job79'=>'','job80'=>'','job81'=>'','job82'=>'','job83'=>'','job84'=>'','job85'=>'','job86'=>'','job87'=>'','job88'=>'','job89'=>'','job90'=>'','job91'=>'','job92'=>'','job93'=>'','job94'=>'','job95'=>'','exp_77'=>'','exp_78'=>'','exp_79'=>'','exp_80'=>'','exp_81'=>'','exp_82'=>'','exp_83'=>'','exp_84'=>'','exp_85'=>'','exp_86'=>'','exp_87'=>'','exp_88'=>'','exp_89'=>'','exp_90'=>'','exp_91'=>'','exp_92'=>'','exp_93'=>'','exp_94'=>'','exp_95'=>''
            		];
        ?>
	@if(count($jobs)>0)
		@foreach($jobs as $job)
			<?php $translation = $job->getByLanguageId(getLanguageId()); ?>
			<div class="job {{$staff_data['job'.$job->id] != '' ? 'active': ''}} {{$staff_data['exp_'.$job->id] != 'no' ? 'xp': ''}}">
				<div class="job_img">
					<img src="{!! $job->getImagePath() !!}" alt="{!! $translation->name !!}">
				</div>
				<p class="title">{!! $translation->name !!}</p>
				<span class="launch_modal" data-modal="define_experience" data-src-img="{!! $job->getImagePath() !!}">{{$staff_data['job'.$job->id] != '' ? $staff_data['job'.$job->id]: 'XP'}}</span>
				<input class="job_experience" type="hidden" value="{{$staff_data['job'.$job->id] != '' ? $staff_data['job'.$job->id]: ''}}" name="job_experience[]" id="job{!! $job->id !!}" >
				<input type="hidden" name="job_id[]" value="{!! $job->id !!}">
				<input class="job_checked" value="{{$staff_data['exp_'.$job->id] != 'no' ? $staff_data['exp_'.$job->id]: 'no'}}" type="hidden" name="job_checked[]" >
 			</div>
		@endforeach
	@endif
	
</div>