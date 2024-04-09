/* This script is used to hide the data elemennt depending on the value seleced */

/* this is used to hide the entire row when 'No' selected in all three classes (trave_24hour field)*/
function checkallthreearechecked_travel_24hour_class2(){
		document.getElementById("class2_row1").style.display='none';	
		document.getElementById("class2_row2").style.display='none';	
		document.getElementById("class2_row3").style.display='none';	
		document.getElementById("class2_row4").style.display='none';	
		document.getElementById("class2_row5").style.display='none';		
}

/* this is used to show the entire row when 'yes' selected in all three classes (trave_24hour field)*/
function displaylabels_travel_24hour_class2(){
	document.getElementById("class2_row1").style.display='';	
	document.getElementById("class2_row2").style.display='';	
	document.getElementById("class2_row3").style.display='';	
	document.getElementById("class2_row4").style.display='';	
	document.getElementById("class2_row5").style.display='';	
}

/* this is used to show the class2 column (trave_24hour field)*/
function display_travel_tour_24_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_travel_24hour_class2();		
		document.getElementById("specified_trip_class2").style.display='none';
		document.getElementById("type_of_loss_injury_class2").style.display='none';
		document.getElementById("type_of_travel_class2").style.display='none';
		document.getElementById("place_of_travel_class2").style.display='none';
		document.getElementById("length_of_stay_class2").style.display='none';
		document.getElementById("travelType").style.display='none';
		document.getElementById("subrow2").style.display='none';
	}
	else{
		displaylabels_travel_24hour_class2();
		document.getElementById("specified_trip_class2").style.display='inline';
		document.getElementById("type_of_loss_injury_class2").style.display='inline';
		document.getElementById("type_of_travel_class2").style.display='inline';
		document.getElementById("place_of_travel_class2").style.display='inline';
		document.getElementById("length_of_stay_class2").style.display='inline';
		document.getElementById("travelType").style.display='inline';
		document.getElementById("subrow2").style.display='inline';
	}
}

function display_private_passenger_class2(obj){
		if(obj.value=="private_passenger_automobile_class2_N"){
			document.getElementById("type_of_travel_private_class2row").style.display='none';
			document.getElementById("type_of_travel_private_class2").style.display='none';
		}
		else{
			document.getElementById("type_of_travel_private_class2row").style.display='inline';	
			document.getElementById("type_of_travel_private_class2").style.display='inline';
		}
}
	
/* this is used to hide the entire row when 'No' selected in all three classes (sponsered field)*/
		function checkallthreearechecked_sponsered_class2(){
			document.getElementById("include_travel_class2row").style.display='none';	
			document.getElementById("licensed_class2row").style.display='none';	
			document.getElementById("travel_time_class2row").style.display='none';	
	}
/* this is used to show the entire row when 'yes' selected in all three classes (sponsered field)*/
	function displaylabels_sponsered_class2(){
		document.getElementById("include_travel_class2row").style.display='';		
	}

/* this is used to show the class2 column (sponsered field)*/
	function display_sponsered_activities_class2(obj){
		if(obj.value=="sponsered_activities_class2_N"){
			checkallthreearechecked_sponsered_class2();
			document.getElementById("include_travel_coverage_class2").style.display='none';
			document.getElementById("licensed_driver_class2").style.display='none';
			document.getElementById("travel_time_maximum_txt_class2").style.display='none';
		}
		else{
			displaylabels_sponsered_class2();
			document.getElementById("include_travel_coverage_class2_N").checked=true;
			document.getElementById("include_travel_coverage_class2_Y").checked=false;
			document.getElementById("include_travel_coverage_class2").style.display='inline';
		}
	}

	
/* this is used to hide the entire row when 'No' selected in all three classes (include_travel field)*/
	function checkallthreearechecked_include_travel_class2(){
			document.getElementById("licensed_class2row").style.display='none';
			document.getElementById("travel_time_class2row").style.display='none';

	}
/* this is used to show the entire row when 'yes' selected in all three classes (include_travel field)*/
	function displaylabels_include_class2(){
		document.getElementById("licensed_class2row").style.display='';	
		document.getElementById("travel_time_class2row").style.display='';	
	}

