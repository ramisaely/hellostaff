$(document).ready(function() {
	$(document).on('click', '.extendhour_facture_table',function() {
		$(this).closest('tr').toggleClass('extended_row');
	})

	var lengthTr = $('.content_table').length;
	$('.cell_more_info').attr('rowspan', lengthTr);
	for (var i = 1; i < lengthTr; i++) {
		$('.content_table[data-key="'+i+'"]').find('.cell_more_info').remove();
	}
	
	if ($('.idFacture').val()!="") {
		$(document).find('.hour_facture_content').find('.content_table').each(function(){
			var hourStartBD = $(this).find('.hourEventStart').val();
			$(this).find('.hour_from').text("0"+hourStartBD);
			var hourEndBD = $(this).find('.hourEventEnd').val();
			$(this).find('.hour_to').text("0"+hourEndBD);
			var rangeDoneBD = $(this).find('.range_done').val();
			$(this).find('.distance_actual').text(rangeDoneBD+"Km");
			var expenseBD = $(this).find('.expense_amount').val();
			$(this).find('.amount_expense').text(expenseBD);
		});
	}

	/*Start Calcul hour*/
	var hourTotal = 0;
	var diffHour = 0;
	var totalNet1 = 0;
	var total = 0;
	var distance_total = 0;
	var amount_total = 0;
	var expense_total = 0;
	$(document).find('.hour_facture_content').find('.content_table').each(function(){

		var distance_default = $('.default_distance').text();
		var defaultSplit = distance_default.split("$");
		var distance_actual = $(this).find('.distance_actual').text();
		var actualSplit = distance_actual.split('K');
		var total_actual = parseInt(defaultSplit[0])*parseInt(actualSplit[0]);
		
		$(this).find('.amount_actual').text(total_actual+"$");

		
		if (actualSplit[0]!="") {
			distance_total += parseInt(actualSplit[0]);
		    $(this).siblings('.sub_total').find('.distance_total').text(distance_total+"Km");
		}

		
		var amount = $(this).find('.amount_actual').text();
		var amountSplit = amount.split("$");
		if (amountSplit[0]!="") {
			amount_total += parseInt(amountSplit[0]);
		    $(this).siblings('.sub_total').find('.amount_total').text(amount_total+"$");
		}

		var expense = $(this).find('.amount_expense').text();
			if (expense != "") {
				expense_total += parseInt(expense);
		    	$(this).siblings('.sub_total').find('.expense_total').text(expense_total+" $");
			}


		var hourFrom = $(this).find('.hour_from').text();
		var hourTo = $(this).find('.hour_to').text();
		diffHour = parseInt(hourTo) - parseInt(hourFrom); 
		hourTotal += diffHour;
		var tauxHour = $(this).find('.hourly_rate').text();
		var tauxHourSplit = tauxHour.split("$");
		var salHourNet = parseInt(diffHour)*parseInt(tauxHourSplit[0]);
	    $(this).siblings('.sub_total').find('.total_hour').text(hourTotal+" /hr");
	    var distanceSum = $(this).find('.amount_actual').text();
		var distSumSplit = distanceSum.split('$');
		var depenses = $(this).find('.amount_expense').text();
		total = parseInt(salHourNet) + parseInt(distSumSplit[0])+parseInt(depenses);
		$(this).find('.remuneration1').text(total+" $");
	    var total2 = $(this).find('.remuneration1').text();
		var total2Split = total2.split("$");
		totalNet1 += parseInt(total2Split[0]);
		$(this).siblings('.sub_total').find('.total_net1').text(totalNet1+" $");
		var distanceSom = $(this).find('.distance_actual').text();
		var distanceSomSplit = distanceSom.split("K");
		var expensive = $(this).find('.amount_expense').text();
		$(this).find('.hourEventStart').val(hourFrom);
		$(this).find('.hourEventEnd').val(hourTo);
		$(this).find('.range_done').val(parseInt(distanceSomSplit[0]));
		$(this).find('.expense_amount').val(expensive);
		$(this).find('.remunerations').val(parseInt(total2Split[0]));
	});
	var totalNet2 = 0;
	$(document).find('.hour_facture_content').find('.sub_total').each(function(){
		var totalPerDiem = $(this).find('.total_per_diem').text();
		var total_per_diemSplit = totalPerDiem.split("$");
		var totalDistance = $(this).find('.amount_total').text();
		var totalDistanceSplit = totalDistance.split("$");
		var totalDepense = $(this).find('.expense_total').text();
		var totalDepenseSplit = totalDepense.split("$");
		var totalNets = $(this).find('.total_net1').text();
		var totalNetsSplit = totalNets.split("$");
		totalNet2 = parseInt(total_per_diemSplit[0])+parseInt(totalDistanceSplit[0])+parseInt(totalDepenseSplit[0])+parseInt(totalNetsSplit[0]);
		$(this).closest('.sub_total').find('.total_net').text(totalNet2+" $");
		$(this).find('.net_total').val(totalNet2);
	});

	
	/*End Calcul hour*/
	$(document).on('keyup', '.hour_facture_content .hour_from', function(){
		hourTotal = 0;
		total = 0;
		totalNet1 = 0;
		var hourFromLast = $(this).siblings('.dateStart').val();
		var hourFromCalc = $(this).text();
		if (parseInt(hourFromCalc) < parseInt(hourFromLast) && parseInt(hourFromCalc) != 0) {
			toastr.error("L'heure minimum est "+hourFromLast);
			$(this).text(hourFromLast);
		}else{
			var hourToCalc = $(this).closest('.performed_hour').find('.hour_to').text();
			var hourDiff = parseInt(hourToCalc) - parseInt(hourFromCalc);
			var taux = $(this).closest('.content_table').find('.hourly_rate').text();
			var tauxSplit = taux.split("$");
			var salNet = parseInt(hourDiff)*parseInt(tauxSplit[0]);
			var distanceSomme = $(this).closest('.content_table').find('.amount_actual').text();
			var distSommeSplit = distanceSomme.split('$');
			var depense = $(this).closest('.content_table').find('.amount_expense').text();
			total = parseInt(salNet) + parseInt(distSommeSplit[0])+parseInt(depense);
			$(this).closest('.content_table').find('.remuneration1').text(total+" $");

			$(document).find('.hour_facture_content').find('.content_table').each(function(){
				var hourFrom = $(this).find('.hour_from').text();
				var hourTo = $(this).find('.hour_to').text();
				diffHour = parseInt(hourTo) - parseInt(hourFrom); 
				hourTotal += diffHour;
			    $(this).siblings('.sub_total').find('.total_hour').text(hourTotal+" /hr");
			    var total2 = $(this).find('.remuneration1').text();
				var total2Split = total2.split("$");
				totalNet1 += parseInt(total2Split[0]);
				$(this).siblings('.sub_total').find('.total_net1').text(totalNet1+" $");
				var distanceSom = $(this).find('.distance_actual').text();
				var distanceSomSplit = distanceSom.split("K");
				var expensive = $(this).find('.amount_expense').text();
				$(this).find('.hourEventStart').val(hourFrom);
				$(this).find('.hourEventEnd').val(hourTo);
				$(this).find('.range_done').val(parseInt(distanceSomSplit[0]));
				$(this).find('.expense_amount').val(expensive);
				$(this).find('.remunerations').val(parseInt(total2Split[0]));
			});
			var totalNet2 = 0;
			$(document).find('.hour_facture_content').find('.sub_total').each(function(){
				var totalPerDiem = $(this).find('.total_per_diem').text();
				var total_per_diemSplit = totalPerDiem.split("$");
				var totalDistance = $(this).find('.amount_total').text();
				var totalDistanceSplit = totalDistance.split("$");
				var totalDepense = $(this).find('.expense_total').text();
				var totalDepenseSplit = totalDepense.split("$");
				var totalNets = $(this).find('.total_net1').text();
				var totalNetsSplit = totalNets.split("$");
				totalNet2 = parseInt(total_per_diemSplit[0])+parseInt(totalDistanceSplit[0])+parseInt(totalDepenseSplit[0])+parseInt(totalNetsSplit[0]);
				$(this).closest('.sub_total').find('.total_net').text(totalNet2+" $");
				$(this).find('.net_total').val(totalNet2);
			});
		}
	});
	$(document).on('keyup', '.hour_facture_content .hour_to', function(){
		hourTotal = 0;
		var total = 0;
		totalNet1 = 0;
		var hourToLast = $(this).siblings('.dateEnd').val();
		var hourToCalc = $(this).text();
		if (parseInt(hourToCalc) > parseInt(hourToLast) && parseInt(hourFromCalc) != 0) {
			toastr.error("L'heure maximum est "+hourToLast);
			$(this).text(hourToLast);
		}else{
			var hourFromCalc = $(this).closest('.performed_hour').find('.hour_from').text();
			var hourDiff = parseInt(hourToCalc) - parseInt(hourFromCalc);
			var taux = $(this).closest('.content_table').find('.hourly_rate').text();
			var tauxSplit = taux.split("$");
			var salNet = parseInt(hourDiff)*parseInt(tauxSplit[0]);
			var distanceSomme = $(this).closest('.content_table').find('.amount_actual').text();
			var distSommeSplit = distanceSomme.split('$');
			var depense = $(this).closest('.content_table').find('.amount_expense').text();
			total = parseInt(salNet) + parseInt(distSommeSplit[0])+parseInt(depense);
			$(this).closest('.content_table').find('.remuneration1').text(total+" $");

			$(document).find('.hour_facture_content').find('.content_table').each(function(){
				var hourFrom = $(this).find('.hour_from').text();
				var hourTo = $(this).find('.hour_to').text();
				diffHour = parseInt(hourTo) - parseInt(hourFromCalc); 
				hourTotal += diffHour;
			    $(this).siblings('.sub_total').find('.total_hour').text(hourTotal+" /hr");
			    var total2 = $(this).find('.remuneration1').text();
				var total2Split = total2.split("$");
				totalNet1 += parseInt(total2Split[0]);
				$(this).siblings('.sub_total').find('.total_net1').text(totalNet1+" $");
				var distanceSom = $(this).find('.distance_actual').text();
				var distanceSomSplit = distanceSom.split("K");
				var expensive = $(this).find('.amount_expense').text();
				$(this).find('.hourEventStart').val(hourFrom);
				$(this).find('.hourEventEnd').val(hourTo);
				$(this).find('.range_done').val(parseInt(distanceSomSplit[0]));
				$(this).find('.expense_amount').val(expensive);
				$(this).find('.remunerations').val(parseInt(total2Split[0]));
			});
			var totalNet2 = 0;
			$(document).find('.hour_facture_content').find('.sub_total').each(function(){
				var totalPerDiem = $(this).find('.total_per_diem').text();
				var total_per_diemSplit = totalPerDiem.split("$");
				var totalDistance = $(this).find('.amount_total').text();
				var totalDistanceSplit = totalDistance.split("$");
				var totalDepense = $(this).find('.expense_total').text();
				var totalDepenseSplit = totalDepense.split("$");
				var totalNets = $(this).find('.total_net1').text();
				var totalNetsSplit = totalNets.split("$");
				totalNet2 = parseInt(total_per_diemSplit[0])+parseInt(totalDistanceSplit[0])+parseInt(totalDepenseSplit[0])+parseInt(totalNetsSplit[0]);
				$(this).closest('.sub_total').find('.total_net').text(totalNet2+" $");
				$(this).find('.net_total').val(totalNet2);
			});
		}
		
	});

	$(document).on('keyup', '.hour_facture_content .distance_actual', function(){

		var total = 0;
		var hourFromCalc = $(this).closest('.content_table').find('.hour_from').text();
		var hourToCalc = $(this).closest('.content_table').find('.hour_to').text();
		var hourDiff = parseInt(hourToCalc) - parseInt(hourFromCalc);
		var taux = $(this).closest('.content_table').find('.hourly_rate').text();
		var tauxSplit = taux.split("$");
		var salNet = parseInt(hourDiff)*parseInt(tauxSplit[0]);
		var distanceSomme = $(this).closest('.content_table').find('.amount_actual').text();
		var distSommeSplit = distanceSomme.split('$');
		var depense = $(this).closest('.content_table').find('.amount_expense').text();
		total = parseInt(salNet) + parseInt(distSommeSplit[0])+parseInt(depense);
		$(this).closest('.content_table').find('.remuneration1').text(total+" $");

		var distance_default = $('.default_distance').text();
		var defaultSplit = distance_default.split("$");
		var distance_actual = $(this).text();
		var actualSplit = distance_actual.split('k');
		var total_actual = parseInt(defaultSplit[0])*parseInt(actualSplit[0]);
		if ($(this).text()=="Km") {
			$(this).siblings('.amount_actual').text(0+"$");
		}else{
			$(this).siblings('.amount_actual').text(total_actual+"$");
		}
		var distance_total = 0;
		$(document).find('.hour_facture_content').find('.content_table').each(function(){
			var distance = $(this).find('.distance_actual').text();
			var distanceSplit = distance.split("K");
			if (distanceSplit[0]!="") {
				distance_total += parseInt(distanceSplit[0]);
			    $(this).siblings('.sub_total').find('.distance_total').text(distance_total+"Km");
			}
		});
		var amount_total = 0;
		totalNet1 = 0;
		$(document).find('.hour_facture_content').find('.content_table').each(function(){
			var amount = $(this).find('.amount_actual').text();
			var amountSplit = amount.split("$");
			if (amountSplit[0]!="") {
				amount_total += parseInt(amountSplit[0]);
			    $(this).siblings('.sub_total').find('.amount_total').text(amount_total+"$");
			}
			var total2 = $(this).find('.remuneration1').text();
			var total2Split = total2.split("$");
			totalNet1 += parseInt(total2Split[0]);
			$(this).siblings('.sub_total').find('.total_net1').text(totalNet1+" $");
			var hourFrom = $(this).find('.hour_from').text();
			var hourTo = $(this).find('.hour_to').text();
			var distanceSom = $(this).find('.distance_actual').text();
			var distanceSomSplit = distanceSom.split("K");
			var expensive = $(this).find('.amount_expense').text();
			$(this).find('.hourEventStart').val(hourFrom);
			$(this).find('.hourEventEnd').val(hourTo);
			$(this).find('.range_done').val(parseInt(distanceSomSplit[0]));
			$(this).find('.expense_amount').val(expensive);
			$(this).find('.remunerations').val(parseInt(total2Split[0]));
		});
		var totalNet2 = 0;
		$(document).find('.hour_facture_content').find('.sub_total').each(function(){
			var totalPerDiem = $(this).find('.total_per_diem').text();
			var total_per_diemSplit = totalPerDiem.split("$");
			var totalDistance = $(this).find('.amount_total').text();
			var totalDistanceSplit = totalDistance.split("$");
			var totalDepense = $(this).find('.expense_total').text();
			var totalDepenseSplit = totalDepense.split("$");
			var totalNets = $(this).find('.total_net1').text();
			var totalNetsSplit = totalNets.split("$");
			totalNet2 = parseInt(total_per_diemSplit[0])+parseInt(totalDistanceSplit[0])+parseInt(totalDepenseSplit[0])+parseInt(totalNetsSplit[0]);
			$(this).closest('.sub_total').find('.total_net').text(totalNet2+" $");
			$(this).find('.net_total').val(totalNet2);
		});
	});
	$(document).on('keyup', '.hour_facture_content .amount_expense', function(){

		var total = 0;
		var hourFromCalc = $(this).closest('.content_table').find('.hour_from').text();
		var hourToCalc = $(this).closest('.content_table').find('.hour_to').text();
		var hourDiff = parseInt(hourToCalc) - parseInt(hourFromCalc);
		var taux = $(this).closest('.content_table').find('.hourly_rate').text();
		var tauxSplit = taux.split("$");
		var salNet = parseInt(hourDiff)*parseInt(tauxSplit[0]);
		var distanceSomme = $(this).closest('.content_table').find('.amount_actual').text();
		var distSommeSplit = distanceSomme.split('$');
		var depense = $(this).text();
		total = parseInt(salNet) + parseInt(distSommeSplit[0])+parseInt(depense);
		$(this).closest('.content_table').find('.remuneration1').text(total+" $");

		var expense_total = 0;
		totalNet1 = 0;
		$(document).find('.hour_facture_content').find('.content_table').each(function(){
			var expense = $(this).find('.amount_expense').text();
			if (expense != "") {
				expense_total += parseInt(expense);
		    	$(this).siblings('.sub_total').find('.expense_total').text(expense_total+" $");
			}
			var total2 = $(this).find('.remuneration1').text();
			var total2Split = total2.split("$");
			totalNet1 += parseInt(total2Split[0]);
			$(this).siblings('.sub_total').find('.total_net1').text(totalNet1+" $");
			var hourFrom = $(this).find('.hour_from').text();
			var hourTo = $(this).find('.hour_to').text();
			var distanceSom = $(this).find('.distance_actual').text();
			var distanceSomSplit = distanceSom.split("K");
			var expensive = $(this).find('.amount_expense').text();
			$(this).find('.hourEventStart').val(hourFrom);
			$(this).find('.hourEventEnd').val(hourTo);
			$(this).find('.range_done').val(parseInt(distanceSomSplit[0]));
			$(this).find('.expense_amount').val(expensive);
			$(this).find('.remunerations').val(parseInt(total2Split[0]));
		});
		var totalNet2 = 0;
		$(document).find('.hour_facture_content').find('.sub_total').each(function(){
			var totalPerDiem = $(this).find('.total_per_diem').text();
			var total_per_diemSplit = totalPerDiem.split("$");
			var totalDistance = $(this).find('.amount_total').text();
			var totalDistanceSplit = totalDistance.split("$");
			var totalDepense = $(this).find('.expense_total').text();
			var totalDepenseSplit = totalDepense.split("$");
			var totalNets = $(this).find('.total_net1').text();
			var totalNetsSplit = totalNets.split("$");
			totalNet2 = parseInt(total_per_diemSplit[0])+parseInt(totalDistanceSplit[0])+parseInt(totalDepenseSplit[0])+parseInt(totalNetsSplit[0]);
			$(this).closest('.sub_total').find('.total_net').text(totalNet2+" $");
			$(this).find('.net_total').val(totalNet2);
		});

	});
	$(document).on('keyup', '.hour_facture_content .information', function(){
		var info = $(this).text();
		$('.additional_info').val(info);
	});

	$(document).on('click', '.hour_facture_content .show_my_bill', function(){
		if($('.idFacture').val() == ""){
			toastr.warning('Veuillez valider votre facture d\'abord SVP');
		}else{
			launch_modal('show_my_bill');

			var idEventStaff = $(this).closest('.hour_facture_content').find('.idEventStaff').val();
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

	$(document).on('click', '.hour_facture_content .right button', function(event){
		event.preventDefault();
		console.log('je passe');
		var formData = new FormData($("#regFormFacture")[0]);
		var url = $(this).attr('data-stored');
		$.ajax({
            url: url,
            type : 'POST',
            /*dataType: 'JSON',*/
            data: formData,
            processData: false,
			contentType: false,
            success: function(response) {
                toastr.success('Validation de facture réussi avec succès');
                $('.hour_facture_content').find('.content_table').each(function(i , element){
                		$(element).find('.idFacture').val(response['invoicieIds'][i]);                	
                });
            },
            error: function(response, statut, erreur){
                console.log("Applying modification error (Ajax) with : " + erreur);
            }
        });
	});

	$(document).on('click', '#show_my_bill .download_bill', function(){
		var pdfdoc = new jsPDF();
		pdfdoc.internal.scaleFactor = 1;
        pdfdoc.addHTML($('#show_my_bill .modal_body'), function() {
			pdfdoc.save('First.pdf');
		});
	});
});