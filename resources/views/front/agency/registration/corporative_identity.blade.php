<div id="status" style="font-family: Raleway;"></div>
<?php 
            if(Session::has('agencyData')) {
                $agency_data = Session::get('agencyData');
            }
        ?>
<div class="corporative_identity">
    <div class="entreprise_logo focused_div" id="dropfile">
        <div class="dragBox"  >
            <div class="logo" >
                <img id="img_entreprise" src="{!! url('img/agency/font_upload_logo_agency.png') !!}"></img>
                <input type="file" name="image" class="input_hidden" id="company_logo2"/>
            </div>
            <input type="file" accept=".png, .jpg, .jpeg" class="input_hidden_special" name="company_logo"
                   value="" id="company_logo" >
            <input type="text" class="input_hidden" id="cache">
            <span class="medium_title">{!! trans('agency_register.text_logo') !!}</span>
        </div>
        <p>
            <small class="mini-title">
                {!! trans('agency_register.parcourir') !!}
                <label class="file_link"  for="company_logo">{!! trans('agency_register.file') !!} </label>
            </small>
        </p><br>
    </div>
    <div id="list"></div>
    
    <div class="brief_description">
        <div class="heading">
            <span class="description_label">{!! trans('agency_register.description') !!}</span>
            <!--<span class="language_site">
            	<div class="checkbox">
            		<input type="checkbox" name="" id="description_fr_check" class="uniq">
            		<label class="checkbox_label" for="description_fr_check">FR</label>
            	</div>
            	<div class="checkbox">
            		<input type="checkbox" name="" id="description_en_check" class="uniq">
            		<label class="checkbox_label" for="description_en_check">EN</label>
            	</div>
            </span>-->
        </div>
        <div class="texts">
            <textarea name="description_fr" id="description_fr" placeholder="{!! trans('agency_register.placeH_brievD') !!}" rows="5" autocomplete="off">{{Session::has('agencyData') ? $agency_data['description_fr'] : ''}}</textarea>
            <!--<textarea name="description_en" id="description_en" placeholder="Enter your description here" class="input_hidden" rows="5" autocomplete="off"></textarea>-->
        </div>
    </div>
</div>