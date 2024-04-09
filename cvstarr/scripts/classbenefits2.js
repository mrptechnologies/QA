
/* This script is used to hide the data element depending on the value seleced */

/* this is used to hide the entire row when 'No' selected in all three classes (Accidental Death & Dismemberment field)*/
function checkallthreearechecked_accidental_death_dismembermentClass2(){
		document.getElementById("principal_sum_row2_class2").style.display='none';	
		document.getElementById("time_period_for_loss_row2_class2").style.display='none';	
		document.getElementById("age_reduction_schedule_row2_class2").style.display='none';	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Accidental Death & Dismemberment field)*/
function displaylabels_accidental_death_dismembermentClass2(){
	document.getElementById("principal_sum_row2_class2").style.display='inline';	
	document.getElementById("time_period_for_loss_row2_class2").style.display='inline';	
	document.getElementById("age_reduction_schedule_row2_class2").style.display='inline';	
	
}

/* this is used to show the class2 column (Accidental Death & Dismemberment field)*/
function display_accidental_death_dismemberment_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_accidental_death_dismembermentClass2();
		document.getElementById("principal_sum_control2_class2").style.display='none'; 
		document.getElementById("time_period_for_loss_control2_class2").style.display='none';
		document.getElementById("age_reduction_schedule_control2_class2").style.display='none';
		
		
	}
	else{
		displaylabels_accidental_death_dismembermentClass2();
		document.getElementById("principal_sum_control2_class2").style.display='inline';
		document.getElementById("time_period_for_loss_control2_class2").style.display='inline';
		document.getElementById("age_reduction_schedule_control2_class2").style.display='inline';
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Age Reduction Schedule field)*/
function checkallthreearechecked_age_reduction_scheduleClass2(){
	
		document.getElementById("age_reduction_70_74_row2_class2").style.display='none';
		document.getElementById("age_reduction_75_79_row2_class2").style.display='none';	
		document.getElementById("age_reduction_80_84_row2_class2").style.display='none';	
		document.getElementById("age_reduction_85_older_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Age Reduction Schedule field)*/
function displaylabels_age_reduction_scheduleClass2(){
	
		document.getElementById("age_reduction_70_74_row2_class2").style.display='inline';
		document.getElementById("age_reduction_75_79_row2_class2").style.display='inline';	
		document.getElementById("age_reduction_80_84_row2_class2").style.display='inline';
		document.getElementById("age_reduction_85_older_row2_class2").style.display='inline';

	
}

/* this is used to show the class2 column (Age Reduction Schedule field)*/
function display_accidental_age_reduction_schedule_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_age_reduction_scheduleClass2();
		document.getElementById("age_reduction_70_74_control2_class2").style.display='none';
		document.getElementById("age_reduction_75_79_control2_class2").style.display='none';
		document.getElementById("age_reduction_80_84_control2_class2").style.display='none';
		document.getElementById("age_reduction_85_older_control2_class2").style.display='none';
		
		
	}
	else{
		displaylabels_age_reduction_scheduleClass2();
		document.getElementById("age_reduction_70_74_control2_class2").style.display='inline';
		document.getElementById("age_reduction_75_79_control2_class2").style.display='inline';
		document.getElementById("age_reduction_80_84_control2_class2").style.display='inline';
		document.getElementById("age_reduction_85_older_control2_class2").style.display='inline';
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Coma Benefit field)*/
function checkallthreearechecked_coma_benefitClass2(){
	
		document.getElementById("percentage_of_principal_row2_class2").style.display='none';	
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Coma Benefit field)*/
function displaylabels_coma_benefitClass2(){
	
	
	document.getElementById("percentage_of_principal_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Coma Benefit field)*/
function display_coma_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_coma_benefitClass2();
		document.getElementById("percentage_of_principal_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_coma_benefitClass2();
		document.getElementById("percentage_of_principal_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Paralysis Benefit field)*/
function checkallthreearechecked_paralysis_benefitClass2(){
	
		document.getElementById("paralysis_principal_row2_class2").style.display='none';	
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Paralysis Benefit field)*/
function displaylabels_paralysis_benefitClass2(){
	
	
	document.getElementById("paralysis_principal_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Paralysis Benefit field)*/
function display_paralysis_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_paralysis_benefitClass2();
		document.getElementById("principal_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_paralysis_benefitClass2();
		document.getElementById("principal_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/



/* this is used to hide the entire row when 'No' selected in all three classes (Common Accident Benefit field)*/
function checkallthreearechecked_common_accident_benefitClass2(){
	
		document.getElementById("percentage_of_principal_sum_row2_class2").style.display='none';
		document.getElementById("common_maximum_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Common Accident Benefit field)*/
function displaylabels_common_accident_benefitClass2(){
	
	
	document.getElementById("percentage_of_principal_sum_row2_class2").style.display='inline';
	document.getElementById("common_maximum_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Common Accident Benefit field)*/
function display_common_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_common_accident_benefitClass2();
		document.getElementById("percentage_of_principal_sum_control2_class2").style.display='none';
		document.getElementById("common_maximum_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_common_accident_benefitClass2();
		document.getElementById("percentage_of_principal_sum_control2_class2").style.display='inline';
		document.getElementById("common_maximum_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/


/* this is used to hide the entire row when 'No' selected in all three classes (Common Carrier Benefit field)*/
function checkallthreearechecked_common_carrier_benefitClass2(){
	
		document.getElementById("limit_row2_class2").style.display='none';
		document.getElementById("dollar_amount_row2_class2").style.display='none';
		document.getElementById("include_the_word_public_row2_class2").style.display='none';
		document.getElementById("include_the_statement_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Common Carrier Benefit field)*/
function displaylabels_common_carrier_benefitClass2(){
	
	
	document.getElementById("limit_row2_class2").style.display='inline';
	document.getElementById("dollar_amount_row2_class2").style.display='inline';
	document.getElementById("include_the_word_public_row2_class2").style.display='inline';
	document.getElementById("include_the_statement_row2_class2").style.display='inline';
	
	
}

/* this is used to show the class2 column (Common Carrier Benefit field)*/
function display_common_carrier_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_common_carrier_benefitClass2();
		document.getElementById("limit_control2_class2").style.display='none';
		document.getElementById("dollar_amount_control2_class2").style.display='none';
		document.getElementById("include_the_word_public_control2_class2").style.display='none';
		document.getElementById("include_the_statement_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_common_carrier_benefitClass2();
		document.getElementById("limit_control2_class2").style.display='inline';
		document.getElementById("dollar_amount_control2_class2").style.display='inline';
		document.getElementById("include_the_word_public_control2_class2").style.display='inline';
		document.getElementById("include_the_statement_control2_class2").style.display='inline';
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Limit field)*/
function checkallthreearechecked_limitClass2(){
	
	if(document.getElementById("limit_class2").selectedIndex == 1){
		
		document.getElementById("dollar_amount_row2_class2").style.display='none';
		document.getElementById("limit_percentage_row2_class2").style.display='inline';
	}
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Limit field)*/
function displaylabels_limitClass2(){
	
	
	document.getElementById("dollar_amount_row2_class2").style.display='inline';
	document.getElementById("limit_percentage_row2_class2").style.display='none';
	
	
	
}

/* this is used to show the class2 column (Limit field)*/
function display_limit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_limitClass2();
		document.getElementById("dollar_amount_control2_class2").style.display='none';
		document.getElementById("limit_percentage_control2_class2").style.display='inline';
		
		
		
		
	}
	else{
		displaylabels_limitClass2();
		document.getElementById("dollar_amount_control2_class2").style.display='inline';
		document.getElementById("limit_percentage_control2_class2").style.display='none';
		
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/




/* this is used to hide the entire row when 'No' selected in all three classes (Disability Benefit field)*/

function checkallthreearechecked_disability_benefitClass2(){
	
		document.getElementById("include_partial_disability_row2_class2").style.display='none';
		document.getElementById("benefit_waiting_period_days_row2_class2").style.display='none';
		document.getElementById("maximum_benefit_period_weeks_row2_class2").style.display='none';
		document.getElementById("amount_of_benefit_row2_class2").style.display='none';
		document.getElementById("percentage_predisability_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Disability Benefit field)*/
function displaylabels_disability_benefitClass2(){
	
	
	document.getElementById("include_partial_disability_row2_class2").style.display='inline';
	document.getElementById("benefit_waiting_period_days_row2_class2").style.display='inline';
	document.getElementById("maximum_benefit_period_weeks_row2_class2").style.display='inline';
	document.getElementById("amount_of_benefit_row2_class2").style.display='inline';
	document.getElementById("percentage_predisability_row2_class2").style.display='inline';
	
	
	
}
/* this is used to show the class2 column (Disability Benefit field)*/
function display_disability_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_disability_benefitClass2();
		document.getElementById("include_partial_control2_class2").style.display='none';
		document.getElementById("benefit_waiting_control2_class2").style.display='none';
		document.getElementById("benefit_maximum_control2_class2").style.display='none';
		document.getElementById("amount_of_benefit_control2_class2").style.display='none';
		document.getElementById("disability_earnings_minus_other_income_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_disability_benefitClass2();
		document.getElementById("include_partial_control2_class2").style.display='inline';
		document.getElementById("benefit_waiting_control2_class2").style.display='inline';
		document.getElementById("benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("amount_of_benefit_control2_class2").style.display='inline';
		document.getElementById("disability_earnings_minus_other_income_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Include Partial Disability Benefit field)*/
function checkallthreearechecked_partial_disability_benefitClass2(){
	
		document.getElementById("partial_disability_monthly_earnings_thershold_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Include Partial Disability field)*/
function displaylabels_partial_disability_benefitClass2(){
	
	
	document.getElementById("partial_disability_monthly_earnings_thershold_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Include Partial Disability Benefit field)*/
function display_partial_disability_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_partial_disability_benefitClass2();
		document.getElementById("monthly_earnings_control2_class2").style.display='none';
		
		
		
		
	}
	else{
		displaylabels_partial_disability_benefitClass2();
		document.getElementById("monthly_earnings_control2_class2").style.display='inline';
		
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Amount of Benefit field)*/
function checkallthreearechecked_amount_of_benefitClass2(){
	
	if(document.getElementById("amount_of_benefit_class2").selectedIndex == 1){
		document.getElementById("dollaramount_row2_class2").style.display='none';
		document.getElementById("percentage_predisability_row2_class2").style.display='inline';
	}
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Amount of Benefit field)*/
function displaylabels_amount_of_benefitClass2(){
		
	document.getElementById("dollaramount_row2_class2").style.display='inline';
	document.getElementById("percentage_predisability_row2_class2").style.display='none';
	
	
	
}

/* this is used to show the class2 column (Amount of Benefit field)*/
function displaylabels_amount_of_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_amount_of_benefitClass2();
		document.getElementById("dollaramount_control2_class2").style.display='none';
		document.getElementById("disability_earnings_minus_other_income_control2_class2").style.display='inline';
		
		
	}
	else{
		displaylabels_amount_of_benefitClass2();
		document.getElementById("dollaramount_control2_class2").style.display='inline';
		document.getElementById("disability_earnings_minus_other_income_control2_class2").style.display='none';
		
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/



/* this is used to hide the entire row when 'No' selected in all three classes (Permanent Disability Benefit field)*/
function checkallthreearechecked_permanent_disability_benefitClass2(){
	
		document.getElementById("payout_row2_class2").style.display='none';	
		document.getElementById("permanant_percentage_principal_lumpsum_row2_class2").style.display='none';	
			
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Permanent Disability Benefit field)*/
function displaylabels_permanent_disability_benefitClass2(){
	
	document.getElementById("payout_row2_class2").style.display='inline';
	document.getElementById("permanant_percentage_principal_lumpsum_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Permanent Disability Benefit field)*/
function display_permanent_disability_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_permanent_disability_benefitClass2();
		document.getElementById("payout_control2_class2").style.display='none'; 
		document.getElementById("permanant_percentage_principal_lumpsum_control2_class2").style.display='none'; 
		
		
	}
	else{
		displaylabels_permanent_disability_benefitClass2();
		document.getElementById("payout_control2_class2").style.display='inline';
		document.getElementById("permanant_percentage_principal_lumpsum_control2_class2").style.display='inline';
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/


/* this is used to hide the entire row when 'No' selected in all three classes (Payout field)*/
function checkallthreearechecked_payoutClass2(){
	
	if(document.getElementById("permanent_payout_class2").selectedIndex == 1){
		document.getElementById("permanant_percentage_principal_lumpsum_row2_class2").style.display='none';
		document.getElementById("permanant_percentage_principal_monthlysum_row2_class2").style.display='inline';
	}
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Payout field)*/
function displaylabels_payoutClass2(){
		
	document.getElementById("permanant_percentage_principal_lumpsum_row2_class2").style.display='inline';
	document.getElementById("permanant_percentage_principal_monthlysum_row2_class2").style.display='none';
	
	
	
}

/* this is used to show the class2 column (Payout field)*/
function displaylabels_payout_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_payoutClass2();
		document.getElementById("permanant_percentage_principal_lumpsum_control2_class2").style.display='none';
		document.getElementById("permanant_percentage_principal_monthlysum_control2_class2").style.display='inline';
		
		
	}
	else{
		displaylabels_payoutClass2();
		document.getElementById("permanant_percentage_principal_lumpsum_control2_class2").style.display='inline';
		document.getElementById("permanant_percentage_principal_monthlysum_control2_class2").style.display='none';
		
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Emergency Medical Evacuation Benefit field)*/
function checkallthreearechecked_emergency_medical_evacuation_benefitClass2(){
	
		document.getElementById("emergency_benefit_maximum_row2_class2").style.display='none';	
			
		document.getElementById("emergency_distance_row2_class2").style.display='none';	
		
			
}
/* this is used to show the entire row when 'yes' selected in all three classes (Emergency Medical Evacuation Benefit field)*/
function displaylabels_emergency_medical_evacuation_benefitClass2(){
	document.getElementById("emergency_benefit_maximum_row2_class2").style.display='inline';	
	
	document.getElementById("emergency_distance_row2_class2").style.display='inline';
	
	
}

/* this is used to show the class2 column (Emergency Medical Evacuation Benefit field)*/
function displaylabels_emergency_medical_evacuation_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_emergency_medical_evacuation_benefitClass2();
		document.getElementById("emergency_benefit_maximum_control2_class2").style.display='none'; 
		
		document.getElementById("emergency_distance_control2_class2").style.display='none';
		
		
	}
	else{
		displaylabels_emergency_medical_evacuation_benefitClass2();
		document.getElementById("emergency_benefit_maximum_control2_class2").style.display='inline';
		
		document.getElementById("emergency_distance_control2_class2").style.display='inline';
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Felonious Assault Benefit field)*/
function checkallthreearechecked_felonious_assault_benefitClass2(){
	
		document.getElementById("felonious_assault_benefit_principal_row2_class2").style.display='none';
		document.getElementById("felonious_assault_benefit_maximum_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Felonious Assault Benefit field)*/
function displaylabels_felonious_assault_benefitClass2(){
	
	
	document.getElementById("felonious_assault_benefit_principal_row2_class2").style.display='inline';
	document.getElementById("felonious_assault_benefit_maximum_row2_class2").style.display='inline';
	

	
	
}

/* this is used to show the class2 column (Felonious Assault Benefit field)*/
function displaylabels_felonious_assault_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_felonious_assault_benefitClass2();
		document.getElementById("felonious_assault_benefit_principal_control2_class2").style.display='none';
		document.getElementById("felonious_assault_benefit_maximum_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_felonious_assault_benefitClass2();
		document.getElementById("felonious_assault_benefit_principal_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_benefit_maximum_control2_class2").style.display='inline';
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Felonious Assault and Violent Crime Benefit field)*/
function checkallthreearechecked_felonious_assault_violent_crime_benefitClass2(){
	
		document.getElementById("felonious_assault_violent_crime_principal_row2_class2").style.display='none';	
		document.getElementById("felonious_assault_violent_crime_maximum_row2_class2").style.display='none';	
		document.getElementById("felonious_assault_violent_crime_police_report_row2_class2").style.display='none';	
		document.getElementById("felonious_assault_violent_crime_covered_accident_row2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_police_notification_row2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_hospital_stay_after_assault_row2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_payment_row2_class2").style.display='none';
		
	
		
}
/* this is used to show the entire row when 'yes' selected in all three classes (Felonious Assault and Violent Crime Benefit field)*/
function displaylabels_felonious_assault_violent_crime_benefitClass2(){
	document.getElementById("felonious_assault_violent_crime_principal_row2_class2").style.display='inline';	
	document.getElementById("felonious_assault_violent_crime_maximum_row2_class2").style.display='inline';	
	document.getElementById("felonious_assault_violent_crime_police_report_row2_class2").style.display='inline';	
	document.getElementById("felonious_assault_violent_crime_covered_accident_row2_class2").style.display='inline';
	document.getElementById("felonious_assault_violent_crime_police_notification_row2_class2").style.display='inline';
	document.getElementById("felonious_assault_violent_crime_hospital_stay_after_assault_row2_class2").style.display='inline';
	document.getElementById("felonious_assault_violent_crime_payment_row2_class2").style.display='inline';
	
}

/* this is used to show the class2 column (Felonious Assault and Violent Crime Benefit field)*/
function displaylabels_felonious_assault_violent_crime_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_felonious_assault_violent_crime_benefitClass2();
		document.getElementById("felonious_assault_violent_crime_principal_control2_class2").style.display='none'; 
		document.getElementById("felonious_assault_violent_crime_maximum_control2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_police_report_control2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_covered_accident_control2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_police_notification_control2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_hospital_stay_after_assault_control2_class2").style.display='none';
		document.getElementById("felonious_assault_violent_crime_payment_control2_class2").style.display='none';
		
		
	}
	else{
		displaylabels_felonious_assault_violent_crime_benefitClass2();
		document.getElementById("felonious_assault_violent_crime_principal_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_violent_crime_maximum_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_violent_crime_police_report_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_violent_crime_covered_accident_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_violent_crime_police_notification_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_violent_crime_hospital_stay_after_assault_control2_class2").style.display='inline';
		document.getElementById("felonious_assault_violent_crime_payment_control2_class2").style.display='inline';
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Hospital Confinement Benefit field)*/
function checkallthreearechecked_hospital_confinement_benefitClass2(){
	
		document.getElementById("hospital_confinement_benefit_waiting_row2_class2").style.display='none';	
		document.getElementById("hospital_confinement_benefit_maximum_benefit_period_row2_class2").style.display='none';	
		document.getElementById("hospital_confinement_benefit_daily_row2_class2").style.display='none';	
		document.getElementById("hospital_confinement_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_gap_hospital_stay_row2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_retroactive_row2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_coverage_row2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_period_confinement_row2_class2").style.display='none';
		
	
		
}
/* this is used to show the entire row when 'yes' selected in all three classes (Hospital Confinement Benefit field)*/
function displaylabels_hospital_confinement_benefitClass2(){
	document.getElementById("hospital_confinement_benefit_waiting_row2_class2").style.display='inline';	
	document.getElementById("hospital_confinement_benefit_maximum_benefit_period_row2_class2").style.display='inline';	
	document.getElementById("hospital_confinement_benefit_daily_row2_class2").style.display='inline';	
	document.getElementById("hospital_confinement_benefit_maximum_row2_class2").style.display='inline';
	document.getElementById("hospital_confinement_benefit_gap_hospital_stay_row2_class2").style.display='inline';
	document.getElementById("hospital_confinement_benefit_retroactive_row2_class2").style.display='inline';
	document.getElementById("hospital_confinement_benefit_coverage_row2_class2").style.display='inline';
	document.getElementById("hospital_confinement_benefit_period_confinement_row2_class2").style.display='inline';
	
}

/* this is used to show the class2 column (Hospital Confinement Benefitfield)*/
function displaylabels_hospital_confinement_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_hospital_confinement_benefitClass2();
		document.getElementById("hospital_confinement_benefit_waiting_control2_class2").style.display='none'; 
		document.getElementById("hospital_confinement_benefit_maximum_benefit_period_control2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_daily_control2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_gap_hospital_stay_control2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_retroactive_control2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_coverage_control2_class2").style.display='none';
		document.getElementById("hospital_confinement_benefit_period_confinement_control2_class2").style.display='none';
		
		
	}
	else{
		displaylabels_hospital_confinement_benefitClass2();
		document.getElementById("hospital_confinement_benefit_waiting_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_maximum_benefit_period_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_daily_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_gap_hospital_stay_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_retroactive_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_coverage_control2_class2").style.display='inline';
		document.getElementById("hospital_confinement_benefit_period_confinement_control2_class2").style.display='inline';
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Repatriation Benefit field)*/
function checkallthreearechecked_repatriation_benefitClass2(){
	
		document.getElementById("repatriation_benefit_distance_row2_class2").style.display='none';
		document.getElementById("repatriation_benefit_payment_authorization_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Repatriation Benefit field)*/
function displaylabels_repatriation_benefitClass2(){
	
	
	document.getElementById("repatriation_benefit_distance_row2_class2").style.display='inline';
	document.getElementById("repatriation_benefit_payment_authorization_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Repatriation Benefit field)*/
function displaylabels_repatriation_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_repatriation_benefitClass2();
		document.getElementById("repatriation_benefit_distance_control2_class2").style.display='none';
		document.getElementById("repatriation_benefit_payment_authorization_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_repatriation_benefitClass2();
		document.getElementById("repatriation_benefit_distance_control2_class2").style.display='inline';
		document.getElementById("repatriation_benefit_payment_authorization_control2_class2").style.display='inline';
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/



/* this is used to hide the entire row when 'No' selected in all three classes (Seatbelt Benefit field)*/

function checkallthreearechecked_seatbelt_benefitClass2(){
	
		document.getElementById("seatbelt_benefit_default_row2_class2").style.display='none';
		document.getElementById("seatbelt_dismemberment_row2_class2").style.display='none';
		document.getElementById("seatbelt_percentage_row2_class2").style.display='none';
		document.getElementById("seatbelt_maximum_row2_class2").style.display='none';
		document.getElementById("seatbelt_restriction_row2_class2").style.display='none';
		document.getElementById("seatbelt_airbag_row2_class2").style.display='none';
		document.getElementById("seatbelt_lumpsum_row2_class2").style.display='none';
		document.getElementById("seatbelt_airbag_maximum_row2_class2").style.display='none';
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Seatbelt Benefit field)*/
function displaylabels_seatbelt_benefitClass2(){
	
	
	document.getElementById("seatbelt_benefit_default_row2_class2").style.display='inline';
	document.getElementById("seatbelt_dismemberment_row2_class2").style.display='inline';
	document.getElementById("seatbelt_percentage_row2_class2").style.display='inline';
	document.getElementById("seatbelt_maximum_row2_class2").style.display='inline';
	document.getElementById("seatbelt_restriction_row2_class2").style.display='inline';
	document.getElementById("seatbelt_airbag_row2_class2").style.display='inline';
	document.getElementById("seatbelt_lumpsum_row2_class2").style.display='inline';
	document.getElementById("seatbelt_airbag_maximum_row2_class2").style.display='inline';
	
	
	
	
}
/* this is used to show the class2 column (Seatbelt Benefit field)*/
function displaylabels_seatbelt_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_seatbelt_benefitClass2();
		document.getElementById("seatbelt_benefit_default_control2_class2").style.display='none';
		document.getElementById("seatbelt_dismemberment_control2_class2").style.display='none';
		document.getElementById("seatbelt_percentage_control2_class2").style.display='none';
		document.getElementById("seatbelt_maximum_control2_class2").style.display='none';
		document.getElementById("seatbelt_restriction_control2_class2").style.display='none';
		document.getElementById("seatbelt_airbag_control2_class2").style.display='none';
		document.getElementById("seatbelt_lumpsum_control2_class2").style.display='none';
		document.getElementById("seatbelt_airbag_maximum_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_seatbelt_benefitClass2();
		document.getElementById("seatbelt_benefit_default_control2_class2").style.display='inline';
		document.getElementById("seatbelt_dismemberment_control2_class2").style.display='inline';
		document.getElementById("seatbelt_percentage_control2_class2").style.display='inline';
		document.getElementById("seatbelt_maximum_control2_class2").style.display='inline';
		document.getElementById("seatbelt_restriction_control2_class2").style.display='inline';
		document.getElementById("seatbelt_airbag_control2_class2").style.display='inline';
		document.getElementById("seatbelt_lumpsum_control2_class2").style.display='inline';
		document.getElementById("seatbelt_airbag_maximum_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Optional: Airbag Benefitfield)*/
function checkallthreearechecked_airbagClass2(){
	
		document.getElementById("seatbelt_lumpsum_row2_class2").style.display='none';	
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Optional: Airbag Benefitfield)*/
function displaylabels_airbagClass2(){
	
	
	document.getElementById("seatbelt_lumpsum_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Optional: Airbag Benefit field)*/
function displaylabels_airbag_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_airbagClass2();
		document.getElementById("seatbelt_lumpsum_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_airbagClass2();
		document.getElementById("seatbelt_lumpsum_control2_class2").style.display='inline';
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Hospital Room and Board Expenses  field)*/
function checkallthreearechecked_hospital_expenseClass2(){
	
		document.getElementById("hospital_board_expense_perday_row2_class2").style.display='none';	
		
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Hospital Room and Board Expenses  field)*/
function displaylabels_hospital_expenseClass2(){
	
	
	document.getElementById("hospital_board_expense_perday_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Hospital Room and Board Expenses field)*/
function displaylabels_hospital_expense_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_hospital_expenseClass2();
		document.getElementById("hospital_board_expense_perday_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_hospital_expenseClass2();
		document.getElementById("hospital_board_expense_perday_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Hospital Room and Board Expenses  field)*/
function checkallthreearechecked_incountry_hospital_expenseClass2(){
	
		document.getElementById("incountry_hospital_board_expense_perday_class2").style.display='none';	
		
	
		
}
/* this is used to show the entire row when 'yes' selected in all three classes (Hospital Room and Board Expenses  field)*/
function displaylabels_incountry_hospital_expenseClass2(){
	
	
	document.getElementById("incountry_hospital_board_expense_perday_class2").style.display='inline';
	document.getElementById("incountry_hospital_board_expense_perday_sub2").style.display='inline';
	
	
}

/* this is used to show the class1 column (Hospital Room and Board Expenses field)*/
function displaylabels_incountry_hospital_expense_class2(obj){	
	if(obj.value=="N"){
		checkallthreearechecked_incountry_hospital_expenseClass2();
		document.getElementById("incountry_hospital_board_expense_perday2").style.display='none';
		
		
		
	}
	else{
		displaylabels_incountry_hospital_expenseClass2();
		document.getElementById("incountry_hospital_board_expense_perday2").style.display='inline';
		
		
	}
}
/* this is used to hide the entire row when 'No' selected in all three classes (Chaperone Replacement Benefit field)*/
function checkallthreearechecked_chaperoneClass2(){
	
	
			document.getElementById("chaperone_maximum_row2_class2").style.display='none';	
		
			
}

/* this is used to show the entire row when 'yes' selected in all three classes (Chaperone Replacement Benefit field)*/
function displaylabels_chaperoneClass2(){
	
	document.getElementById("chaperone_maximum_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Chaperone Replacement Benefitfield)*/
function displaylabels_chaperone_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_chaperoneClass2();
		document.getElementById("chaperone_maximum_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_chaperoneClass2();
		document.getElementById("chaperone_maximum_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Emergency Reunion Benefit I field)*/
function checkallthreearechecked_emergency_reunion2_benefitClass2(){
	
		document.getElementById("reunion1_distance_row2_class2").style.display='none';
		document.getElementById("reunion1_lodging_row2_class2").style.display='none';
		document.getElementById("reunion1_maximum_benefit_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Emergency Reunion Benefit I field)*/
function displaylabels_emergency_reunion2_benefitClass2(){
	
	
	document.getElementById("reunion1_distance_row2_class2").style.display='inline';
	document.getElementById("reunion1_lodging_row2_class2").style.display='inline';
	document.getElementById("reunion1_maximum_benefit_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Emergency Reunion Benefit I field)*/
function displaylabels_emergency_reunion2_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_emergency_reunion2_benefitClass2();
		document.getElementById("reunion1_distance_control2_class2").style.display='none';
		document.getElementById("reunion1_lodging_control2_class2").style.display='none';
		document.getElementById("reunion1_maximum_benefit_control2_class2").style.display='none';
		
		
	}
	else{
		displaylabels_emergency_reunion2_benefitClass2();
		document.getElementById("reunion1_distance_control2_class2").style.display='inline';
		document.getElementById("reunion1_lodging_control2_class2").style.display='inline';
		document.getElementById("reunion1_maximum_benefit_control2_class2").style.display='inline';
		
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Emergency Reunion Benefit II field)*/
function checkallthreearechecked_reunion_benefit2Class2(){
	
		document.getElementById("reunion2_confinement_row2_class2").style.display='none';
		document.getElementById("reunion2_maximum_benefit_row2_class2").style.display='none';
		document.getElementById("reunion2_daily_maximum_benefit_row2_class2").style.display='none';
		document.getElementById("reunion2_maximum_days_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Emergency Reunion Benefit II field)*/
function displaylabels_reunion_benefit2Class2(){
	
	
	document.getElementById("reunion2_confinement_row2_class2").style.display='inline';
	document.getElementById("reunion2_maximum_benefit_row2_class2").style.display='inline';
	document.getElementById("reunion2_daily_maximum_benefit_row2_class2").style.display='inline';
	document.getElementById("reunion2_maximum_days_row2_class2").style.display='inline';
	
	
}

/* this is used to show the class2 column (Emergency Reunion Benefit II field)*/
function displaylabels_reunion_benefit2_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_reunion_benefit2Class2();
		document.getElementById("reunion2_confinement_control2_class2").style.display='none';
		document.getElementById("reunion2_maximum_benefit_control2_class2").style.display='none';
		document.getElementById("reunion2_daily_maximum_benefit_control2_class2").style.display='none';
		document.getElementById("reunion2_maximum_days_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_reunion_benefit2Class2();
		document.getElementById("reunion2_confinement_control2_class2").style.display='inline';
		document.getElementById("reunion2_maximum_benefit_control2_class2").style.display='inline';
		document.getElementById("reunion2_daily_maximum_benefit_control2_class2").style.display='inline';
		document.getElementById("reunion2_maximum_days_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Extended Benefit Option field)*/
function checkallthreearechecked_extended_benefitClass2(){
	
		document.getElementById("extended_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("extended_deductible_row2_class2").style.display='none';
		document.getElementById("extended_days_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Extended Benefit Option field)*/
function displaylabels_extended_benefitClass2(){
	
	
	document.getElementById("extended_benefit_maximum_row2_class2").style.display='inline';
	document.getElementById("extended_deductible_row2_class2").style.display='inline';
	document.getElementById("extended_days_row2_class2").style.display='inline';
	
	
	
	
}

/* this is used to show the class2 column (Extended Benefit Option field)*/
function displaylabels_extended_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_extended_benefitClass2();
		document.getElementById("extended_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("extended_deductible_control2_class2").style.display='none';
		document.getElementById("extended_days_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_extended_benefitClass2();
		document.getElementById("extended_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("extended_deductible_control2_class2").style.display='inline';
		document.getElementById("extended_days_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Family Reunion Benefit field)*/
function checkallthreearechecked_family_reunion_benefitClass2(){
	
		document.getElementById("family_maximum_row2_class2").style.display='none';
		document.getElementById("family_confinement_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Family Reunion Benefit field)*/
function displaylabels_family_reunion_benefitClass2(){
	
	
	document.getElementById("family_maximum_row2_class2").style.display='inline';
	document.getElementById("family_confinement_row2_class2").style.display='inline';
	
	
	
	
}

/* this is used to show the class2 column (Family Reunion Benefit field)*/
function displaylabels_family_reunion_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_family_reunion_benefitClass2();
		document.getElementById("family_maximum_control2_class2").style.display='none';
		document.getElementById("family_confinement_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_family_reunion_benefitClass2();
		document.getElementById("family_maximum_control2_class2").style.display='inline';
		document.getElementById("family_confinement_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Home Country Benefit I field)*/
function checkallthreearechecked_home_country_benefit1Class2(){
	
		
		document.getElementById("home1_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("home1_maximum_days_row2_class2").style.display='none';
		document.getElementById("home1_deductible_row2_class2").style.display='none';
		document.getElementById("home1_extended_benefit_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Home Country Benefit I field)*/
function displaylabels_home_country_benefit1Class2(){
	
	
	document.getElementById("home1_benefit_maximum_row2_class2").style.display='inline';
	document.getElementById("home1_maximum_days_row2_class2").style.display='inline';
	document.getElementById("home1_deductible_row2_class2").style.display='inline';
	document.getElementById("home1_extended_benefit_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Home Country Benefit Ifield)*/
function displaylabels_home_country_benefit1_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_home_country_benefit1Class2();
		document.getElementById("home1_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("home1_maximum_days_control2_class2").style.display='none';
		document.getElementById("home1_deductible_control2_class2").style.display='none';
		document.getElementById("home1_extended_benefit_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_home_country_benefit1Class2();
		document.getElementById("home1_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("home1_maximum_days_control2_class2").style.display='inline';
		document.getElementById("home1_deductible_control2_class2").style.display='inline';
		document.getElementById("home1_extended_benefit_control2_class2").style.display='inline';
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Home Country Benefit II field)*/

function checkallthreearechecked_home_country_benefit2Class2(){
	
		
		document.getElementById("home2_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("home2_incidental_visit_row2_class2").style.display='none';
		document.getElementById("home2_maximum_days_row2_class2").style.display='none';
		document.getElementById("home2_deductible_row2_class2").style.display='none';
		document.getElementById("home2_extended_benefit_length_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Home Country Benefit II field)*/
function displaylabels_home_country_benefit2Class2(){
	
	
	document.getElementById("home2_benefit_maximum_row2_class2").style.display='inline';
	document.getElementById("home2_incidental_visit_row2_class2").style.display='inline';
	document.getElementById("home2_maximum_days_row2_class2").style.display='inline';
	document.getElementById("home2_deductible_row2_class2").style.display='inline';
	document.getElementById("home2_extended_benefit_length_row2_class2").style.display='inline';
	
	
}
/* this is used to show the class2 column (Home Country Benefit II field)*/
function displaylabels_home_country_benefit2_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_home_country_benefit2Class2();
		document.getElementById("home2_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("home2_incidental_visit_control2_class2").style.display='none';
		document.getElementById("home2_maximum_days_control2_class2").style.display='none';
		document.getElementById("home2_deductible_control2_class2").style.display='none';
		document.getElementById("home2_extended_benefit_length_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_home_country_benefit2Class2();
		document.getElementById("home2_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("home2_incidental_visit_control2_class2").style.display='inline';
		document.getElementById("home2_maximum_days_control2_class2").style.display='inline';
		document.getElementById("home2_deductible_control2_class2").style.display='inline';
		document.getElementById("home2_extended_benefit_length_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/



/* this is used to hide the entire row when 'No' selected in all three classes (Home Country Emergency Benefit field)*/
function checkallthreearechecked_home_country_emergency_benefitClass2(){
	
		
		document.getElementById("home_emegency_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("home_emergency_coinsurance_row2_class2").style.display='none';
		document.getElementById("home_emergency_deductible_row2_class2").style.display='none';
		document.getElementById("home_emergency_maximum_duration_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Home Country Emergency Benefit field)*/
function displaylabels_home_country_emergency_benefitClass2(){
	
	
	document.getElementById("home_emegency_benefit_maximum_row2_class2").style.display='inline';
	document.getElementById("home_emergency_coinsurance_row2_class2").style.display='inline';
	document.getElementById("home_emergency_deductible_row2_class2").style.display='inline';
	document.getElementById("home_emergency_maximum_duration_row2_class2").style.display='inline';
	
	
	
	
}

/* this is used to show the class2 column (Home Country Emergency Benefit field)*/
function displaylabels_home_country_emergency_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_home_country_emergency_benefitClass2();
		document.getElementById("home_emegency_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("home_emergency_coinsurance_control2_class2").style.display='none';
		document.getElementById("home_emergency_deductible_control2_class2").style.display='none';
		document.getElementById("home_emergency_maximum_duration_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_home_country_emergency_benefitClass2();
		document.getElementById("home_emegency_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("home_emergency_coinsurance_control2_class2").style.display='inline';
		document.getElementById("home_emergency_deductible_control2_class2").style.display='inline';
		document.getElementById("home_emergency_maximum_duration_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/

/* this is used to hide the entire row when 'No' selected in all three classes (Home Country Extension Benefit field)*/
function checkallthreearechecked_home_country_extension_benefitClass2(){
	
		
		document.getElementById("home_country_extension_maximum_benefit_row2_class2").style.display='none';
		document.getElementById("home_country_extension_coinsurance_row2_class2").style.display='none';
		document.getElementById("home_country_extension_period_row2_class2").style.display='none';
		document.getElementById("home_country_extension_deductible_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Home Country Extension Benefitfield)*/
function displaylabels_home_country_extension_benefitClass2(){
	
	
	document.getElementById("home_country_extension_maximum_benefit_row2_class2").style.display='inline';
	document.getElementById("home_country_extension_coinsurance_row2_class2").style.display='inline';
	document.getElementById("home_country_extension_period_row2_class2").style.display='inline';
	document.getElementById("home_country_extension_deductible_row2_class2").style.display='inline';
	
	
	
	
}

/* this is used to show the class2 column (Home Country Extension Benefit field)*/
function displaylabels_home_country_extension_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_home_country_extension_benefitClass2();
		document.getElementById("home_country_extension_maximum_benefit_control2_class2").style.display='none';
		document.getElementById("home_country_extension_coinsurance_control2_class2").style.display='none';
		document.getElementById("home_country_extension_period_control2_class2").style.display='none';
		document.getElementById("home_country_extension_deductible_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_home_country_extension_benefitClass2();
		document.getElementById("home_country_extension_maximum_benefit_control2_class2").style.display='inline';
		document.getElementById("home_country_extension_coinsurance_control2_class2").style.display='inline';
		document.getElementById("home_country_extension_period_control2_class2").style.display='inline';
		document.getElementById("home_country_extension_deductible_control2_class2").style.display='inline';
		
		
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Lost Baggage Benefit Option field)*/
function checkallthreearechecked_lost_baggage_benefitClass2(){

		document.getElementById("lost_baggage_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("lost_baggage_personal_hygiene_row2_class2").style.display='none';
		document.getElementById("lost_baggage_deductible_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Lost Baggage Benefit Option field)*/
function displaylabels_lost_baggage_benefitClass2(){
	
	
	document.getElementById("lost_baggage_benefit_maximum_row2_class2").style.display='inline';
	document.getElementById("lost_baggage_personal_hygiene_row2_class2").style.display='inline';
	document.getElementById("lost_baggage_deductible_row2_class2").style.display='inline';
	
	
	
}

/* this is used to show the class2 column (Lost Baggage Benefit Option field)*/
function displaylabels_lost_baggage_benefit_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_lost_baggage_benefitClass2();
		document.getElementById("lost_baggage_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("lost_baggage_personal_hygiene_control2_class2").style.display='none';
		document.getElementById("lost_baggage_deductible_control2_class2").style.display='none';
		
		
		
	}
	else{
		displaylabels_lost_baggage_benefitClass2();
		document.getElementById("lost_baggage_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("lost_baggage_personal_hygiene_control2_class2").style.display='inline';
		document.getElementById("lost_baggage_deductible_control2_class2").style.display='inline';
		
		
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/
/* this is used to hide the entire row when 'No' selected in all three classes (Personal Property and/or Financial Instrument Reimbursement Benefit field)*/

function checkallthreearechecked_personal_property_financial_reimbursementClass2(){
	
		document.getElementById("personal_property_covered_peril_row2_class2").style.display='none';
		document.getElementById("personal_property_deductible_row2_class2").style.display='none';
		document.getElementById("personal_property_goods_row2_class2").style.display='none';
		document.getElementById("personal_property_benefit_maximum_row2_class2").style.display='none';
		document.getElementById("personal_property_benefit_articles_row2_class2").style.display='none';
		document.getElementById("personal_property_financial_instrument_row2_class2").style.display='none';
		document.getElementById("personal_property_cash_row2_class2").style.display='none';
		document.getElementById("personal_property_exclusions_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_limit_row2_class2").style.display='none';
		
		document.getElementById("personal_property_maximum_row2_class2").style.display='none';
		document.getElementById("personal_property_vehicles_row2_class2").style.display='none';
		document.getElementById("personal_property_accessories_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_aircraft_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_due_to_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_insects_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_climatic_row2_class2").style.display='none';
		
		document.getElementById("personal_property_craftsmanship_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_machanical_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_inherent_vice_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_breaking_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_reparing_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_reasonable_proportion_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_currency_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_perishable_row2_class2").style.display='none';
		
		
		document.getElementById("personal_property_devaluation_money_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_more_than_500_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_not_reported_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_confiscation_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_laptop_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_furniture_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_eyeglasses_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_contact_lenses_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_teeth_care_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_care_row2_class2").style.display='none';
		
		
		document.getElementById("personal_property_payment_mysterious_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_unexplained_shortage_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_theft_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_jewelry_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_audiovisual_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_foodstuffs_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_animal_mounts_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_sound_equipments_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_firearm_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_mobile_equipment_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_action_row2_class2").style.display='none';
		
		document.getElementById("personal_property_payment_weapon_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_insurrection_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_nuclear_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_breakage_indirect_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_destructon_parking_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_commercial_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_loss_loading_row2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_vehicle_fictitious_row2_class2").style.display='none';
	
		
}

/* this is used to show the entire row when 'yes' selected in all three classes (Personal Property and/or Financial Instrument Reimbursement Benefit field)*/
function displaylabels_personal_property_financial_reimbursementClass2(){
	
	
		document.getElementById("personal_property_covered_peril_row2_class2").style.display='inline';
		document.getElementById("personal_property_deductible_row2_class2").style.display='inline';
		document.getElementById("personal_property_goods_row2_class2").style.display='inline';
		document.getElementById("personal_property_benefit_maximum_row2_class2").style.display='inline';
		document.getElementById("personal_property_benefit_articles_row2_class2").style.display='inline';
		document.getElementById("personal_property_financial_instrument_row2_class2").style.display='inline';
		document.getElementById("personal_property_cash_row2_class2").style.display='inline';
		document.getElementById("personal_property_exclusions_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_limit_row2_class2").style.display='inline';

		document.getElementById("personal_property_maximum_row2_class2").style.display='inline';
		document.getElementById("personal_property_vehicles_row2_class2").style.display='inline';
		document.getElementById("personal_property_accessories_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_aircraft_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_due_to_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_insects_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_climatic_row2_class2").style.display='inline';

		document.getElementById("personal_property_craftsmanship_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_machanical_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_inherent_vice_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_breaking_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_reparing_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_reasonable_proportion_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_currency_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_perishable_row2_class2").style.display='inline';


		document.getElementById("personal_property_devaluation_money_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_more_than_500_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_not_reported_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_confiscation_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_laptop_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_furniture_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_eyeglasses_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_contact_lenses_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_teeth_care_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_care_row2_class2").style.display='inline';


		document.getElementById("personal_property_payment_mysterious_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_unexplained_shortage_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_theft_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_jewelry_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_audiovisual_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_foodstuffs_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_animal_mounts_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_sound_equipments_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_firearm_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_mobile_equipment_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_action_row2_class2").style.display='inline';

		document.getElementById("personal_property_payment_weapon_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_insurrection_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_nuclear_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_breakage_indirect_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_destructon_parking_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_commercial_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_loss_loading_row2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_vehicle_fictitious_row2_class2").style.display='inline';
	
	
	
	
}
/* this is used to show the class2 column (Personal Property and/or Financial Instrument Reimbursement Benefit field)*/
function displaylabels_personal_property_financial_reimbursement_class2(obj)
{	
	if(obj.value=="N"){
		checkallthreearechecked_personal_property_financial_reimbursementClass2();
		document.getElementById("personal_property_covered_peril_control2_class2").style.display='none';
		document.getElementById("personal_property_deductible_control2_class2").style.display='none';
		document.getElementById("personal_property_goods_control2_class2").style.display='none';
		document.getElementById("personal_property_benefit_maximum_control2_class2").style.display='none';
		document.getElementById("personal_property_benefit_articles_control2_class2").style.display='none';
		document.getElementById("personal_property_financial_instrument_control2_class2").style.display='none';
		document.getElementById("personal_property_cash_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_limit_row2_class2").style.display='none';
		
		document.getElementById("personal_property_maximum_control2_class2").style.display='none';
		document.getElementById("personal_property_vehicles_control2_class2").style.display='none';
		document.getElementById("personal_property_accessories_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_aircraft_control2_class2").style.display='none';
		//document.getElementById("personal_property_benefit_articles2").style.display='none';
		document.getElementById("personal_property_payment_insects_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_climatic_control2_class2").style.display='none';
		
		document.getElementById("personal_property_craftsmanship_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_machanical_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_inherent_vice_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_breaking_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_reparing_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_reasonable_proportion_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_currency_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_perishable_control2_class2").style.display='none';
		
		
		document.getElementById("personal_property_devaluation_money_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_more_than_500_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_not_reported_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_confiscation_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_laptop_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_furniture_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_eyeglasses_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_contact_lenses_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_teeth_care_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_care_control2_class2").style.display='none';
		
		document.getElementById("personal_property_payment_mysterious_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_unexplained_shortage_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_theft_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_jewelry_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_audiovisual_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_foodstuffs_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_animal_mounts_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_sound_equipments_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_firearm_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_mobile_equipment_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_action_control2_class2").style.display='none';
		
		document.getElementById("personal_property_payment_weapon_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_insurrection_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_nuclear_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_breakage_indirect_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_destructon_parking_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_commercial_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_war_loss_loading_control2_class2").style.display='none';
		document.getElementById("personal_property_payment_loss_vehicle_fictitious_control2_class2").style.display='none';
	}
	else{
		displaylabels_personal_property_financial_reimbursementClass2();
		document.getElementById("personal_property_covered_peril_control2_class2").style.display='inline';
		document.getElementById("personal_property_deductible_control2_class2").style.display='inline';
		document.getElementById("personal_property_goods_control2_class2").style.display='inline';
		document.getElementById("personal_property_benefit_maximum_control2_class2").style.display='inline';
		document.getElementById("personal_property_benefit_articles_control2_class2").style.display='inline';
		document.getElementById("personal_property_financial_instrument_control2_class2").style.display='inline';
		document.getElementById("personal_property_cash_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_limit_row2_class2").style.display='inline';
		
		document.getElementById("personal_property_maximum_control2_class2").style.display='inline';
		document.getElementById("personal_property_vehicles_control2_class2").style.display='inline';
		document.getElementById("personal_property_accessories_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_aircraft_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_insects_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_climatic_control2_class2").style.display='inline';
		
					
		
		document.getElementById("personal_property_craftsmanship_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_machanical_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_inherent_vice_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_breaking_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_reparing_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_reasonable_proportion_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_currency_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_perishable_control2_class2").style.display='inline';
		
		
		
		document.getElementById("personal_property_devaluation_money_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_more_than_500_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_not_reported_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_confiscation_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_laptop_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_furniture_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_eyeglasses_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_contact_lenses_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_teeth_care_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_care_control2_class2").style.display='inline';
		
		document.getElementById("personal_property_payment_mysterious_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_unexplained_shortage_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_theft_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_jewelry_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_audiovisual_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_foodstuffs_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_animal_mounts_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_sound_equipments_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_firearm_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_mobile_equipment_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_action_control2_class2").style.display='inline';
		
		
		document.getElementById("personal_property_payment_weapon_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_insurrection_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_nuclear_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_breakage_indirect_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_destructon_parking_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_commercial_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_war_loss_loading_control2_class2").style.display='inline';
		document.getElementById("personal_property_payment_loss_vehicle_fictitious_control2_class2").style.display='inline';
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/
function checkallthreearechecked_PoliticalEvcuationClass2(){
	
		document.getElementById("Political_Benefit_Maximum_row2_class2").style.display='none';
		document.getElementById("IncludesNaturalDisasterCoverage_row2_class2").style.display='none';
		document.getElementById("IncludesKidnapping_row2_class2").style.display='none';
		document.getElementById("ConsultingServices_row2_class2").style.display='none';
	
}

function displaylabels_PoliticalEvacuationClass2(){
	document.getElementById("Political_Benefit_Maximum_row2_class2").style.display='';
	document.getElementById("IncludesNaturalDisasterCoverage_row2_class2").style.display='';
	document.getElementById("IncludesKidnapping_row2_class2").style.display='';
	document.getElementById("ConsultingServices_row2_class2").style.display='';
	
	
}
function display_Political_Evacuation_Class2(obj) {
	if(obj.value=="N"){
			checkallthreearechecked_PoliticalEvcuationClass2();
			document.getElementById("Political_Benefit_Maximum_control2_class2").style.display='none';
			document.getElementById("IncludesNaturalDisasterCoverage_control2_class2").style.display='none';
			document.getElementById("IncludesKidnapping_control2_class2").style.display='none';
			document.getElementById("ConsultingServices_control2_class2").style.display='none';
		}
		else{
			displaylabels_PoliticalEvacuationClass2();
			document.getElementById("Political_Benefit_Maximum_control2_class2").style.display='';
			document.getElementById("IncludesNaturalDisasterCoverage_control2_class2").style.display='';
			document.getElementById("IncludesKidnapping_control2_class2").style.display='';
			document.getElementById("ConsultingServices_control2_class2").style.display='';
	}
}


/*---------------------------------------------------------------------------------------------------------------------*/

function checkallthreearechecked_Minor_Children_BenefitClass2(){
	
		document.getElementById("ReturnMinorBenefitMaximum_row2_class2").style.display='none';
		document.getElementById("Minimum_Hospital_Confinement_row2_class2").style.display='none';
		document.getElementById("EvacuatonCovered_row2_class2").style.display='none';
		document.getElementById("To_Another_Location_row2_class2").style.display='none';
		document.getElementById("To_Home_Country_row2_class2").style.display='none';
		document.getElementById("ReImburement_Of_Ground_row2_class2").style.display='none';
		document.getElementById("Return_Destination_row2_class2").style.display='none';
	
}

function displaylabels_Minor_Children_BenefitClass2(){
	
		document.getElementById("ReturnMinorBenefitMaximum_row2_class2").style.display='';
		document.getElementById("Minimum_Hospital_Confinement_row2_class2").style.display='';
		document.getElementById("EvacuatonCovered_row2_class2").style.display='';
		document.getElementById("To_Another_Location_row2_class2").style.display='';
		document.getElementById("To_Home_Country_row2_class2").style.display='';
		document.getElementById("ReImburement_Of_Ground_row2_class2").style.display='';
		document.getElementById("Return_Destination_row2_class2").style.display='';
	
}

function display_minor_children_benefit_Class2(obj){
	if(obj.value=="N"){
		checkallthreearechecked_Minor_Children_BenefitClass2();
		document.getElementById("ReturnMinorBenefitMaximum_control2_class2").style.display='none';
		document.getElementById("Minimum_Hospital_Confinement_control2_class2").style.display='none';
		document.getElementById("EvacuatonCovered_control2_class2").style.display='none';
		
		document.getElementById("To_Another_Location_control2_class2").style.display='none';
		document.getElementById("To_Home_Country_control2_class2").style.display='none';
		document.getElementById("ReImburement_Of_Ground_control2_class2").style.display='none';
		document.getElementById("Return_Destination_control2_class2").style.display='none';
	}
	else{
		displaylabels_Minor_Children_BenefitClass2();
		document.getElementById("ReturnMinorBenefitMaximum_control2_class2").style.display='';
		document.getElementById("Minimum_Hospital_Confinement_control2_class2").style.display='';
		document.getElementById("EvacuatonCovered_control2_class2").style.display='';		
		document.getElementById("To_Another_Location_control2_class2").style.display='';
		document.getElementById("To_Home_Country_control2_class2").style.display='';
		document.getElementById("ReImburement_Of_Ground_control2_class2").style.display='';
		document.getElementById("Return_Destination_control2_class2").style.display='';
	}
}



/*---------------------------------------------------------------------------------------------------------------------*/

function checkallthreearechecked_Trip_Cancelation_BenefitClass2(){
	
		document.getElementById("Trip_Cancellation_Benefit_Maximum_row2_class2").style.display='none';
		document.getElementById("Covered_Persons_Children_Included_row2_class2").style.display='none';
		document.getElementById("Covered_Persons_Grandparents_Included_row2_class2").style.display='none';
	}


function displaylabels_Minor_Trip_Cancelation_BenefitClass2(){
	document.getElementById("Trip_Cancellation_Benefit_Maximum_row2_class2").style.display='';
	document.getElementById("Covered_Persons_Children_Included_row2_class2").style.display='';
	document.getElementById("Covered_Persons_Grandparents_Included_row2_class2").style.display='';
	
}

function display_trip_cancellation_benefit_class2(obj){
	if(obj.value=="N"){
		checkallthreearechecked_Trip_Cancelation_BenefitClass2();
		document.getElementById("Trip_Cancellation_Benefit_Maximum_control2_class2").style.display='none';
		document.getElementById("Covered_Persons_Children_Included_control2_class2").style.display='none';
		document.getElementById("Covered_Persons_Grandparents_Included_control2_class2").style.display='none';
	}
	else{
		displaylabels_Minor_Trip_Cancelation_BenefitClass2();
		document.getElementById("Trip_Cancellation_Benefit_Maximum_control2_class2").style.display='';
		document.getElementById("Covered_Persons_Children_Included_control2_class2").style.display='';
		document.getElementById("Covered_Persons_Grandparents_Included_control2_class2").style.display='';
	}
}




/*---------------------------------------------------------------------------------------------------------------------*/

function checkallthreearechecked_Trip_Interruption_BenefitClass2(){
	
		document.getElementById("TripInterruption_Benefit_Maximum_row2_class2").style.display='none';
		document.getElementById("TheDeathofaFamily_row2_class2").style.display='none';
		document.getElementById("UnforeseenInjury_row2_class2").style.display='none';
		document.getElementById("SubstancialDestructionoftheCoveredPersons_row2_class2").style.display='none';
		document.getElementById("AMedicallyNecessaryCoveredEmergency_row2_class2").style.display='none';
		document.getElementById("TripInterruption_Covered_Person_Children_Included_row2_class2").style.display='none';
		document.getElementById("TripInterruption_Covered_Person_Grandparents_Included_row2_class2").style.display='none';
		document.getElementById("Inclusions_row2_class2").style.display='none';
	
}

function displaylabels_Minor_Trip_Interruption_BenefitClass2(){
		document.getElementById("TripInterruption_Benefit_Maximum_row2_class2").style.display='';
		document.getElementById("TheDeathofaFamily_row2_class2").style.display='';
		document.getElementById("UnforeseenInjury_row2_class2").style.display='';
		document.getElementById("SubstancialDestructionoftheCoveredPersons_row2_class2").style.display='';		
		document.getElementById("AMedicallyNecessaryCoveredEmergency_row2_class2").style.display='';
		document.getElementById("TripInterruption_Covered_Person_Children_Included_row2_class2").style.display='';
		document.getElementById("TripInterruption_Covered_Person_Grandparents_Included_row2_class2").style.display='';
		document.getElementById("Inclusions_row2_class2").style.display='';
	
}

function display_trip_interruption_benefit_class2(obj){
	if(obj.value=="N"){
		checkallthreearechecked_Trip_Interruption_BenefitClass2();
		document.getElementById("TripInterruption_Benefit_Maximum_control2_class2").style.display='none';
		document.getElementById("TheDeathofaFamily_control2_class2").style.display='none';
		document.getElementById("UnforeseenInjury_control2_class2").style.display='none';
		document.getElementById("SubstancialDestructionoftheCoveredPersons_control2_class2").style.display='none';
		document.getElementById("AMedicallyNecessaryCoveredEmergency_control2_class2").style.display='none';
		document.getElementById("TripInterruption_Covered_Person_Children_Included_control2_class2").style.display='none';
		document.getElementById("TripInterruption_Covered_Person_Grandparents_Included_control2_class2").style.display='none';
	}
	else{
		displaylabels_Minor_Trip_Interruption_BenefitClass2();
		document.getElementById("TripInterruption_Benefit_Maximum_control2_class2").style.display='';
		document.getElementById("TheDeathofaFamily_control2_class2").style.display='';
		document.getElementById("UnforeseenInjury_control2_class2").style.display='';
		document.getElementById("SubstancialDestructionoftheCoveredPersons_control2_class2").style.display='';
		document.getElementById("AMedicallyNecessaryCoveredEmergency_control2_class2").style.display='';
		document.getElementById("TripInterruption_Covered_Person_Children_Included_control2_class2").style.display='';
		document.getElementById("TripInterruption_Covered_Person_Grandparents_Included_control2_class2").style.display='';
	}
}

/*---------------------------------------------------------------------------------------------------------------------*/

function checkallthreearechecked_Trip_Cancellation_Mininum_Hospital_period_AppliesClass2(){

		document.getElementById("Minimum_Hospital_Confinement_Period_row2_class2").style.display='none';

}

function displaylabels_Trip_Cancellation_Mininum_Hospital_period_AppliesClass2(){
		
		document.getElementById("Minimum_Hospital_Confinement_Period_row2_class2").style.display='';
}

function display_hospital_confinement_period_class2(obj){
	if(obj.value=="N"){
		checkallthreearechecked_Trip_Cancellation_Mininum_Hospital_period_AppliesClass2();
		document.getElementById("Minimum_Hospital_Confinement_Period_control2_class2").style.display='none';
	}
	else{
		displaylabels_Trip_Cancellation_Mininum_Hospital_period_AppliesClass2();
		document.getElementById("Minimum_Hospital_Confinement_Period_control2_class2").style.display='';
	}
}
/*---------------------------------------------------------------------------------------------------------------------*/