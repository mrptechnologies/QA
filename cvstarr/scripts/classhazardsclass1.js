
/* This script is used to hide the data elemennt depending on the value seleced */

/* this is used to hide the entire row when 'No' selected in all three classes (trave_24hour field)*/
function checkallthreearechecked_travel_24hour(){
	if(document.getElementById("travel_24hour_class1_Y").checked==false){
		document.getElementById("row1").style.display='none';	
		document.getElementById("row2").style.display='none';	
		document.getElementById("row3").style.display='none';	
		document.getElementById("row4").style.display='none';	
		document.getElementById("row5").style.display='none';	
	}
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (trave_24hour field)*/
function displaylabels_travel_24hour(){
	document.getElementById("row1").style.display='';	
	document.getElementById("row2").style.display='';	
	document.getElementById("row3").style.display='';	
	document.getElementById("row4").style.display='';	
	document.getElementById("row5").style.display='';	
}

/* this is used to show the class1 column (trave_24hour field)*/
function display_travel_tour_24_class1(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_travel_24hour();
		document.getElementById("specified_trip_class1").style.display='none';
		document.getElementById("type_of_loss_injury_class1").style.display='none';
		document.getElementById("type_of_travel_class1").style.display='none';
		document.getElementById("place_of_travel_class1").style.display='none';
		document.getElementById("length_of_stay_class1").style.display='none';
		document.getElementById("travelType").style.display='none';
		document.getElementById("subrow2").style.display='none';
		
		
	}
	else{
		displaylabels_travel_24hour();
		document.getElementById("specified_trip_class1").style.display='inline';
		document.getElementById("travelType").style.display='inline';
		document.getElementById("subrow2").style.display='inline';
		document.getElementById("type_of_loss_injury_class1").style.display='inline';
		document.getElementById("type_of_travel_class1").style.display='inline';
		document.getElementById("place_of_travel_class1").style.display='inline';
		document.getElementById("length_of_stay_class1").style.display='inline';
	}
}


/* this is used to hide the entire row when 'No' selected in all three classes (private_passenger field)*/
function checkallthreearechecked_private_passenger(){
		if(document.getElementById("private_passenger_automobile_class1_Y").checked==false){
			document.getElementById("type_of_travel_private").style.display='none';	
		}	
	}

/* this is used to show the entire row when 'yes' selected in all three classes (private_passenger field)*/
	function displaylabels_private_passenger(){
		document.getElementById("type_of_travel_private").style.display='';	
		document.getElementById("type_of_travel_private_passenger").style.display='';	
	}
	
/* this is used to show the class1 column (private_passenger field)*/
function display_private_passenger_class1(obj){
		if(obj.value=="private_passenger_automobile_class1_N"){
			checkallthreearechecked_private_passenger();
			document.getElementById("type_of_travel_private_class1").style.display='none';
		}
		else{
			displaylabels_private_passenger();
			document.getElementById("type_of_travel_private_class1").style.display='inline';
		}
}

	
	
	
/* this is used to hide the entire row when 'No' selected in all three classes (sponsered field)*/
		function checkallthreearechecked_sponsered(){
		if(document.getElementById("sponsered_activities_class1_Y").checked==false){
			document.getElementById("include_travel").style.display='none';	
			document.getElementById("licensed").style.display='none';	
			document.getElementById("travel_time").style.display='none';	
		}	
	}
/* this is used to show the entire row when 'yes' selected in all three classes (sponsered field)*/
	function displaylabels_sponsered(){
		document.getElementById("include_travel_coverage").style.display='';	
		document.getElementById("include_travel").style.display='';	
	}
/* this is used to show the class1 column (sponsered field)*/
	function display_sponsered_activities_class1(obj){
		if(obj.value=="sponsered_activities_class1_N"){
			checkallthreearechecked_sponsered();
			document.getElementById("include_travel_coverage_class1").style.display='none';
			document.getElementById("licensed_driver_class1").style.display='none';
			document.getElementById("travel_time_maximum_txt_class1").style.display='none';
		}
		else{
			displaylabels_sponsered();
			document.getElementById("include_travel_coverage_class1_N").checked=true;
			document.getElementById("include_travel_coverage_class1_Y").checked=false;
			document.getElementById("include_travel_coverage_class1").style.display='inline';
		}
	}

	
/* this is used to hide the entire row when 'No' selected in all three classes (include_travel field)*/
	function checkallthreearechecked_include_travel(){
		if(document.getElementById("include_travel_coverage_class1_Y").checked==false){
			document.getElementById("licensed").style.display='none';
			document.getElementById("travel_time").style.display='none';
		}	
	}
