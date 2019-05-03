<form id="regFormReport" method="post" enctype="multipart/form-data">
<div class="staff_report_container">
	<div class="section_title">
		<span>{!! trans('staff_hour.Report_submit') !!}</span>
	</div>
	<div class="staff_report_content">
		<!-- ici -->

		<div class="question">
			<label>Question</label>
			<div class="question_content">
				<input type="hidden" class="idQuestion" name="idQuestion[]" value="">
				<p>question</p>
			</div>
		</div>

		<div class="response">
			<label for="response_content">{!! trans('staff_hour.Answer') !!}</label> 
			<textarea class="response_content" id="response_content" name="answer[]">statement $statement answer</textarea>
		</div>

		<div class="attachment_container">
			<div class="attachment">
				<div class="join_files">
					<span class="title">{!! trans('staff_hour.Join_files') !!}</span>
					<div class="right">
						<span class="separator" data-key=""></span>
						<label for="attachment_input" class="inputFile">
							<svg><use xlink:href="#icon-plus"></svg>
						</label>
						<input type="file" name="attachment_file[]" class="input_hidden reportFile" id="attachment_inputs" multiple="multiple">
					</div>
				</div>
				<div class="attachment_file_content">
				  <div class="content_file">
				  	<input type="file" class="input_hidden fileResponse" name="fileResponse[][]"/>
				  </div>
					
					<div class="attachment_file_item in_progress file_place">
						<input type="hidden" name="idFile[][]" value="" class="idEvaluation">
						<span class="format pdf">file name</span>
						<span class="document_name">file name </span>
						<small class="remove_file">
							<svg><use xlink:href="#icon-cross"></svg>
						</small>
						<div class="progress">
							<span class="bar"></span>
						</div>	
					</div>
					
					<input type="hidden" name="idRemove[]" class="idToRemove">
				</div>
			</div>
		</div>

		<!-- ici -->

		<div class="submit">
			<button class="sending_report" data-answer="{{ route('insertAnswer') }}">{!! trans('staff_hour.btn_send') !!}</button>
		</div>
	</div>
</div>
</form>