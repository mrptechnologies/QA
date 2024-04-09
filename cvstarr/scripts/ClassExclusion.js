function display_repair_or_replacement(obj)
{	
	if(obj.value=="Repair_Replacement_N"){
		document.getElementById("Aritificial_Limbs_Row").style.display='none';
	}else{
		document.getElementById("Aritificial_Limbs_Row").style.display='';
	}
}

function display_Any_Elective_Element(obj)
{	
	if(obj.value=="Any_Elective_Element_N"){
		document.getElementById("Including_Any_Service_Row").style.display='none';
	}else{
		document.getElementById("Including_Any_Service_Row").style.display='';
	}
}

function display_blood(obj)
{	
	if(obj.value=="Blood_N"){
		document.getElementById("Blood_Plasma_Row").style.display='none';
		document.getElementById("Blood_Storage_Row").style.display='none';
	}else{
		document.getElementById("Blood_Plasma_Row").style.display='';
		document.getElementById("Blood_Storage_Row").style.display='';
	}
}

function display_Treatment_By_Persons_or_Retained_PolicyHolder(obj)
{	
	if(obj.value=="Employed_Or_Retained_N"){
		document.getElementById("Treatment_FamilyMember_MemberofCoveredPersons_Row").style.display='none';
	}else{
		document.getElementById("Treatment_FamilyMember_MemberofCoveredPersons_Row").style.display='';
	}
}

function displayFlightBoardingorAlighting(obj)
{	
	if(obj.value=="FlightBoardingorAlighting_N"){
		document.getElementById("Include_Specific_Questions_Row").style.display='none';
		document.getElementById("Fare_Paying_Passenger_Row").style.display='none';
		document.getElementById("Passenger_Non_Scheduled_Row").style.display='none';
		document.getElementById("Passenger_Military_Aircraft").style.display='none';
		document.getElementById("Being_Flown_By_Covered_Person_Row").style.display='none';
		
		document.getElementById("Specific_Activities_Excluded_Row").style.display='none';
		document.getElementById("Ultra_Light_or_Glider_Row").style.display='none';
		document.getElementById("Purpose_of_Parachuting_Row").style.display='none';
		document.getElementById("Used_By_Any_Military_Authority_Row").style.display='none';
		document.getElementById("Designed_For_Flight_Above_Row").style.display='none';
		
		document.getElementById("Crop_Dusting_Row").style.display='none';
		document.getElementById("Spraying_Or_Seeding_Row").style.display='none';
		document.getElementById("Giving_And_Receiving_Flying_Instructions_Row").style.display='none';
		document.getElementById("Fire_Fighting_Row").style.display='none';
		document.getElementById("Sky_Writing_Row").style.display='none';
		document.getElementById("Sky_Diving_or_Hang_Gliding_Row").style.display='none';
		document.getElementById("Pipeline_or_PowerLine_Inspection_Row").style.display='none';
		document.getElementById("Aerial_Photography_or_Exploration_Row").style.display='none';
		document.getElementById("Racing_Row").style.display='none';
		document.getElementById("Endurance_Tests_Row").style.display='none';
		document.getElementById("Stunt_or_Acrobatic_Flying_Row").style.display='none';
		document.getElementById("Special_Permit_From_FAA_Row").style.display='none';
	}else{
		document.getElementById("Include_Specific_Questions_Row").style.display='';
		document.getElementById("Fare_Paying_Passenger_Row").style.display='';
		document.getElementById("Passenger_Non_Scheduled_Row").style.display='';
		document.getElementById("Passenger_Military_Aircraft").style.display='';
		document.getElementById("Being_Flown_By_Covered_Person_Row").style.display='';
		document.getElementById("Specific_Activities_Excluded_Row").style.display='';
		
		document.getElementById("Specific_Activities_Excluded_Row").style.display='';
		document.getElementById("Ultra_Light_or_Glider_Row").style.display='';
		document.getElementById("Purpose_of_Parachuting_Row").style.display='';
		document.getElementById("Used_By_Any_Military_Authority_Row").style.display='';
		document.getElementById("Designed_For_Flight_Above_Row").style.display='';
	}
}

function displayIncludeSpecificQuestions(obj)
{	
	if(obj.value=="IncludeSpecificQuestions_N"){
		document.getElementById("Fare_Paying_Passenger_Row").style.display='none';
		document.getElementById("Passenger_Non_Scheduled_Row").style.display='none';
		document.getElementById("Passenger_Military_Aircraft").style.display='none';
		document.getElementById("Being_Flown_By_Covered_Person_Row").style.display='none';
	}else{
		document.getElementById("Include_Specific_Questions_Row").style.display='';
		document.getElementById("Passenger_Non_Scheduled_Row").style.display='';
		document.getElementById("Passenger_Military_Aircraft").style.display='';
		document.getElementById("Being_Flown_By_Covered_Person_Row").style.display='';
	}
}

function display_Specific_Activities_Excluded(obj)
{	
	if(obj.value=="Specific_Activities_Excluded_N"){
		document.getElementById("Crop_Dusting_Row").style.display='none';
		document.getElementById("Spraying_Or_Seeding_Row").style.display='none';
		document.getElementById("Giving_And_Receiving_Flying_Instructions_Row").style.display='none';
		document.getElementById("Fire_Fighting_Row").style.display='none';
		document.getElementById("Sky_Writing_Row").style.display='none';
		document.getElementById("Sky_Diving_or_Hang_Gliding_Row").style.display='none';
		document.getElementById("Pipeline_or_PowerLine_Inspection_Row").style.display='none';
		document.getElementById("Aerial_Photography_or_Exploration_Row").style.display='none';
		document.getElementById("Racing_Row").style.display='none';
		document.getElementById("Endurance_Tests_Row").style.display='none';
		document.getElementById("Stunt_or_Acrobatic_Flying_Row").style.display='none';
		document.getElementById("Special_Permit_From_FAA_Row").style.display='none';
	}else{
		document.getElementById("Crop_Dusting_Row").style.display='';
		document.getElementById("Spraying_Or_Seeding_Row").style.display='';
		document.getElementById("Giving_And_Receiving_Flying_Instructions_Row").style.display='';
		document.getElementById("Fire_Fighting_Row").style.display='';
		document.getElementById("Sky_Writing_Row").style.display='';
		document.getElementById("Sky_Diving_or_Hang_Gliding_Row").style.display='';
		document.getElementById("Pipeline_or_PowerLine_Inspection_Row").style.display='';
		document.getElementById("Aerial_Photography_or_Exploration_Row").style.display='';
		document.getElementById("Racing_Row").style.display='';
		document.getElementById("Endurance_Tests_Row").style.display='';
		document.getElementById("Stunt_or_Acrobatic_Flying_Row").style.display='';
		document.getElementById("Special_Permit_From_FAA_Row").style.display='';
	}
}