/* this is used to show the class2 column (include_travel field)*/
	function display_include_travel_class2(obj){
		if(obj.value=="include_travel_coverage_class2_N"){
			checkallthreearechecked_include_travel_class2();
			document.getElementById("licensed_driver_class2").style.display='none';
			document.getElementById("travel_time_maximum_txt_class2").style.display='none';
		}
		else{
			displaylabels_include_class2();
			document.getElementById("licensed_driver_class2").style.display='inline';
			document.getElementById("travel_time_maximum_txt_class2").style.display='inline';
		}
	}


/* Own_Aircraft */

	function displaylabels_ownaircraft_yes_class2(){
		document.getElementById("Own_TypeofTravel_class2Row").style.display='';
	}
	
	function displaylabels_ownaircraft_no_class2(){
		document.getElementById("AirCraft_explicitly_not_covered_class2Row").style.display='';
	}
	
	
	function checkallthreearechecked_ownaircraft_class2(){
		if(document.getElementById("Own_AirCraft_class2_Y").checked==false){
			document.getElementById("Own_TypeofTravel_class2Row").style.display='none';	
			document.getElementById("AirCraft_explicitly_not_covered_class2Row").style.display='inline';
		}else if(document.getElementById("Own_AirCraft_class2_N").checked==false){
			document.getElementById("AirCraft_explicitly_not_covered_class2Row").style.display='none';	
			document.getElementById("Own_TypeofTravel_class2Row").style.display='inline';	
		}
			
	}
	

	
	function display_aircraft_typeoftravel_class2(obj){
		
		if(obj.value=="Own_AirCraft_class2_N"){
			checkallthreearechecked_ownaircraft_class2();
			displaylabels_ownaircraft_no_class2();
			document.getElementById("Own_TypeofTravel_class2").style.display='none';
			document.getElementById("AirCraft_explicitly_not_covered_class2").style.display='inline';
		}
		else if(obj.value=="Own_AirCraft_class2_Y"){
			checkallthreearechecked_ownaircraft_class2();
			displaylabels_ownaircraft_yes_class2();
			document.getElementById("Own_TypeofTravel_class2").style.display='inline';
			document.getElementById("AirCraft_explicitly_not_covered_class2").style.display='none';
		}
	}
/*display Pilot*/
	function displaylabels_pilot_class2(){	
		document.getElementById("Include_Crew_Members_class2Row").style.display='';
		document.getElementById("Policyholder_Authorization_class2Trip_Row").style.display='';
		document.getElementById("Pilot_TypeofTravel_class2Row").style.display='';
	}
	
	function checkallthreearechecked_pilot_class2(){

			document.getElementById("Include_Crew_Members_class2Row").style.display='none';	
			document.getElementById("Policyholder_Authorization_class2Trip_Row").style.display='none';
			document.getElementById("Pilot_TypeofTravel_class2Row").style.display='none';
	}
	

	
	function display_pilot_class2(obj){
		if(obj.value=="Pilot_Class2_N"){
			checkallthreearechecked_pilot_class2();
			document.getElementById("Include_Crew_Members_Class2").style.display='none';
			document.getElementById("Policyholder_Authorization_Trip_class2").style.display='none';
			document.getElementById("Pilot_TypeofTravel_class2").style.display='none';			
		}
		else if(obj.value=="Pilot_Class2_Y"){
			displaylabels_pilot_class2();
			document.getElementById("Include_Crew_Members_Class2").style.display='inline';
			document.getElementById("Policyholder_Authorization_Trip_class2").style.display='inline';
			document.getElementById("Pilot_TypeofTravel_class2").style.display='inline';
		}
	}

/*display Scheduled Type of Travel*/
	function displaylabels_scheduled_class2(){
		document.getElementById("Scheduled_TypeofTravel_class2Row").style.display='';
	}
	
	function checkallthreearechecked_scheduled_class2(){
			document.getElementById("Scheduled_TypeofTravel_class2Row").style.display='none';	
	}
	
	function display_Scheduled_Airlines_Class2(obj){
		if(obj.value=="Scheduled_Class2_N"){
			checkallthreearechecked_scheduled_class2();
			document.getElementById("Scheduled_TypeofTravel_Class2").style.display='none';
		}
		else if(obj.value=="Scheduled_Class2_Y"){
			displaylabels_scheduled_class2();
			document.getElementById("Scheduled_TypeofTravel_Class2").style.display='inline';
		}
	}

