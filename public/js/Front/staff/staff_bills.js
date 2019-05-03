$(document).ready(function() {
	// Filter bills
    $('#filter_bills').keyup(function(){
      var input, table, tr, company, date, event, bill, job, i , companyValue, dateValue, eventValue, billValue, jobValue;
      input = $(this).val().toUpperCase().trim();
      table = document.getElementById("table_bills_to_filter");
      tr = table.getElementsByTagName("tr");

      for (i = 0; i < tr.length; i++) {
        company = tr[i].getElementsByTagName("td")[1];
        date = tr[i].getElementsByTagName("td")[2];
        event = tr[i].getElementsByTagName("td")[3];
        bill = tr[i].getElementsByTagName("td")[4];
        job = tr[i].getElementsByTagName("td")[5];
        if (company && date && event && bill && job) {
          companyValue = company.textContent || company.innerText;
          companyValue = companyValue.trim();
          dateValue = date.textContent || date.innerText;
          dateValue = dateValue.trim();
          eventValue = event.textContent || event.innerText;
          eventValue = eventValue.trim();
          billValue = bill.textContent || bill.innerText;
          billValue = billValue.trim();
          jobValue = job.textContent || job.innerText;
          jobValue = jobValue.trim();

          if (companyValue.toUpperCase().indexOf(input) > -1 || dateValue.toUpperCase().indexOf(input) > -1 || eventValue.toUpperCase().indexOf(input) > -1 || billValue.toUpperCase().indexOf(input) > -1 || jobValue.toUpperCase().indexOf(input) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        }   
      }

    });
    console.log('mande v');

    $('.staff_bills').find('.content_table').each(function(){
      if ($(this).find('.total_net_text').text() == "Pas encore validé") {
        console.log('mande v');
        $(this).find('.total_net_text').css('color', 'red');
      } else {
        $(this).find('.total_net_text').css('color', '#000000');
      }
      if ($(this).find('.date_bills_text').text() == "Pas encore validé") {
        $(this).find('.date_bills_text').css('color', 'red');
      } else {
        $(this).find('.date_bills_text').css('color', '#000000');
      }
    });
    $('.staff_bills').on('click', '.bill_link', function(){
      if ($(this).closest('.content_table').find('.total_net_text').text() == "Pas encore validé" && $(this).closest('.content_table').find('.date_bills_text').text() == "Pas encore validé") {
        toastr.warning('Votre Facture n\'est pas encore validé, Veuillez la valider');
      } else {
        launch_modal('show_my_bill');
        var idEventStaff = $(this).closest('.content_table').find('.idEventStaff').val();
        var url = $(this).attr('data-findFacture');
        $.ajax({
          url : url,
            type : 'POST',
            data:{data_id : idEventStaff},
            success : function(response){
              $('#show_my_bill').find('.modal_content').find('.modal_body').remove();
              $('#show_my_bill').find('.modal_content').append(response);             
            },
            error : function(resultat, statut, erreur){
                console.log("Failed to request event '"+idEventStaff+"' from databse with : "+erreur);
            }
        });

      }
    });

    $('.staff_bills').on('click', '.download_bill_link', function(){
      if ($(this).closest('.content_table').find('.total_net').text() == "Pas encore validé" && $(this).closest('.content_table').find('.date_bills').text() == "Pas encore validé") {
        toastr.warning('Votre Facture n\'est pas encore validé, Veuillez la valider');
        event.preventDefault();
      } else {
        var idEventStaff = $(this).closest('.content_table').find('.idEventStaff').val();
        var url = $(this).attr('data-findFacture');
        $.ajax({
          url : url,
            type : 'POST',
            data:{data_id : idEventStaff},
            success : function(response){
              launch_modal('show_my_bill');
              $('#show_my_bill').find('.modal_content').find('.modal_body').remove();
              $('#show_my_bill').find('.modal_content').append(response);  
              $(document).find('#show_my_bill .download_bill').trigger('click');
              //tsy tokony hiseho ilay popup fa nefa tsy mety ilay trigger click raha tsy miala ilay display bloc
              //$(document).find('#show_my_bill .close_modal').trigger('click');
            },
            error : function(resultat, statut, erreur){
                console.log("Failed to request event '"+idEventStaff+"' from databse with : "+erreur);
            }
        });
      }
    });

    $(document).on('click', '#show_my_bill .download_bill', function(){
      var pdfdoc = new jsPDF();
      pdfdoc.internal.scaleFactor = 1;
          pdfdoc.addHTML($('#show_my_bill .modal_body'), function() {
        pdfdoc.save('First.pdf');
      });
    });
});