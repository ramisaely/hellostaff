@extends('front.agency.layout.master')
@section('additional-css')
{!! Html::style('css/Front/agency/myStaff/myStaff.css')!!}
{!! Html::style('css/Front/agency/myStaff/myStaff_responsive.css')!!}
{!! Html::style('css/Front/agency/candidates_card/candidates_card.css') !!}
{!! Html::style('css/Front/agency/candidates_card/candidates_card_responsive.css') !!}
{!! Html::style('https://fonts.googleapis.com/css?family=Montserrat:100,200,300') !!}
{!! Html::style('css/Front/staff/bills/modals.css') !!}
@endsection
@section('content')
    <div class="content_my_staff">
        <div class="content_pages_my_staff">
            <div class="mystaff">
                <div class="content_step_profil">
                    <div class="step_modify_profil">
                        <label class="modify_one">{{-- {!! Auth::user()->agency->first()->name !!} --}} {!! trans("my_staff.my_staff") !!}</label>
                        <div class="form_item_create_event separator_form ">
                            <div class="input_creat_one">
                                <input class="input_create_event backgroung" type="text" name="emplacement" id="emplacement" value="" placeholder="{!! trans('my_staff.search') !!}">
                                <span class="input_addon_update_profil backgroung_search search searchClick "></span>
                                <small class="message_myStaff">{!! trans('my_staff.text_user') !!}
                                </small>
                                <ul class="dropdown_liste_jobs is_hidden">
                                @foreach($staffs as $key=>$staff)
                                    <li class="box_shadow_filter staff{{ $staff->id }}" data-key="{{$key}}">
                                        <div class="content_liste_staff">
                                            <div class="avatar_staff">
                                                <div class="avatar avatar_on_myStaff" data-showStaff="{{ route('showStaff') }}">
                                                    <img src="{!! $staff->getImagePortraitPath() !!}" alt="">
                                                </div>
                                            </div>
                                            <div class="description_staffs">
                                                <label for="" class="name_staff" data-id="{{ $staff->id }}">{{fullName($staff->first_name, $staff->last_name)}}</label>
                                            </div>
                                       </div>
                                        <div class="action_staff">
                                            <span class="delete_staff">
                                                <div class="litle_separator">+</div>
                                            </span>
                                        </div>
                                    </li>
                                @endforeach
                                </ul>
                            </div>
                            <div class="small_label_myStaff">
                            </div>
                        </div>
                    </div>
                </div>
                @if(count($myStaff) > 0)
                    <table class="content_table">
                        <thead>
                            <div class="table_myStaff">
                                <tr>
                                    <th  class="table_nom_candidat">
                                        <label class="modify">{!! trans('my_staff.Candidate_Name') !!}</label>
                                    </th>
                                    <th class="tabel_mystaff_ville">
                                        <label class="modify">{!! trans('my_staff.city') !!}</label>
                                    </th>
                                    <th class="tabel_mystaff_ville">
                                        <label class="modify">{!! trans('my_staff.Phone') !!}</label>
                                    </th>
                                    <th class="tabel_mystaff_ville">
                                        <label class="modify">{!! trans('my_staff.email') !!}</label>
                                    </th>
                                    <th class="tabel_mystaff_ville_job">
                                        <label class="modify">NAS</label>
                                    </th>
                                    <th class="tabel_mystaff_ville_finish">
                                        <label class="modify">{!! trans('my_staff.job') !!}</label>
                                    </th>
                                    <th class="tabel_mystaff_ville_finish_list">
                                        <label class="modify inherit_padding">{!! trans('my_staff.Appreciation') !!}</label>
                                    </th>
                                    <th class="tabel_mystaff_ville_finish_list">
                                        <label class="modify inherit_padding">{!! trans('my_staff.Remove_list') !!}</label>
                                    </th>
                                </tr>
                            </div>
                        </thead>
                        <tbody data-showPost="{{ route('showPostOfStaff') }}">
                        @foreach($myStaff as $index=>$mystaff)
                            <tr class="table_myStaff_color" id="staff{{ $mystaff->staff->id }}">
                                <td class="table_modify table_modify_one table_modify_start_avatar data_label" data-label="{!! trans('my_staff.Candidate_Name') !!}">
                                    <div class="flex_avatar_name">
                                        <div class="avatar_myStaff" data-show_staff_for_my_staff="{{ route('show_staff_for_my_staff') }}">
                                            <img  class="img_Staff" src="{!! $mystaff->staff->getImagePortraitPath() !!}">
                                        </div>
                                        <div class="table_modify_start_name" data-staffId="{{ $mystaff->staff->id }}" data-idStaff="{{ $mystaff->id }}">
                                            <label class="modify">{{fullName($mystaff->staff->user->first_name, $mystaff->staff->user->last_name)}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="table_modify" data-label="{!! trans('my_staff.city') !!}">
                                    <label class="modify">{{ $mystaff->staff->city }}</label>
                                </td>
                                <td class="table_modify" data-label="{!! trans('my_staff.Phone') !!}">
                                    <label class="modify">{{ $mystaff->staff->user->phone }}</label>
                                </td>
                                <td class="table_modify couriel_modify" data-label="{!! trans('my_staff.email') !!}">
                                    <label class="modify ">{{ $mystaff->staff->user->email }}</label>
                                </td>
                                <td class="table_modify couriel_modify" data-label="NAS">
                                    <label class="modify">{{ isset($mystaff->staff->staffRemuneration->nas)?$mystaff->staff->staffRemuneration->nas : ""}}</label>
                                </td>
                                <td class="table_modify couriel_modify_ambassad" data-label="Job">
                                    <label class="modify differente_inherit_padding">{{ count($mystaff->staff->staffAssessment)>0 ? $mystaff->staff->staffAssessment->first()->eventStaff->eventStaffJobs->first()->getByLanguageId(getLanguageId())->name : $mystaff->staff->staffJobs->first()->job->getByLanguageId(getLanguageId())->name }}</label>
                                    <label class="input_addon_update_profil background_view_noir bacck"></label>
                                </td>
                                <td class="table_modify_etoile table_modify couriel_modify_etoile" data-label="{!! trans('my_staff.Appreciation') !!}">
                                    <label class="background_icon_etoile_color background_etoile_full etoile"> </label>
                                    <label class="label_chiffre">{{getAppreciation($mystaff->staff)}}</label>
                                </td>
                                <td class="table_modify table_modify_color deletemyStaff" data-label="{!! trans('my_staff.Remove_list') !!}">
                                    <label class="background_moins input_addon_update_profil input_addon_update_profil_mystaff_color"></label>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                @else
                    <div class="content_table">
                        {!! trans("my_staff.no_staff") !!}
                    </div>
                @endif
             </div>
        </div>
    </div>
    <div class="content_candidate_card is_hidden">

    </div>
@endsection
@section('modal')
    @include('modals.agency.my_staff.removing_ut_myStaff')
    @include('modals.agency.my_staff.view_post_my_staff')
    @include('modals.agency.my_staff.add_person_myStaff')
    @include('modals.agency.future_event.confirm_proposed_jobs')
    @include('modals.agency.future_event.proposed_more_mystaff')
    @include('modals.agency.fiche_candidates.experience_candidat')
    @include('modals.waiting.modal_wait')

    @include('modals.agency.fiche_candidates.footer_modal')
    @include('modals.agency.fiche_candidates.iframe_view_cv')
    @include('modals.agency.fiche_candidates.slider_image_candidates')
@endsection
@section('additional-scripts')
    {!! Html::script('js/Front/agency/futur_event_confirmated.js') !!}
    {!! Html::script('js/Front/agency/mystaff.js') !!}
    {!! Html::script('js/Front/agency/candidates_card.js') !!}
@endsection