/*display Air Craft Restriction*/
	function displaylabels_aricraft_restrictions_class2(){
		document.getElementById("Riding_As_Passenger_class2Row").style.display='';
		document.getElementById("Aircraft_Has_Valid_Certificate_class2Row").style.display='';
		document.getElementById("Aircraft_Flown_By_Pilot_class2Row").style.display='';
		document.getElementById("Aircraft_Not_Being_Used_For_class2Row").style.display='';
		document.getElementById("A_Military_Aircraft_class2Row").style.display='';
		document.getElementById("A_Military_Aircraft_class2Row_Space").style.display='';
		document.getElementById("Aircraft_Not_Being_Used_For_class2Row_Space").style.display='';
		document.getElementById("Aircraft_Flown_By_Pilot_class2Row_Space").style.display='';	
		document.getElementById("Aircraft_Has_Valid_Certificate_class2Row_Space").style.display='';				
	}
	
	function checkallthreearechecked_aircraft_restrictions_class2(){
			document.getElementById("Riding_As_Passenger_class2Row").style.display='none';
			document.getElementById("Aircraft_Has_Valid_Certificate_class2Row").style.display='none';
			document.getElementById("Aircraft_Flown_By_Pilot_class2Row").style.display='none';
			document.getElementById("Aircraft_Not_Being_Used_For_class2Row").style.display='none';
			document.getElementById("A_Military_Aircraft_class2Row").style.display='none';
			document.getElementById("A_Military_Aircraft_class2Row_Space").style.display='none';
			document.getElementById("Aircraft_Not_Being_Used_For_class2Row_Space").style.display='none';
			document.getElementById("Aircraft_Flown_By_Pilot_class2Row_Space").style.display='none';	
			document.getElementById("Aircraft_Has_Valid_Certificate_class2Row_Space").style.display='none';
	}

	
	function display_Aircraft_Restrictions_Class2(obj){
		if(obj.value=="Aircraft_Restrictions_Class2_N"){
			checkallthreearechecked_aircraft_restrictions_class2();
			document.getElementById("Riding_As_Passenger_Class2").style.display='none';
			document.getElementById("Aircraft_Has_Valid_Certificate_Class2").style.display='none';
			document.getElementById("Aircraft_Flown_By_Pilot_Class2").style.display='none';
			document.getElementById("Aircraft_Not_Being_Used_For_Class2").style.display='none';
			document.getElementById("A_Military_Aircraft_Class2").style.display='none';
		}
		else if(obj.value=="Aircraft_Restrictions_Class2_Y"){
			displaylabels_aricraft_restrictions_class2();
			document.getElementById("Riding_As_Passenger_Class2").style.display='inline';
			document.getElementById("Aircraft_Has_Valid_Certificate_Class2").style.display='inline';
			document.getElementById("Aircraft_Flown_By_Pilot_Class2").style.display='inline';
			document.getElementById("Aircraft_Not_Being_Used_For_Class2").style.display='inline';
			document.getElementById("A_Military_Aircraft_Class2").style.display='inline';
		}
	}

	function displaySpecifiedTrip(obj)
{	
	if(obj.value=="N"){
		document.getElementById("subrow2").style.display='inline';
		document.getElementById("travelType").style.display='inline';
		document.getElementById("subrow1").style.display='none';
		document.getElementById("coverageTripStart").style.display='none';
		
	}
	else{
		document.getElementById("subrow2").style.display='none';
		document.getElementById("travelType").style.display='none';
		document.getElementById("subrow1").style.display='inline';
		document.getElementById("coverageTripStart").style.display='inline';
	}
}

function displayOccupational2(obj){   
	if(obj.value=="full_occupational_class2_Y" && document.getElementById("travel_24hour_class2_Y").checked){
		document.getElementById("occupationRow1").style.display='inline';
		document.getElementById("occupationRow2").style.display='inline';
		document.getElementById("authorizedTrip").style.display='inline';
		document.getElementById("coverageStartofTrip").style.display='inline';
	}
	else{
		document.getElementById("occupationRow1").style.display='none';
		document.getElementById("occupationRow2").style.display='none';
		document.getElementById("authorizedTrip").style.display='none';
		document.getElementById("coverageStartofTrip").style.display='none';
	}
}