/* this is used to show the entire row when 'yes' selected in all three classes (include_travel field)*/
	function displaylabels_include(){
		document.getElementById("licensed_driver").style.display='';	
		document.getElementById("licensed").style.display='';	
		document.getElementById("travel_time_maximum").style.display='';
		document.getElementById("travel_time").style.display='';
	}
/* this is used to show the class1 column (include_travel field)*/
	function display_include_travel_class1(obj){
		if(obj.value=="include_travel_coverage_class1_N"){
			checkallthreearechecked_include_travel();
			document.getElementById("licensed_driver_class1").style.display='none';
			document.getElementById("travel_time_maximum_txt_class1").style.display='none';
		}
		else{
			displaylabels_include();
			document.getElementById("licensed_driver_class1").style.display='inline';
			document.getElementById("travel_time_maximum_txt_class1").style.display='inline';
		}
	}


/* Own_Aircraft */

	function displaylabels_ownaircraft_yes(){
		document.getElementById("Own_TypeofTravel_Label").style.display='inline';	
		document.getElementById("Own_TypeofTravel_Row").style.display='';
	}
	
	function displaylabels_ownaircraft_no(){
		document.getElementById("AirCraft_explicitly_not_covered_Label").style.display='inline';	
		document.getElementById("AirCraft_explicitly_not_covered_Row").style.display='';
	}
	
	
	function checkallthreearechecked_ownaircraft(){
		if(document.getElementById("Own_AirCraft_class1_Y").checked==false){
			document.getElementById("Own_TypeofTravel_Row").style.display='none';	
			document.getElementById("AirCraft_explicitly_not_covered_Row").style.display='inline';
		}else if(document.getElementById("Own_AirCraft_class1_N").checked==false){
			document.getElementById("AirCraft_explicitly_not_covered_Row").style.display='none';	
			document.getElementById("Own_TypeofTravel_Row").style.display='inline';	
		}
			
	}
	
	function display_aircraft_typeoftravel_class1(obj){
		if(obj.value=="Own_AirCraft_class1_N"){
			checkallthreearechecked_ownaircraft();
			displaylabels_ownaircraft_no();
			document.getElementById("Own_TypeofTravel_class1").style.display='none';
			document.getElementById("AirCraft_explicitly_not_covered_class1").style.display='inline';
		}
		else if(obj.value=="Own_AirCraft_class1_Y"){
			checkallthreearechecked_ownaircraft();
			displaylabels_ownaircraft_yes();
			document.getElementById("Own_TypeofTravel_class1").style.display='inline';
			document.getElementById("AirCraft_explicitly_not_covered_class1").style.display='none';
		}
	}
	

	
	
/*display Pilot*/
	function displaylabels_pilot(){
		document.getElementById("Include_Crew_Members_Label").style.display='inline';	
		document.getElementById("Include_Crew_Members_Row").style.display='';
		document.getElementById("Policyholder_Authorization_Trip_Label").style.display='inline';
		document.getElementById("Policyholder_Authorization_Trip_Row").style.display='';
		document.getElementById("Pilot_TypeofTravel_Row").style.display='';
		document.getElementById("Pilot_TypeofTravel_Label").style.display='inline';
	}
	
	function checkallthreearechecked_pilot(){
		if(document.getElementById("Pilot_Class1_Y").checked==false){
			document.getElementById("Include_Crew_Members_Row").style.display='none';	
			document.getElementById("Policyholder_Authorization_Trip_Row").style.display='none';
			document.getElementById("Pilot_TypeofTravel_Row").style.display='none';
		}	
	}
	
	function display_pilot_class1(obj){
		if(obj.value=="Pilot_Class1_N"){
			checkallthreearechecked_pilot();
			document.getElementById("Include_Crew_Members_Class1").style.display='none';
			document.getElementById("Policyholder_Authorization_Trip_class1").style.display='none';
			document.getElementById("Pilot_TypeofTravel_class1").style.display='none';
		}
		else if(obj.value=="Pilot_Class1_Y"){
			displaylabels_pilot();
			document.getElementById("Include_Crew_Members_Class1").style.display='inline';
			document.getElementById("Policyholder_Authorization_Trip_class1").style.display='inline';
			document.getElementById("Pilot_TypeofTravel_class1").style.display='inline';

		}
	}
	

