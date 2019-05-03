<div class="modal_body">
  <div class="bill_header">
    <div class="rects"><span></span><span></span></div>
    <div class="left">
      <p class="full_name">
        <span class="item">{{Auth::user()->first_name}}</span><span class="item">{{Auth::user()->last_name}}</span>
      </p>
      <p class="item">{{Auth::user()->phone}}</p>
      <p class="item">{{Auth::user()->email}}</p>
      <p class="item">{{Auth::user()->staff->address}}, {{Auth::user()->staff->zip_code}}</p>
    </div>
    <div class="right">
      <p class="item">
        <b>{!! trans('show_bills.Évent') !!} : </b><span class="nameEvent">{{ nameEventInBill($bills) }}</span>
      </p>
      <p class="item">
        <b>Dates : </b><span class="dateEvent">{{ dateEventInBill($bills) }}</span>
      </p>
      <p class="item">
        <b>{!! trans('show_bills.Post') !!}: </b><span class="postEvent">{{ postEventInBill($bills) }}</span>
      </p>
      <p class="item">
        <b>{!! trans('show_bills.Hourly_rate') !!} : </b><span class="hourly_rateEvent">{{ hourly_rateEventInBill($bills) }}$/h</span>
      </p>
    </div>
  </div> 

  <div class="agency_identity">
    <div class="item logo_agency">
      <img class="logoAgence" src="{{ logoAgenceInBill($bills) }}">
      <span class="agency_name">{{ nameAgenceInBill($bills) }}</span>
    </div>
    <p class="item addressAgence">{{ addressAgenceInBill($bills) }}</p>
    <p class="item phoneAgence">{{ phoneAgenceInBill($bills) }}</p>
    <p class="item emailAgence">{{ emailAgenceInBill($bills) }}</p>
  </div> 

  <div class="my_bill_container">
    <table class="">
      <thead>
        <tr>
          <th>Date</th>
          <th>{!! trans('show_bills.Hours') !!}</th>
          <th>{!! trans('show_bills.Remuneration') !!}</th>
          <th>{!! trans('show_bills.Outlay') !!}</th>
          <th>{!! trans('show_bills.Outlay_kilometric') !!}</th>
          <th>Per Diem</th>
        </tr>
      </thead>
      <tbody class="tbody">
      @if(count($bills)>0)
        @foreach($bills as $bill)
        <tr class="default default_table"><td data-label="Date" class="dateEvenement">
            <span class="dateStart">{{ $bill->startDate_event }}</span>
          </td>
          <td data-label='{!! trans("show_bills.Hours") !!}'>
            <span class="hourStart">{{ intBillsHour($bill->start_hour_done) }} Hr > {{ intBillsHour($bill->end_hour_done) }} Hr</span>
          </td>
          <td data-label='{!! trans("show_bills.Remuneration") !!}'>
            <span class="remuneration">{{ $bill->remuneration }} $</span>
          </td>
          <td data-label='{!! trans("show_bills.Outlay") !!}'>
            <span class="depense">{{ $bill->expense }} $</span>
          </td>
          <td data-label='{!! trans("show_bills.Outlay_kilometric") !!}'>
            <span class="distance">{{ calculDistanceBills($bill->range_done, $bill->eventStaff->distance) }} $</span>
          </td>
          <td data-label="Per Diem">
            <span>--</span>
          </td>
        </tr>
          @endforeach
      @endif
        
        <tr class="sub_total">
            <td>---</td>
            <td>--</td>
            <td class="remunerationTotal">{{ calculRemuneration($bills) }} $</td>
            <td class="depenseTotal">{{ calculDepense($bills) }} $</td>
            <td class="distanceTotal">{{ calculRange($bills) }} $</td>
            <td class="perdiemTotal">{{ per_diem($bills) }} $</td>
        </tr>
        <tr class="travelling">
          <td colspan="6" class="travelling_content">{!! trans('show_bills.text_expense') !!}</td>
        </tr>
        <tr class="total">
          <td colspan="6">
            <div class="total_content">
              <b class="title">TOTAL</b><span class="amount totalNet">{{ get_total($bills) }} $</span>
            </div>
          </td>
        </tr>
        
      </tbody>
    </table>
  </div>

  <div class="additionnal_info">
    <p class="title">{!! trans('show_bills.Additional_Info') !!}</p>
    <p class="info">{{ additionnal_info($bills) }}</p>
  </div>

  <div class="bill_footer">
    <p class="item">{!! trans('show_bills.text_facture') !!} </p>
    <p class="item">{!! trans('show_bills.send_to') !!}  sayhello@hellostaff.ca</p>
  </div>
</div>