/*display Scheduled Type of Travel*/
	function displaylabels_scheduled(){
		document.getElementById("Scheduled_TypeofTravel_Label").style.display='inline';	
		document.getElementById("Scheduled_TypeofTravel_Row").style.display='';
	}
	
	function checkallthreearechecked_scheduled(){
		if(document.getElementById("Scheduled_Class1_Y").checked==false){
			document.getElementById("Scheduled_TypeofTravel_Row").style.display='none';	
			document.getElementById("Scheduled_TypeofTravel_Label").style.display='none';
		}	
	}
	
	function display_Scheduled_Airlines_Class1(obj){
		if(obj.value=="Scheduled_Class1_N"){
			checkallthreearechecked_scheduled();
			document.getElementById("Scheduled_TypeofTravel_Class1").style.display='none';
		}
		else if(obj.value=="Scheduled_Class1_Y"){
			displaylabels_scheduled();
			document.getElementById("Scheduled_TypeofTravel_Class1").style.display='inline';
		}
	}
	

/*display Air Craft Restriction*/
	function displaylabels_aricraft_restrictions(){
		document.getElementById("Riding_As_Passenger_Label").style.display='inline';	
		document.getElementById("Riding_As_Passenger_Row").style.display='';
		document.getElementById("Aircraft_Has_Valid_Certificate_Label").style.display='inline';	
		document.getElementById("Aircraft_Has_Valid_Certificate_Row").style.display='';
		document.getElementById("Aircraft_Flown_By_Pilot_Label").style.display='inline';	
		document.getElementById("Aircraft_Flown_By_Pilot_Row").style.display='';
		document.getElementById("Aircraft_Not_Being_Used_For_Label").style.display='inline';	
		document.getElementById("Aircraft_Not_Being_Used_For_Row").style.display='';
		document.getElementById("A_Military_Aircraft_Label").style.display='inline';	
		document.getElementById("A_Military_Aircraft_Row").style.display='';
		document.getElementById("A_Military_Aircraft_Row_Space").style.display='';
		document.getElementById("Aircraft_Not_Being_Used_For_Row_Space").style.display='';
		document.getElementById("Aircraft_Flown_By_Pilot_Row_Space").style.display='';	
		document.getElementById("Aircraft_Has_Valid_Certificate_Row_Space").style.display='';				
	}
	
	function checkallthreearechecked_aircraft_restrictions(){
		if(document.getElementById("Aircraft_Restrictions_Class1_Y").checked==false){
			document.getElementById("Riding_As_Passenger_Row").style.display='none';
			document.getElementById("Aircraft_Has_Valid_Certificate_Row").style.display='none';
			document.getElementById("Aircraft_Flown_By_Pilot_Row").style.display='none';
			document.getElementById("Aircraft_Not_Being_Used_For_Row").style.display='none';
			document.getElementById("A_Military_Aircraft_Row").style.display='none';
			document.getElementById("A_Military_Aircraft_Row_Space").style.display='none';
			document.getElementById("Aircraft_Not_Being_Used_For_Row_Space").style.display='none';
			document.getElementById("Aircraft_Flown_By_Pilot_Row_Space").style.display='none';	
			document.getElementById("Aircraft_Has_Valid_Certificate_Row_Space").style.display='none';
		}	
	}
	
	function display_Aircraft_Restrictions_Class1(obj){
		if(obj.value=="Aircraft_Restrictions_Class1_N"){
			checkallthreearechecked_aircraft_restrictions();
			document.getElementById("Riding_As_Passenger_Class1").style.display='none';
			document.getElementById("Aircraft_Has_Valid_Certificate_Class1").style.display='none';
			document.getElementById("Aircraft_Flown_By_Pilot_Class1").style.display='none';
			document.getElementById("Aircraft_Not_Being_Used_For_Class1").style.display='none';
			document.getElementById("A_Military_Aircraft_Class1").style.display='none';
		}
		else if(obj.value=="Aircraft_Restrictions_Class1_Y"){
			displaylabels_aricraft_restrictions();
			document.getElementById("Riding_As_Passenger_Class1").style.display='inline';
			document.getElementById("Aircraft_Has_Valid_Certificate_Class1").style.display='inline';
			document.getElementById("Aircraft_Flown_By_Pilot_Class1").style.display='inline';
			document.getElementById("Aircraft_Not_Being_Used_For_Class1").style.display='inline';
			document.getElementById("A_Military_Aircraft_Class1").style.display='inline';
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

function displayOccupational1(obj){   
	if(obj.value=="full_occupational_class1_Y" && document.getElementById("travel_24hour_class1_Y").checked){
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