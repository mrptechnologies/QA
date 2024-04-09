 
 <style>
 	.classBenefits .field{float:left;width:250px;padding:3px 0 0 10px;margin:0px 0 0px 10px;font-size:12px;text-align:left;}
 	.classBenefits .subfield{margin:0 0 0 15px;}
 	.classBenefits .secondsubfield{margin:0 0 0 30px;}
 	.classBenefits .thirdsubfield{margin:0 0 0 45px;}
 	.classBenefits { margin:0 0 0 100px; }
 </style>
 
 <SCRIPT type="text/javascript" SRC="scripts/classbenefits3.js"> </SCRIPT>
 
 <div class="classBenefits">
 <input type="hidden" name="answer(Object::Clearance::RetroDateFlag)" value="" id="RetroDateModifiedFlag">
 <table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
 				<tr>
 					<td width="55%" align="left"><h3 style="margin:20px 0 0 0px;padding:0;">Class Benefits</h3></td>
 				</tr>
 				
 				<%-------------------------------------------------------------------------------------------------------------------%>
 				<tr><td><table>
 						<tr><td  align='left'><span><p style="margin:0px;padding:0px;text-align:left;width:200px;">Class Name</p></span></td>
     						    <td align='left'><span>Class&nbsp;3</span></td>
 						</tr>
 						<tr><td>&nbsp;</td></tr>
 						<tr>
 						   <td align='left'>
 							<span><p style="margin:0px;padding:0px;text-align:left;width:200px;">Class Description</p></span>
 						  </td>
 						  <td align='left'>
 						       <span><p style="margin:0px;padding:0px;text-align:left;"> All employees of Carleton College who are in active service and are traveling on the business of Carleton College outside of their country of residence or permanent assignment. </p></span>
 						  </td>
 						</tr></table></td></tr>	
                                <tr><td>&nbsp;</td></tr>
                                <%--------------------------------------------------------------------------------------------------------------------%>
 				<tr><td>
				 <div id="accident_benefits3">
 				<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
 				<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Accident Benefits</h3></span></td></tr>
 				
 				
 				<tr>
 					<td class='field'  align='left'>
 					<span>Accidental Death & Dismemberment</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_accidental_death_dismemberment_class3(this)" type='radio' name='answer(accidental_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_accidental_death_dismemberment_class3(this)" type='radio' name='answer(accidental_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr id ="principal_sum_row3_class3" >
 					<td class='field'  align='left'>
 					<span class="subfield">Principal Sum</span>
 					</td>
 					<td  align='left'>
 					<div id="principal_sum_control3_class3">
 					<span >
 					<input type='text' name='' value="100000" maxlength='8' class='txtbox' size='8' onkeyup=""></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr id='time_period_for_loss_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Time Period (days) for Loss from date of Accident</p></span>
 					</td>
 					<td  align='left'>
 					<div id="time_period_for_loss_control3_class3">
 					<span >
 					<input type='text' name='' value="365" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr id='age_reduction_schedule_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Age Reduction Schedule</span>
 					</td>
 					<td  align='left'>
 					<div id="age_reduction_schedule_control3_class3">
 					<span >
 					<input onClick="return display_accidental_age_reduction_schedule_class3(this)" type='radio' name='answer(age_reduction_3)' id='age_reduction_schedule1_Y' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_accidental_age_reduction_schedule_class3(this)" type='radio' name='answer(age_reduction_3)' id='age_reduction_schedule1_N' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr id='age_reduction_70_74_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield">[70-74] </span>
 					</td>
 					<td  align='left'>
 					<div id="age_reduction_70_74_control3_class3">
 					<span >
 					<input type='text' name='' value="65" maxlength='2'  class='txtbox' size='2'   onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				
 				<tr id='age_reduction_75_79_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield">[75-79] </span>
 					</td>
 					<td  align='left'>
 					<div id="age_reduction_75_79_control3_class3">
 					<span >
 					<input type='text' name='' value="45" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				
 				<tr id='age_reduction_80_84_row3_class3'> 
 					<td class='field'  align='left'>
 					<span class="secondsubfield">[80-84] </span>
 					</td>
 					<td  align='left'>
 					<div id="age_reduction_80_84_control3_class3">
 					<span >
 					<input type='text' name='' value="30" maxlength='2'  class='txtbox' size='2'   onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				
 				<tr id='age_reduction_85_older_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield">[85 and older]  </span>
 					</td>
 					<td  align='left'>
 					<div id="age_reduction_85_older_control3_class3">
 					<span >
 					<input type='text' name='' value="15" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span id='coma_benefit'>Coma Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_coma_benefit_class3(this)" type='radio' name='answer(coma_benefit_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_coma_benefit_class3(this)" type='radio' name='answer(coma_benefit_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr id='percentage_of_principal_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Percentage of Principal Sum (for first 11 months)</p></span>
 					</td>
 					<td  align='left'>
 					<div id="percentage_of_principal_control3_class3">
 					<span >
 					<input type='text' name='' value="1" maxlength='3'  class='txtbox' size='2' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span id='paralysis_benefit_sub'>Paralysis Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_paralysis_benefit_class3(this)" type='radio' name='answer(paralysis_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_paralysis_benefit_class3(this)" type='radio' name='answer(paralysis_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id='paralysis_principal_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Percentage of Principal Sum</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="paralysis_principal_control3_class3">
 					<span >
 					<input type='text' name='' value="5" maxlength='3'  class='txtbox' size='2'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span id='common_accident_benefit_sub'>Common Accident Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_common_benefit_class3(this)" type='radio' name='answer(common_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_common_benefit_class3(this)" type='radio' name='answer(common_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id='percentage_of_principal_sum_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Percentage of Principal Sum </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="percentage_of_principal_sum_control3_class3">
 					<span >
 					<input type='text' name='' value="100" maxlength='3'  class='txtbox' size='3' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>			
 				<tr style="display:none;" id='common_maximum_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum Benefit</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="common_maximum_control3_class3">
 					<span >
 					<input type='text' name='' value="500000" maxlength='6'  class='txtbox' size='6'onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span id='common_carrier_benefit'>Common Carrier Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_common_carrier_benefit_class3(this)" type='radio' name='answer(carrier_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_common_carrier_benefit_class3(this)" type='radio' name='answer(carrier_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 												
 				<tr style="display:none;" id='limit_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Limit</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="limit_control3_class3">
 					<select id="limit_class3" class="txtbox" onchange="return display_limit_class3(this)">
 					<option  value='Y' SELECTED id='limit_dollar1'>Dollar Amount </option>
 					<option value='N' id='limit_principal1'>Percentage of Principal Sum</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>		
 								
 				<tr style="display:none;" id='dollar_amount_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield">Dollar Amount</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="dollar_amount_control3_class3">
 					<span >
 					<input type='text' name='' value="1000000" maxlength='7'  class='txtbox' size='7' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id='limit_percentage_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield">Percentage of Principal Sum</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="limit_percentage_control3_class3">
 					<span >
 					<input type='text' name='' value="25" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 								
 								
 				<tr style="display:none;" id='include_the_word_public_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Include the word "public"</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="include_the_word_public_control3_class3">
 					<span >
 					<input  type='radio' name='answer(public_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input  type='radio' name='answer(public_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id='include_the_statement_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Include the statement "on a set route and schedules"</p></span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="include_the_statement_control3_class3">
 					<span >
 					<input  type='radio' name='answer(route_schedule_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input  type='radio' name='answer(route_schedule_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Disability Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_disability_benefit_class3(this)" type='radio' name='answer(disability_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_disability_benefit_class3(this)" type='radio' name='answer(disability_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id='include_partial_disability_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Include Partial Disability?</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="include_partial_control3_class3">
 					<span >
 					<input onClick="return display_partial_disability_benefit_class3(this)" type='radio' name='answer(partial_disability_3)'  value='Y'><span id="include_partial_disability_YL">Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_partial_disability_benefit_class3(this)" type='radio' name='answer(partial_disability_3)'  value='N' CHECKED><span id="include_partial_disability_NL">No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id='partial_disability_monthly_earnings_thershold_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield"><p class="secondsubfield">Partial Disability Monthly Earnings threshold</p></span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="monthly_earnings_control3_class3">
 					<span >
 					<input type='text' name='' value="" maxlength='4'  class='txtbox' size='4'   onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id='benefit_waiting_period_days_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Benefit Waiting Period (days)</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="benefit_waiting_control3_class3">
 					<span >
 					<input type='text' name='' value="365" maxlength='3'  class='txtbox' size='3'  id='benefit_waiting_period_days_txt' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id='maximum_benefit_period_weeks_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum Benefit Period (weeks)</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="benefit_maximum_control3_class3">
 					<span >
 					<input type='text' name='' value="53" maxlength='3'  class='txtbox' size='3' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 								
 																
 				<tr style="display:none;" id='amount_of_benefit_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="subfield">Amount of Benefit</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="amount_of_benefit_control3_class3">
 					<select id='amount_of_benefit_class3' class="txtbox" onchange="return displaylabels_amount_of_benefit_class3(this)">
 					<option value='Y'> Dollar Amount </option>
 					<option value='N'SELECTED>Percentage</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;"id='dollaramount_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield">Dollar Amount</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;"id='dollaramount_control3_class3'>
 					<span >
 					<input type='text' name='' value="" maxlength='4'  class='txtbox' size='4' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				
 				<tr style="display:none;" id='percentage_predisability_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield"><p class="secondsubfield">Percentage of pre-disability earnings minus any Other Income Benefits received on account of disability including current earnings</p></span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="disability_earnings_minus_other_income_control3_class3">
 					<span >
 					<input type='text' name='' value="67" maxlength='3'  class='txtbox' size='3' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr><td>&nbsp;</td></tr>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Permanent Disability Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return display_permanent_disability_benefit_class3(this)" type='radio' name='answer(permanant_disability_benefit_3)'  value='Y'><span id="permanent_disability_benefit_YL">Yes&nbsp;&nbsp;</span>
 					<input onClick="return display_permanent_disability_benefit_class3(this)" type='radio' name='answer(permanant_disability_benefit_3)'  value='N' CHECKED><span id="permanent_disability_benefit_NL">No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				
 								
 				<tr style="display:none;" id='payout_row3_class3'>
 					<td class='subfield'  align='left'>
 					<span id='payout_sub1'>Payout</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="payout_control3_class3">
 					<select id='permanent_payout_class3' class="txtbox" onchange="return displaylabels_payout_class3(this)">
 					<option value='Y' SELECTED>Lump Sum</option>
 					<option value='N'>Installments over 100 months</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id='permanant_percentage_principal_lumpsum_row3_class3'>
 					<td class='field'  align='left'>
 					<span class="secondsubfield"><p class="secondsubfield">Percentage of Principal Sum(lump sum)</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="permanant_percentage_principal_lumpsum_control3_class3">
 					<span >
 					<input type='text' name='' value="100" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>		
 							
 				<tr style="display:none;" id='permanant_percentage_principal_monthlysum_row3_class3'>				
 					<td class='field'  align='left'>
 					<span class="secondsubfield"><p class="secondsubfield">Percentage of Principal Sum(monthly)</p></span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="permanant_percentage_principal_monthlysum_control3_class3">
 					<span >
 					<input type='text' name='' value="1" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Emergency Medical Evacuation Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_emergency_medical_evacuation_benefit_class3(this)" type='radio' name='answer(evacuation_benefit_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_emergency_medical_evacuation_benefit_class3(this)" type='radio' name='answer(evacuation_benefit_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 											
 				<tr id ="emergency_benefit_maximum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Benefit Maximum</span>
 					</td>
 					<td  align='left'>
 					<div id="emergency_benefit_maximum_control3_class3">
 					<span >100% of covered expenses</span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				
 								
 				<tr id ="emergency_distance_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Distance</span>
 					</td>
 					<td  align='left'>
 					<div id="emergency_distance_control3_class3">
 					<select class="txtbox">
 					<option>Out of Country</option>
 					<option SELECTED>100 miles radius from home</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span id='permanent_disability_benefit'>Felonious Assault Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_felonious_assault_benefit_class3(this)" type='radio' name='answer(felonious_assault_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_felonious_assault_benefit_class3(this)" type='radio' name='answer(felonious_assault_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 																
 				<%-----------------------------------------------------------------------------------------------%>																
 				<tr style="display:none;" id ="felonious_assault_benefit_principal_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Percentage of Principal Sum</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_benefit_principal_control3_class3">
 					<span >
 					<input type='text' name='' value="35" maxlength='3'  class='txtbox' size='3' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id ="felonious_assault_benefit_maximum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_benefit_maximum_control3_class3">
 					<span >
 					<input type='text' name='' value="" maxlength='7'  class='txtbox' size='7'   onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Felonious Assault and Violent Crime Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_felonious_assault_violent_crime_benefit_class3(this)" type='radio' name='answer(felonious_violent_crime_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_felonious_assault_violent_crime_benefit_class3(this)" type='radio' name='answer(felonious_violent_crime_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>														
 				<%-----------------------------------------------------------------------------------------------%>																				
 				<tr style="display:none;"id ="felonious_assault_violent_crime_principal_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Percentage of Principal Sum</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_principal_control3_class3">
 					<span >
 					<input type='text' name='' value="25" maxlength='3'  class='txtbox' size='3' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id ="felonious_assault_violent_crime_maximum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_maximum_control3_class3">
 					<span >
 					<input type='text' name='' value="" maxlength='7'  class='txtbox' size='7' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id ="felonious_assault_violent_crime_police_report_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Police Report Required</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_police_report_control3_class3">
 					<span >
 					<input  type='radio' name='answer(police_report_required_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input  type='radio' name='answer(police_report_required_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id ="felonious_assault_violent_crime_covered_accident_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Covered Accident must be on business or Policyholder</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_covered_accident_control3_class3">
 					<span >
 					<input  type='radio' name='answer(covered_accident_holder_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input  type='radio' name='answer(covered_accident_holder_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id ="felonious_assault_violent_crime_police_notification_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Police notification Period</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_police_notification_control3_class3">
 					<span >
 					<input type='text' name='' value="48" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id ="felonious_assault_violent_crime_hospital_stay_after_assault_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Maximum Days Hospital stay occurred after assault</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_hospital_stay_after_assault_control3_class3">
 					<span >
 					<input type='text' name='' value="0" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id ="felonious_assault_violent_crime_payment_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Monthly or Daily payments</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="felonious_assault_violent_crime_payment_control3_class3">
 					<select class="txtbox">
 					<option>Monthly</option>
 					<option SELECTED>Daily</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 
 				<tr>
 					<td class='field'  align='left'>
 					<span>Hospital Confinement Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_hospital_confinement_benefit_class3(this)" type='radio' name='answer(hospital_confinement_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_hospital_confinement_benefit_class3(this)" type='radio' name='answer(hospital_confinement_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 																				
 				<%-----------------------------------------------------------------------------------------------%>																				
 				<tr style="display:none;" id="hospital_confinement_benefit_waiting_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Waiting Period (days)</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_waiting_control3_class3">
 					<span >
 					<input type='text' name='' value="3" maxlength='2'  class='txtbox' size='2'   onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id="hospital_confinement_benefit_maximum_benefit_period_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum Benefit Period (days) </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_maximum_benefit_period_control3_class3">
 					<span >
 					<input type='text' name='30' value="30" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id="hospital_confinement_benefit_daily_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Daily Benefit</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_daily_control3_class3">
 					<span >
 					<input type='text' name='30' value="100" maxlength='4'  class='txtbox' size='4'   onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr style="display:none;" id="hospital_confinement_benefit_maximum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_maximum_control3_class3">
 					<span >
 					<input type='text' name='30' value="5000" maxlength='7'  class='txtbox' size='7' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 
 				<tr style="display:none;" id="hospital_confinement_benefit_gap_hospital_stay_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Maximum gap before Hospital stay (days)</p></span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_gap_hospital_stay_control3_class3">
 					<span >
 					<input type='text' name='30' value="7" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				
 				<%-----------------------------------------------------------------------------------------------%>
 				
 				<tr style="display:none;" id="hospital_confinement_benefit_retroactive_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Retroactive Payment</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_retroactive_control3_class3">
 					<span >
 					<input type='radio' name='answer(retroactive_payment_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(retroactive_payment_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="hospital_confinement_benefit_coverage_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Coverage if Confinement lasts atleast 3 days in a row</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_coverage_control3_class3">
 					<span >
 					<input type='radio' name='answer(coverage_3days_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(coverage_3days_3)' value='N'><span id=>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr style="display:none;" id="hospital_confinement_benefit_period_confinement_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Period for Confinement (days)</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="hospital_confinement_benefit_period_confinement_control3_class3">
 					<span >
 					<input type='text' name='30' value="14" maxlength='2'  class='txtbox' size='2' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Repatriation Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_repatriation_benefit_class3(this)" type='radio' name='answer(repatriation_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_repatriation_benefit_class3(this)" type='radio' name='answer(repatriation_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="repatriation_benefit_distance_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield" >Distance</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="repatriation_benefit_distance_control3_class3">
 					<select class="txtbox">
 					<option>Out of Country</option>
 					<option SELECTED>100 mile radius from home</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 					<tr>
				<td class='field'  align='left'>
				<span class="subfield" id='repatriation_benefit_distance_sub1'>Benefit Maximum</span>
				</td><td  align='left'>100% of covered expenses</td></tr>							
 				<%-----------------------------------------------------------------------------------------------%>												
 				<tr style="display:none;" id="repatriation_benefit_payment_authorization_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Payment Authorization by electronic or telephonic means Acceptable</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="repatriation_benefit_payment_authorization_control3_class3">
 					<span >
 					<input type='radio' name='answer(payment_telephone_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(payment_telephone_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Seatbelt Benefit</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_seatbelt_benefit_class3(this)" type='radio' name='answer(seatbelt_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_seatbelt_benefit_class3(this)" type='radio' name='answer(seatbelt_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="seatbelt_benefit_default_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield" >Default Benefit</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_benefit_default_control3_class3">
 					<span >
 					<input type='text' name='30' value="3000" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="seatbelt_dismemberment_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Dismemberment Covered</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_dismemberment_control3_class3">
 					<span >
 					<input type='radio' name='answer(Dismemberment_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(Dismemberment_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>																
 				<tr style="display:none;" id="seatbelt_percentage_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Percentage of Principal Sum </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_percentage_control3_class3">
 					<span >
 					<input type='text' name='' value="10" maxlength='3'  class='txtbox' size='7' onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="seatbelt_maximum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_maximum_control3_class3">
 					<span >
 					<input type='text' name='' value="10000" maxlength='7'  class='txtbox' size='7'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>								
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="seatbelt_restriction_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield"><p class="subfield">Restriction of payment to default if no Police Report or unclear circumstances</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_restriction_control3_class3">
 					<span >
 					<input type='radio' name='answer(restriction_payment_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(restriction_payment_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>	
 				<tr style="display:none;" id="seatbelt_airbag_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">  Optional: Airbag Benefit</span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_airbag_control3_class3">
 					<span >
 					<input onClick="return displaylabels_airbag_class3(this)" type='radio' name='answer(airbag_benefit_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_airbag_class3(this)" type='radio' name='answer(airbag_benefit_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="seatbelt_lumpsum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="secondsubfield"><p class="secondsubfield">Percentage of Principal Sum(lump sum)</p></span>
 
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_lumpsum_control3_class3">
 					<span >
 					<input type='text' name='' value="5" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr style="display:none;" id="seatbelt_airbag_maximum_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Maximum </span>
 					</td>
 					<td  align='left'>
 					<div style="display:none;" id="seatbelt_airbag_maximum_control3_class2">
 					<span >
 					<input type='text' name='' value="10000" maxlength='7'  class='txtbox' size='7'  onkeyup="" ></span>
 					</div>
 					</td>
 					
 				</tr>
 				</table></div></td></tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr><td>
				<div id="classbenefits_out_country_medical_benefits_class3" style="display:none;"><table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
 				<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Out of Country Medical Benefits</h3></span></td></tr>
 					
 					<tr>
 					<td class='field'  align='left'>
 					<span><p class="labels">Maximum number of days Charges incurred after date of Covered Accident/Sickness</p></span>
 					</td>
 					<td  align='left'>
 					<select class="txtbox">
 					<option>90</option>
 					<option>180</option>
 					<option SELECTED>365</option>
 					</select>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Deductible per occurrence </span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input type='text' name='' value="100" maxlength='4'  class='txtbox' size='4'  onkeyup="" ></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Coinsurance</span>
 					</td>
 					<td  align='left'>
 					<select class="txtbox">
 					<option>50%</option>
 					<option>55%</option>
 					<option>60%</option>
 					<option>65%</option>
 					<option>70%</option>
 					<option>75%</option>
 					<option>80%</option>
 					<option>85%</option>
 					<option>90%</option>
 					<option>95%</option>
 					<option SELECTED>100%</option>
 					
 					</select>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Coinsurance Threshold Amount</span>
 					</td>
 					<td  align='left'>
 					<select class="txtbox">
 					<option>$0</option>
 					<option>$1000</option>
 					<option>$2000</option>
 					<option>$2500</option>
 					<option>$5000</option>
 					<option>$10000</option>
 					</select>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Maximum Benefit per Occurrence</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input type='text' name='' value="250000" maxlength='7'  class='txtbox' size='7'  onkeyup="" ></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span><p class="labels">Maximum Benefit Period from the date of the covered accident or sickness (months)</p></span>
 					</td>
 					<td  align='left'>
 					<select class="txtbox">
 					<option>3</option>
 					<option>4</option>
 					<option>5</option>
 					<option>6</option>
 					<option>7</option>
 					<option>8</option>
 					<option>9</option>
 					<option>10</option>
 					<option>11</option>
 					<option SELECTED>12</option>
 					</select>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Pre-existing Condition Limit</span>
 					</td>
 					<td  align='left'>
 					<select class="txtbox">
 					<option>Select</option>
 					<option>None</option>
 					<option>$500 (standard)</option>
 					<option SELECTED>$1000</option>
 					<option>$2500</option>
 					</select>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr>
 					<td class='field'  align='left'>
 					<span>Hospital Room and Board Expenses </span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input onClick="return displaylabels_hospital_expense_class3(this)" type='radio' name='answer(hospital_expense_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input onClick="return displaylabels_hospital_expense_class3(this)" type='radio' name='answer(hospital_expense_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 								
 				<%-----------------------------------------------------------------------------------------------%>				
 				<tr id="hospital_board_expense_perday_row3_class3">
 					<td class='field'  align='left'>
 					<span class="subfield">Per Day Amount</span>
 					</td>
 					<td  align='left'>
 					<div id="hospital_board_expense_perday_control3_class3">
 					<select class="txtbox">
 					<option>$400 (standard)</option>
 					<option>$500</option>
 					<option>$600 (standard)</option>
 					<option SELECTED> Semi Private</option>
 					</select>
 					</div>
 					</td>
 					
 				</tr>	
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field'  align='left'>
 					<span>Ancillary Hospital Expenses</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input type='radio' name='answer(ancillary_expense_3)'  value='Y' CHECKED><span">Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(ancillary_expense_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Daily Intensive Care Unit Expenses</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input type='radio' name='answer(icu_3)'  value='Y' CHECKED><span">Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(icu_3)'  value='N'><span id="permanent_disability_benefit_NL">No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 				<tr>
 					<td class='field'  align='left'>
 					<span>Medical Emergency Care (room and supplies) Expenses</span>
 					</td>
 					<td  align='left'>
 					<span >
 					<input type='radio' name='answer(emergencycare_3)'  value='Y' CHECKED><span">Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(emergencycare_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 					
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>								
 						
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>Newborn Nursery Care Expenses</span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(newborn_expense_3)' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(newborn_expense_3)' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Outpatient Surgical Room and Supply Expenses for use of the surgical facility</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(outpatient_expense_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(outpatient_expense_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Outpatient diagnostic X-rays, laboratory procedures and tests</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(lab_expense_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(lab_expense_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Doctor Non-Surgical Treatment/Examination Expenses (excluding medicines)</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(nonsurgical_expense_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(nonsurgical_expense_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>Doctor's Surgical Expenses</span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(surgical_expense_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(surgical_expense_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>as shown in the Schedule of Benefits</span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(schedule_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(schedule_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">If an Injury or Sickness requires multiple surgical procedures through the same incision,We will pay only one benefit, the largest of the procedures performed.If multiple surgical procedures are performed during the same operative session but through different incisions,We will pay as shown in the Schedule of Benefits for the most expensive procedure and 50% of Covered Expenses for the additional surgeries</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(injury_sickness_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(injury_sickness_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 				<%-----------------------------------------------------------------------------------------------%>
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Assistant Surgeon Expenses when Medically Necessary</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(assistant_surgeon_expenses_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(assistant_surgeon_expenses_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Anesthesiologist Expenses for pre-operative screening and administration of anesthesia during a surgical procedure whether on an inpatient or outpatient basis</p></span>
 
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(anesthesiologist_expenses_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(anesthesiologist_expenses_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Outpatient Laboratory Test Expenses</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(outpatient_lab_expenses_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(outpatient_lab_expenses_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>Physiotherapy </span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(physiotherapy_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(physiotherapy_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Include Physical Medicine/Chiropractic/Acupuncture</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(chiropractic_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(chiropractic_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Limited to one visit per day(as shown in the Schedule of Benefits)</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(1visit_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(1visit_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Chiropractic Expenses on an inpatient or outpatient basis</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(patient_basis_3)' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(patient_basis_3)' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Limited to one visit per day</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(limited_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(limited_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">X-ray Expenses (including reading charges) but not for dental X-rays</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(xray_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(xray_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Dental Expenses including dental x-rays for the repair or treatment of each injured tooth that is whole, sound and a natural tooth at the time of the Accident</p></span>
 
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(dental_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(dental_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Includes emergency alleviation of dental pain</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(pain_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(pain_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Dental Expenses for impacted wisdom tooth</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(wisdom_tooth_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(wisdom_tooth_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Outpatient Registered Nurse Services if ordered by a Doctor</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(registered_nurse_service_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(registered_nurse_service_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Ambulance Expenses for transportation from the emergency site to the Hospital</p></span>
 
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(ambulance_expense_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(ambulance_expense_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Rehabilitative braces or appliances prescribed by a Doctor</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(rehabilitative_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(rehabilitative_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Prescription Drug Expenses prescribed by a Doctor</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(prescription_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(prescription_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>Includes dressings, drugs and medicines</span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(dressings_drugs_3)' $DISABLED value='Y' CHECKED><span id="permanent_disability_benefit_YL">Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(dressings_drugs_3)' $DISABLED value='N'><span id="permanent_disability_benefit_NL">No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>Administered on an outpatient basis].</span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(outpatient_basis_3)' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(outpatient_basis_3)' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Medical Equipment Rental Expenses for a wheelchair or other medical equipment that has therapeutic value for a Covered Person</p></span>
 
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(rental_expense_3)' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(rental_expense_3)' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span>Medical Services and Supplies</span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(medical_services_supplies_3)' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(medical_services_supplies_3)' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Eyeglasses, contact lenses and hearing aids when damage</p></span>
 
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(lenses_damage_3)' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(lenses_damage_3)' $DISABLED  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Expenses due to an aggravation or re-Injury of a Pre-Existing Condition</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(aggravation_3)' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(aggravation_3)' $DISABLED  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Emergency medical treatment of pregnancy</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(pregnancy_3)' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(pregnancy_3)' $DISABLED  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr>
 
 				<tr>
 					<td class='field' colspan='$COLSPAN' align='left'>
 					<span><p class="labels">Therapeutic termination of pregnancy</p></span>
 					</td>
 					<td colspan='$COLSPAN' align='left'>
 					<span id='ApplicationList_ATTRIBUTE11'>
 					<input type='radio' name='answer(therapeutic_3)' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
 					<input type='radio' name='answer(therapeutic_3)' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 					</td>
 
 				</tr></table></div></td></tr>							
 				<%-----------------------------------------------------------------------------------------------%>								
				<tr><td>
				<div id="classbenefits_in_country_medical_benefits_class3" style="display:none;"><table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
				<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">In Country Medical Benefits</h3></span></td></tr>
				<%-----------------------------------------------------------------------------------------------%>									
				<tr>
					<td class='field'  align='left'>
					<span><p class="labels">Maximum number of days Charges incurred after date of Covered Accident/Sickness</p></span>
					</td>
					<td  align='left'>
					<select class="txtbox">
					<option SELECTED>90</option>
					<option>180</option>
					<option>365</option>
					</select>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Deductible per occurrence </span>
					</td>
					<td  align='left'>
					<span >
					<input type='text' name='' value="100" maxlength='4'  class='txtbox' size='4'  onkeyup="" ></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Coinsurance</span>
					</td>
					<td  align='left'>
					<select class="txtbox">
					<option>50%</option>
					<option>55%</option>
					<option>60%</option>
					<option>65%</option>
					<option>70%</option>
					<option>75%</option>
					<option SELECTED>80%</option>
					<option>85%</option>
					<option>90%</option>
					<option>95%</option>
					<option>100%</option>
					
					</select>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Coinsurance Threshold Amount</span>
					</td>
					<td  align='left'>
					<select class="txtbox">
					<option>$0</option>
					<option>$1000</option>
					<option>$2000</option>
					<option>$2500</option>
					<option>$5000</option>
					<option>$10000</option>
					</select>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Maximum Benefit per Occurrence</span>
					</td>
					<td  align='left'>
					<span >
					<input type='text' name='' value="10000" maxlength='7'  class='txtbox' size='7'  onkeyup="" ></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>									
				<tr>
					<td class='field'  align='left'>
					<span><p class="labels">Maximum Benefit Period from the date of the covered accident or sickness (months)</p></span>
					</td>
					<td  align='left'>
					<select class="txtbox">
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option SELECTED>12</option>
					</select>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Pre-existing Condition Limit</span>
					</td>
					<td  align='left'>
					<select class="txtbox">
					<option>Select</option>
					<option SELECTED>None</option>
					<option>$500 (standard)</option>
					<option>$1000</option>
					<option>$2500</option>
					</select>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Hospital Room and Board Expenses </span>
					</td>
					<td  align='left'>
					<span >
					<input onClick="return displaylabels_incountry_hospital_expense_class3(this)" type='radio' name='answer(incountry_hospital_expense_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input onClick="return displaylabels_incountry_hospital_expense_class3(this)" type='radio' name='answer(incountry_hospital_expense_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								

				<tr id="incountry_hospital_board_expense_perday_class3">
					<td class='field'  align='left'>
					<span class="subfield"  id='incountry_hospital_board_expense_perday_sub3'>Per Day Amount</span>
					</td>
					<td  align='left'>
					<div id="incountry_hospital_board_expense_perday3">
					<select class="txtbox">
					<option>$400 (standard)</option>
					<option>$500</option>
					<option>$600 (standard)</option>
					<option SELECTED> Semi Private</option>
					</select>
					</div>
					</td>

				</tr>	
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Ancillary Hospital Expenses</span>
					</td>
					<td  align='left'>
					<span >
					<input type='radio' name=''  value='Y' CHECKED><span">Yes&nbsp;&nbsp;</span>
					<input type='radio' name=''  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Daily Intensive Care Unit Expenses</span>
					</td>
					<td  align='left'>
					<span >
					<input type='radio'  value='Y' CHECKED><span">Yes&nbsp;&nbsp;</span>
					<input type='radio'  value='N'><span id="permanent_disability_benefit_NL">No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field'  align='left'>
					<span>Medical Emergency Care (room and supplies) Expenses</span>
					</td>
					<td  align='left'>
					<span >
					<input type='radio'  value='Y' CHECKED><span">Yes&nbsp;&nbsp;</span>
					<input type='radio'  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>																												
																		
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>Newborn Nursery Care Expenses</span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>								
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Outpatient Surgical Room and Supply Expenses for use of the surgical facility</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Outpatient diagnostic X-rays, laboratory procedures and tests</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Doctor Non-Surgical Treatment/Examination Expenses (excluding medicines)</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>Doctor's Surgical Expenses</span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>as shown in the Schedule of Benefits</span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">If an Injury or Sickness requires multiple surgical procedures through the same incision,We will pay only one benefit, the largest of the procedures performed.If multiple surgical procedures are performed during the same operative session but through different incisions,We will pay as shown in the Schedule of Benefits for the most expensive procedure and 50% of Covered Expenses for the additional surgeries</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Assistant Surgeon Expenses when Medically Necessary</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Anesthesiologist Expenses for pre-operative screening and administration of anesthesia during a surgical procedure whether on an inpatient or outpatient basis</p></span>

					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Outpatient Laboratory Test Expenses</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>Physiotherapy </span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Include Physical Medicine/Chiropractic/Acupuncture</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>
					
				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Limited to one visit per day.</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Chiropractic Expenses on an inpatient or outpatient basis</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Limited to one visit per day(as shown in the Schedule of Benefits) </p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">X-ray Expenses (including reading charges) but not for dental X-rays</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>


				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Dental Expenses including dental x-rays for the repair or treatment of each injured tooth that is whole, sound and a natural tooth at the time of the Accident</p></span>

					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Includes emergency alleviation of dental pain</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Dental Expenses for impacted wisdom tooth</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED' value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Outpatient Registered Nurse Services if ordered by a Doctor</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Ambulance Expenses for transportation from the emergency site to the Hospital</p></span>

					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>

				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Rehabilitative braces or appliances prescribed by a Doctor</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Prescription Drug Expenses prescribed by a Doctor</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>Includes dressings, drugs and medicines</span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>Administered on an outpatient basis].</span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Medical Equipment Rental Expenses for a wheelchair or other medical equipment that has therapeutic value for a Covered Person</p></span>

					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span>Medical Services and Supplies</span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N'><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Eyeglasses, contact lenses and hearing aids when damage</p></span>

					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Expenses due to an aggravation or re-Injury of a Pre-Existing Condition</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>

				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Emergency medical treatment of pregnancy</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED  value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr>
				<%-----------------------------------------------------------------------------------------------%>
				<tr>
					<td class='field' colspan='$COLSPAN' align='left'>
					<span><p class="labels">Therapeutic termination of pregnancy</p></span>
					</td>
					<td colspan='$COLSPAN' align='left'>
					<span id='ApplicationList_ATTRIBUTE11'>
					<input type='radio' name='' $DISABLED value='Y'><span>Yes&nbsp;&nbsp;</span>
					<input type='radio' name='' $DISABLED value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
					</td>

				</tr></table></div></td></tr>	
				<%-----------------------------------------------------------------------------------------------%>						
 								
 			<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Additional Benefits</h3></span></td></tr>
 																
 			<tr>
 				<td class='field'  align='left'>
 				<span>Chaperone Replacement Benefit</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_chaperone_class3(this)" type='radio' name='answer(chaperone_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_chaperone_class3(this)" type='radio' name='answer(chaperone_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="chaperone_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="chaperone_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 			
 			
 			<tr>
 				<td class='field'  align='left'>
 				<span>Emergency Reunion Benefit I</span>
 				</td>
 
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_emergency_reunion_benefit_class3(this)" type='radio' name='answer(reunion_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_emergency_reunion_benefit_class3(this)" type='radio' name='answer(reunion_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 							
 			</tr>
 			
 			<tr style="display:none;" id="reunion1_distance_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Distance of place of confinement </span>
 				</td>
 
 				<td  align='left'>
 				<div style="display:none;" id="reunion1_distance_control3_class3">
 				<span >
 				<input type='text' name='' value="200" maxlength='3'  class='txtbox' size='3'   onkeyup="" ></span>
 				</div>
 				</td>
 							
 			</tr>
 			
 			<tr style="display:none;" id="reunion1_lodging_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Period for payment of lodging and meals</span>
 				</td>
 
 				<td  align='left'>
 				<div style="display:none;" id="reunion1_lodging_control3_class3">
 				<span >
 				<input type='text' name='' value="7" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 							
 			</tr>
 			
 			<tr style="display:none;" id="reunion1_maximum_benefit_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield" >Benefit Maximum</span>
 				</td>
 
 				<td  align='left'>
 				<div style="display:none;" id="reunion1_maximum_benefit_control3_class3">
 				<span >
 				<input type='text' name='' value="5000" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
 				</div>
 				</td>
 							
 			</tr>
 											
 			
 
 								
 
 
 			<tr>
 				<td class='field'  align='left'>
 				<span>Emergency Reunion Benefit II</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_reunion_benefit2_class3(this)" type='radio' name='answer(reunion3_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_reunion_benefit2_class3(this)" type='radio' name='answer(reunion3_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="reunion3_confinement_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Minimum Period of confinement</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="reunion3_confinement_control3_class3">
 				<span >
 				<input type='text' name='' value="24" maxlength='2'  class='txtbox' size='2' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="reunion3_maximum_benefit_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="reunion3_maximum_benefit_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="reunion3_daily_maximum_benefit_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Daily Maximum Benefit</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="reunion3_daily_maximum_benefit_control3_class3">
 				<span >
 				<input type='text' name='' value="25" maxlength='3'  class='txtbox' size='3' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="reunion3_maximum_days_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Maximum number of days</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="reunion3_maximum_days_control3_class3">
 				<span >
 				<input type='text' name='' value="5" maxlength='3'  class='txtbox' size='2' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 				
 				
 			<tr>
 				<td class='field'  align='left'>
 				<span>Extended Benefit Option</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_extended_benefit_class3(this)" type='radio' name='answer(extended_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_extended_benefit_class3(this)" type='radio' name='answer(extended_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 																				
 			<tr style="display:none;" id="extended_benefit_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="extended_benefit_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 																
 			<tr id="extended_coinsurance_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Coinsurance</span>
 				</td>
 				<td  align='left'>
 				
 				<span >
 				<input type='text' name='' value="" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
 				
 				</td>
 				<td  align='left'>
 				
 				
 				
 				</td>
 			</tr>
 																
 			<tr style="display:none;" id="extended_deductible_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Deductible</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="extended_deductible_control3_class3">
 				<span >
 				<input type='text' name='' value="250" maxlength='3'  class='txtbox' size='3'   onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 												
 			<tr style="display:none;" id="extended_days_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Number of Days after return</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="extended_days_control3_class3">
 				<span >
 				<input type='text' name='' value="30" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 								
 			<tr>
 				<td class='field'  align='left'>
 				<span>Family Reunion Benefit</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_family_reunion_benefit_class3(this)" type='radio' name='family_reunion_benefit_3'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_family_reunion_benefit_class3(this)" type='radio' name='family_reunion_benefit_3'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 								
 																								
 			<tr style="display:none;" id="family_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="family_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 																				
 			<tr style="display:none;" id="family_confinement_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Minimum Period of confinement</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="family_confinement_control3_class3">
 				<span >
 				<input type='text' name='' value="3" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 								
 				<tr>
 				<td class='field'  align='left'>
 				<span>Home Country Benefit I</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_home_country_benefit1_class3(this)" type='radio' name='answer(home_country_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_home_country_benefit1_class3(this)" type='radio' name='answer(home_country_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 				</tr>
 			</tr>
 												
 												 																
 			<tr style="display:none;" id="home1_benefit_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home1_benefit_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 				
 			<tr style="display:none;" id="home1_maximum_days_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield"><p class="subfield">Maximum number of days after returning from a trip</p></span>
 
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home1_maximum_days_control3_class3">
 				<span >
 				<input type='text' name='' value="30" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 								
 			<tr id="extended_days_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Coinsurance</span>
 				</td>
 				<td  align='left'>
 				
 				<span >
 				<input type='text' name='' value="0" maxlength='5'  class='txtbox' size='5'   onkeyup="" ></span>
 				
 				</td>
 				<td  align='left'>
 				
 				
 				</td>
 			</tr>
 								
 			<tr style="display:none;" id="home1_deductible_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Deductible</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home1_deductible_control3_class3">
 				<span >
 				<input type='text' name='' value="5000" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 								
 								
 																
 				
 			<tr style="display:none;" id="home1_extended_benefit_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield"><p class="subfield">Extended Benefit minimum consecutive coverage length(months)</p></span.
 
 
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home1_extended_benefit_control3_class3">
 				<span >
 				<input type='text' name='' value="6" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 			
 			
 			<tr>
 				<td class='field'  align='left'>
 				<span>Home Country Benefit II</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_home_country_benefit3_class3(this)" type='radio' name='answer(home_country_benefit3_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_home_country_benefit3_class3(this)" type='radio' name='answer(home_country_benefit3_3)' i value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 											
 											
 			<tr style="display:none;" id="home3_benefit_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home3_benefit_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5'  id='maximum_benefit_txt' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 											
 											
 			<tr style="display:none;" id="home3_incidental_visit_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield"><p class="subfield">Incidental visit maximum (weeks)</p></span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home3_incidental_visit_control3_class3">
 				<span >
 				<input type='text' name='' value="2" maxlength='2'  class='txtbox' size='2'  id='incidental_visit_txt' onkeyup="" ></span>
 				</div>
 				</td>
 				
 				</tr>
 											
 			<tr style="display:none;" id="home3_maximum_days_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield"><p class="subfield">Maximum number of days after returning</p></span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home3_maximum_days_control3_class3">
 				<span >
 				<input type='text' name='' value="30" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 								
 			</tr>
 											
 			<tr style="display:none;" id="home3_deductible_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Deductible</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<div style="display:none;" id="home3_deductible_control3_class3">
 				<input type='text' name='' value="100" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="home3_extended_benefit_length_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield"><p class="subfield">Extended Benefit minimum consecutive coverage length (months)</p></span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home3_extended_benefit_length_control3_class3">
 				<span >
 				<input type='text' name='' value="6" maxlength='2'  class='txtbox' size='2'   onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 			
 			<tr>
 				<td class='field'  align='left'>
 				<span>Home Country Emergency Benefit</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_home_country_emergency_benefit_class3(this)" type='radio' name='answer(home_country_emergency_benefit_3)'  value='Y'/><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_home_country_emergency_benefit_class3(this)" type='radio' name='answer(home_country_emergency_benefit_3)'  value='N' CHECKED/><span>No&nbsp;&nbsp;</span></span>
 				</td>		
 										
 													
 			</tr>
 			
 			<tr style="display:none;" id="home_emegency_benefit_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_emegency_benefit_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="home_emergency_coinsurance_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Coinsurance</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_emergency_coinsurance_control3_class3">
 				<span >
 				<input type='text' name='' value="0" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="home_emergency_deductible_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Deductible</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_emergency_deductible_control3_class3">
 				<span >
 				<input type='text' name='' value="100" maxlength='3'  class='txtbox' size='3'   onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="home_emergency_maximum_duration_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Maximum Duration (days)</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_emergency_maximum_duration_control3_class3">
 				<span >
 				<input type='text' name='' value="30" maxlength='2'  class='txtbox' size='2'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 			
 			<tr>
 				<td class='field'  align='left'>
 				<span>Home Country Extension Benefit</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_home_country_extension_benefit_class3(this)" type='radio' name='answer(home_country_extension_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_home_country_extension_benefit_class3(this)" type='radio' name='answer(home_country_extension_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>	
 											
 			<tr style="display:none;" id="home_country_extension_maximum_benefit_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</div>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_country_extension_maximum_benefit_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
 				</td>
 				
 			</tr>
 			<tr style="display:none;" id="home_country_extension_coinsurance_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Coinsurance</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_country_extension_coinsurance_control3_class3">
 				<span >
 				<input type='text' name='' value="0" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 			
 			<tr style="display:none;" id="home_country_extension_period_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Extension Period (months)</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_country_extension_period_control3_class3">
 				<span >
 				<input type='text' name='' value="3" maxlength='1'  class='txtbox' size='1' onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 			
 			<tr style="display:none;" id="home_country_extension_deductible_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Deductible</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="home_country_extension_deductible_control3_class3">
 				<span >
 				<input type='text' name='' value="100" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 								
 			
 			<tr>
 				<td class='field'  align='left'>
 				<span>Lost Baggage Benefit</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_lost_baggage_benefit_class3(this)" type='radio' name='answer(Lost_Baggage_Benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_lost_baggage_benefit_class3(this)" type='radio' name='answer(Lost_Baggage_Benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 								
 			<tr style="display:none;" id="lost_baggage_benefit_maximum_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Benefit Maximum</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="lost_baggage_benefit_maximum_control3_class3">
 				<span >
 				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5'   onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>
 								
 			<tr style="display:none;" id="lost_baggage_personal_hygiene_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield"><p class="subfield">Clothers and Personal Hygiene items included</p></span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="lost_baggage_personal_hygiene_control3_class3">
 				<span >
 				<input type='radio' name='answer(clothers_personal_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
 				<input type='radio' name='answer(clothers_personal_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
 				</div>
 				</td>
 				
 			</tr>
 																				
 												
 			<tr style="display:none;" id="lost_baggage_deductible_row3_class3">
 				<td class='field'  align='left'>
 				<span class="subfield">Deductible</span>
 				</td>
 				<td  align='left'>
 				<div style="display:none;" id="lost_baggage_deductible_control3_class3">
 				<span >
 				<input type='text' name='' value="100" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
 				</div>
 				</td>
 				
 			</tr>	
 			
 			
 			
 			<tr>
 				<td class='field'  align='left'>
 				<span>Personal Property and/or Financial Instrument Reimbursement Benefit</span>
 				</td>
 				<td  align='left'>
 				<span >
 				<input onClick="return displaylabels_personal_property_financial_reimbursement_class3(this)" type='radio' name='answer(personal_property_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
 				<input onClick="return displaylabels_personal_property_financial_reimbursement_class3(this)" type='radio' name='answer(personal_property_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
 				</td>
 				
 			</tr>
 
 			<tr style="display:none;" id="personal_property_covered_peril_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Directly caused by a Covered Peril</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_covered_peril_control3_class3">
				<span >
				<input type='radio' name='answer(covered_peril_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(covered_peril_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>
							
			</tr>
			
			
			<tr style="display:none;" id="personal_property_deductible_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Deductible</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_deductible_control3_class3">
				<span >
				<input type='text' name='' value="500" maxlength='4'  class='txtbox' size='4' onkeyup="" ></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_goods_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Personal Goods or Effects</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_goods_control3_class3">
				<span >
				<input type='radio' name='answer(personal_goods_effects_3)' value='Y' CHECKED><span>Goods&nbsp;&nbsp;</span>
				<input type='radio' name='answer(personal_goods_effects_3)' $DISABLED' value='N'><span>Effects&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_benefit_maximum_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Personal Property Benefit Maximum</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_benefit_maximum_control3_class3">
				<span >
				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
				</div>
				</td>

			</tr>

				<tr style="display:none;" id="personal_property_benefit_articles_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Benefit Maximum for Any One or Set of Articles</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_benefit_articles_control3_class3">
				<span >
				<input type='text' name='' value="350" maxlength='5'  class='txtbox' size='5'   onkeyup="" ></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_financial_instrument_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Financial Instrument Benefit Maximum</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_financial_instrument_control3_class3">
				<span >
				<input type='text' name='' value="1000" maxlength='5'  class='txtbox' size='5' onkeyup="" ></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_cash_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Benefit Maximum for Cash</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_cash_control3_class3">
				<span >
				<input type='text' name='' value="500" maxlength='4'  class='txtbox' size='4'  onkeyup="" ></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_exclusions_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Exclusions</span>
				</td>
			</tr>

			<tr style="display:none;" id="personal_property_payment_limit_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Payment Limit with respect to any one article or set of articles.</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_limit_control3_class3">
				<span >
				<input type='radio' name='answer(payment_limit_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(payment_limit_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_maximum_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Maximum</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_maximum_control3_class3">
				<span >
				<input type='text' name='' value="500" maxlength='4'  class='txtbox' size='4'  onkeyup="" ></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_vehicles_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Vehicles</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_vehicles_control3_class3">
				<span >
				<input type='radio' name='answer(Vehicles_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(Vehicles_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_accessories_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Include accessories or equipment</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_accessories_control3_class3">
				<span >
				<input type='radio' name='answer(include_accessories_3)' value='Y'><span id="home_country_benefit_YL">Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(include_accessories_3)' value='N' CHECKED><span id="home_country_benefit">No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_aircraft_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Include aircraft and other conveyances</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_aircraft_control3_class3">
				<span >
				<input type='radio' name='answer(aircraft_conveyances_include_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(aircraft_conveyances_include_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_loss_due_to_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Loss or damage due to:</span>
				</td>
			</tr>

			<tr style="display:none;" id="personal_property_payment_insects_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield" ><p class="subfield">Moth, vermin, insects or other animals</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_insects_control3_class3">
				<span >
				<input type='radio' name='answer(insects_other_animals_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(insects_other_animals_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_payment_climatic_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Wear and tear; atmospheric or climatic conditions or gradual deterioration or defective materials or craftsmanship</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_climatic_control3_class3">
				<span >
				<input type='radio' name='answer(atmospheric_climatic_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(atmospheric_climatic_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_craftsmanship_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Include Latent defective materials or craftmanship</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_craftsmanship_control3_class3">
				<span >
				<input type='radio' name='answer(defective_craftmanship_3)' id='home_country_benefit_Y' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(defective_craftmanship_3)' id='home_country_benefit_N' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_machanical_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Mechanical or electrical failure</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_machanical_control3_class3">
				<span >
				<input type='radio' name='answer(mechanical_electrical_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(mechanical_electrical_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_inherent_vice_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Include inherent vice</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_inherent_vice_control3_class3">
				<span >
				<input type='radio' name='answer(inherent_vice_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(inherent_vice_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_breaking_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Breaking, marring, scratching, wet or dampness, spoilage, being discolored, mold mildew, rust, frost, steam, mishandling, improper packing, improper stowage or rough handling</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_breaking_control3_class3">
				<span >
				<input type='radio' name='answer(rough_handling_3)' id='home_country_benefit_Y' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(rough_handling_3)' id='home_country_benefit_N' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_reparing_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Any process of cleaning, restoring, repairing or alteration</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_reparing_control3_class3">
				<span >
				<input type='radio' name='answer(repairing_alteration_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(repairing_alteration_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_payment_reasonable_proportion_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">More than a reasonable proportion of the total value of the set where the loss or damaged article is part of a set or pair.</p></span>				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_reasonable_proportion_control3_class3">
				<span >
				<input type='radio' name='answer(reasonable_proportion_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(reasonable_proportion_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_currency_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Currency</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_currency_control3_class3">
				<span >
				<input type='radio' name='answer(currency_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(currency_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_perishable_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Coins, deeds, bullion, stamps, securities, tickets, documents and perishables</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_perishable_control3_class3">
				<span >
				<input type='radio' name='answer(documents_perishable_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(documents_perishable_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_devaluation_money_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Devaluation of currency or shortages due to errors or omissions during monetary transactions</p></span>
				</div>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_devaluation_money_control3_class3">
				<span >
				<input type='radio' name='answer(errors_monetary_transaction_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(errors_monetary_transaction_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_more_than_500_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">More than $500 with respect to cash</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_more_than_500_control3_class3">
				<span >
				<input type='radio' name='answer(more_than_500_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(more_than_500_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_loss_not_reported_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Any loss not reported to either the police or transport carrier within 34 hours of discovery</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_loss_not_reported_control3_class3">
				<span >
				<input type='radio' name='answer(loss_not_reported_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(loss_not_reported_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>



			<tr style="display:none;" id="personal_property_payment_confiscation_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Any loss due to confiscation or detention by customs or any other authority</p></span>
				</div>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_confiscation_control3_class3">
				<span >
				<input type='radio' name='answer(confiscation_detention_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(confiscation_detention_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_war_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Any loss or damage directly or indirectly caused by declared or undeclared war or any act thereof</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_war_control3_class3">
				<span >
				<input type='radio' name='answer(war_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(war_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_laptop_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Laptop computers</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_laptop_control3_class3">
				<span >
				<input type='radio' name='answer(laptop_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(laptop_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_furniture_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Household furniture</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_furniture_control3_class3">
				<span >
				<input type='radio' name='answer(household_furniture_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(household_furniture_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_payment_eyeglasses_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Eyeglasses</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_eyeglasses_control3_class3">
				<span >
				<input type='radio' name='answer(eyeglasses_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(eyeglasses_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>




			<tr style="display:none;" id="personal_property_payment_contact_lenses_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Contact lenses</span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_contact_lenses_control3_class3">
				<span >
				<input type='radio' name='answer(contact_lenses_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(contact_lenses_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_teeth_care_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Artificial teeth or limbs</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_teeth_care_control3_class3">
				<span >
				<input type='radio' name='answer(artificial_teeth_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(artificial_teeth_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>



			<tr style="display:none;" id="personal_property_payment_care_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Property while in the care, custody, or control of any common carrier</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_care_control3_class3">
				<span >
				<input type='radio' name='answer(property_care_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(property_care_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>



			<tr style="display:none;" id="personal_property_payment_mysterious_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Loss or damage due to unexplained or mysterious disappearance</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_mysterious_control3_class3">
				<span >
				<input type='radio' name='answer(loss_damage_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(loss_damage_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_payment_unexplained_shortage_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Include unexplained shortage, or shortage disclosed by taking inventory].</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_unexplained_shortage_control3_class3">
				<span >
				<input type='radio' name='answer(unexplained_shortage_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input  type='radio' name='answer(unexplained_shortage_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_loss_theft_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Loss or damage due to theft unless reported to the police or competent authority</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_loss_theft_control3_class3">
				<span >
				<input  type='radio' name='answer(loss_theft_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input  type='radio' name='answer(loss_theft_3)' ' value='N'><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_jewelry_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Jewelry, furs, fine arts and antiques</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_jewelry_control3_class3">
				<span >
				<input type='radio' name='answer(Jewelry_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(Jewelry_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_audiovisual_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Audiovisual equipment, slide projectors, televisions, overhead projectors</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_audiovisual_control3_class3">
				<span >
				<input type='radio' name='answer(audiovisual_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(audiovisual_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_foodstuffs_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Foodstuffs, liquor, medication, pharmaceutical goods, and plants.</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_foodstuffs_control3_class3">
				<span >
				<input type='radio' name='answer(foodstuffs_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(foodstuffs_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_animal_mounts_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Animal mounts or other products of taxidermy</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_animal_mounts_control3_class3">
				<span >
				<input type='radio' name='answer(animal_mounts_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(animal_mounts_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>



			<tr style="display:none;" id="personal_property_payment_sound_equipments_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Cellular telephones, citizen band radios, tape players, radar detectors, radio and other sound reproducing or receiving equipment</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_sound_equipments_control3_class3">
				<span >
				<input type='radio' name='answer(sound_equipments_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(sound_equipments_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_firearm_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Firearms, ammunitions, holsters, firearm paraphernalia</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_firearm_control3_class3">
				<span >
				<input type='radio' name='answer(firearm_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(firearm_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_mobile_equipment_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Motor vehicles, including motorcycles and mobile equipment</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_mobile_equipment_control3_class3">
				<span >
				<input type='radio' name='answer(mobile_equipment_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(mobile_equipment_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>



			<tr style="display:none;" id="personal_property_payment_war_action_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Hostile or war like action in time of peace or war</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_war_action_control3_class3">
				<span >
				<input type='radio' name='answer(war_action_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(war_action_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>

			<tr style="display:none;" id="personal_property_payment_weapon_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Any weapon of war employing atomic fission or radioactive force whether in time of peace or war</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_weapon_control3_class3">
				<span >
				<input type='radio' name='answer(weapon_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(weapon_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_insurrection_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Insurrection, rebellion, revolution, civil war, usurped power, or action taken by governmental authority in hindering, combating or defending against such an occurrence, seizure or destruction under quarantine or custom regulations, confiscation by order of any government or public authority, or risks of contraband or illegal transportation or trade</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_insurrection_control3_class3">
				<span >
				<input type='radio' name='answer(insurrection_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(insurrection_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_war_nuclear_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Nuclear reaction or nuclear radiation or radioactive contamination</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_war_nuclear_control3_class3">
				<span >
				<input type='radio' name='answer(nuclear_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(nuclear_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_breakage_indirect_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Breakage of glass, unless the breakage is the direct result of a covered loss</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_breakage_indirect_control3_class3">
				<span >
				<input type='radio' name='answer(breakage_indirect_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(breakage_indirect_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_loss_destructon_parking_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Loss or destruction of property resulting from voluntarily giving someone else possession of your property, other than to a parking valet or service technician for the purpose of parking, servicing, or repairing an automobile, truck or van.</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_loss_destructon_parking_control3_class3">
				<span >
				<input type='radio' name='answer(loss_destruction_parking_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(loss_destruction_parking_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_loss_commercial_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Loss or destruction of property while a rented vehicle is being used for commercial purpose.</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_loss_commercial_control3_class3">
				<span >
				<input type='radio' name='answer(loss_commercial_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(loss_commercial_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_war_loss_loading_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Loss or damage to property which occurs while loading or unloading a rented vehicle unless such loss or damage is the result of a covered loss.</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_war_loss_loading_control3_class3">
				<span >
				<input type='radio' name='answer(loss_loading_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(loss_loading_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>


			<tr style="display:none;" id="personal_property_payment_loss_vehicle_fictitious_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Loss or damage occurring subsequent to a vehicle being obtained under a fictitious name, address, other false identification, or other fraudulent means or misrepresentation.</p></span>
				</td>
				<td  align='left'>
				<div style="display:none;" id="personal_property_payment_loss_vehicle_fictitious_control3_class3">
				<span >
				<input type='radio' name='answer(loss_vehicle_fictitious_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(loss_vehicle_fictitious_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</div>
				</td>

			</tr>
			
 			<tr>
				<td class='field'  align='left'>
				<span>Political Evacuation Benefit</span>
				</td>
				<td  align='left'>
				<span >
				<input onClick="return display_Political_Evacuation_Class3(this)" type='radio' name='answer(political_evacuation_benefit_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input onClick="return display_Political_Evacuation_Class3(this)" type='radio' name='answer(political_evacuation_benefit_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>

			</tr>


			<tr style="display:none;" id="Political_Benefit_Maximum_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Benefit Maximum</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="Political_Benefit_Maximum_control3_class3">
				<input type='text' name='' value="10000" maxlength='6'  class='txtbox' size='6'  onkeyup="" ></span>
				</td>
				
			</tr>


			<tr style="display:none;" id="IncludesNaturalDisasterCoverage_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Includes Natural Disaster Coverage</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="IncludesNaturalDisasterCoverage_control3_class3">
				<input type='radio' name='answer(disaster_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(disaster_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>


			<tr style="display:none;" id="IncludesKidnapping_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Includes Kidnapping and Missing Person Coverage</p></span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="IncludesKidnapping_control3_class3">
				<input type='radio' name='answer(kidnapping_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(kidnapping_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>


			<tr style="display:none;" id="ConsultingServices_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Consulting Services seeking information on Missing Person or kidnapping Covered</p></span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="ConsultingServices_control3_class3">
				<input type='radio' name='answer(information_kidnapping_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(information_kidnapping_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>



			<tr>
				<td class='field'  align='left'>
				<span><p calss="labels">Return Minor Child(ren) Benefit</span>

				</td>
				<td  align='left'>
				<span >
				<input onClick="return display_minor_children_benefit_Class3(this)" type='radio' name='answer(minor_children_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input onClick="return display_minor_children_benefit_Class3(this)" type='radio' name='answer(minor_children_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>

			</tr>


			<tr style="display:none;" id="ReturnMinorBenefitMaximum_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Benefit Maximum</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="ReturnMinorBenefitMaximum_control3_class3">
				<input type='text' name='' value="5000" maxlength='5'  class='txtbox' size='5'  onkeyup="" ></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="Minimum_Hospital_Confinement_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Minimum Hospital confinement period Applies</p></span>

				</td>
				<td  align='left'>
				<span style="display:none;" id="Minimum_Hospital_Confinement_control3_class3">
				<input onClick="return display_hospital_confinement_period_class3(this)" type='radio' name='answer(hospital_confinement_period_3)' value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input onClick="return display_hospital_confinement_period_class3(this)" type='radio' name='answer(hospital_confinement_period_3)' value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>


			<tr style="display:none;" id="Minimum_Hospital_Confinement_Period_row3_class3">
				<td class='field'  align='left'>
				<span class="secondsubfield"><p class="subfield">Minimum Hospital confinement period(hours)</p></span>

				</td>
				<td  align='left'>
				<span style="display:none;" id="Minimum_Hospital_Confinement_Period_control3_class3">
				<input type='text' name='' value="34" maxlength='3'  class='txtbox' size='3'  onkeyup="" ></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="EvacuatonCovered_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Evacuation Covered</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="EvacuatonCovered_control3_class3" >
				<input type='radio' name='answer(evacuation_covered_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(evacuation_covered_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="To_Another_Location_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">To another location</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="To_Another_Location_control3_class3">
				<input type='radio' name='answer(to_another_location_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(to_another_location_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="To_Home_Country_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">To home country</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="To_Home_Country_control3_class3">
				<input type='radio' name='answer(to_home_country_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(to_home_country_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="ReImburement_Of_Ground_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">Reimburement of ground transportation ticket</p></span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="ReImburement_Of_Ground_control3_class3">
				<input  type='radio' name='answer(reimburement_transportation_3)' value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input  type='radio' name='answer(reimburement_transportation_3)' value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="Return_Destination_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Return destination</span>
				</td>

				<td  align='left'>
				<select style="display:none;" id="Return_Destination_control3_class3" class="txtbox">
				<option SELECTED>Principal Residence</option>
				<option>Home Country</option>
				</select>
				</td>
				
			</tr>



			<tr>
				<td class='field'  align='left'>
				<span>Trip Cancellation Benefit</span>
				</td>
				<td  align='left'>
				<span >
				<input onClick="return display_trip_cancellation_benefit_class3(this)" type='radio' name='answer(trip_cancellation_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input onClick="return display_trip_cancellation_benefit_class3(this)" type='radio' name='answer(trip_cancellation_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>

			</tr>


			<tr style="display:none;" id="Trip_Cancellation_Benefit_Maximum_row3_class3">
				
				<td class='field'  align='left'>
				<span class="subfield">Benefit Maximum</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="Trip_Cancellation_Benefit_Maximum_control3_class3">
				<input type='text' name='' value="5000" maxlength='5'  class='txtbox' size='5'   onkeyup="" ></span>
				</td>
				
			</tr>


			<tr style="display:none;" id="Covered_Persons_Children_Included_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Covered Person's children included</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="Covered_Persons_Children_Included_control3_class3">
				<input type='radio' name='answer(children_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(children_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>


			<tr style="display:none;" id="Covered_Persons_Grandparents_Included_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Covered Person's Grandparents included</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="Covered_Persons_Grandparents_Included_control3_class3">
				<input type='radio' name='answer(grandchildren_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(grandchildren_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr>
				<td class='field'  align='left'>
				<span>Trip Interruption Benefit</span>
				</td>
				<td  align='left'>
				<span >
				<input onClick="return display_trip_interruption_benefit_class3(this)" type='radio' name='answer(trip_interruption_benefit_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input onClick="return display_trip_interruption_benefit_class3(this)" type='radio' name='answer(trip_interruption_benefit_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>

			</tr>


			<tr style="display:none;" id="TripInterruption_Benefit_Maximum_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Benefit Maximum</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="TripInterruption_Benefit_Maximum_control3_class3">
				<input type='text' name='' value="5000" maxlength='5'  class='txtbox' size='5'   onkeyup="" ></span>
				</td>
				
				
				</tr>

				<tr style="display:none;" id="Inclusions_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Inclusions:</span>
				</td>
			</tr>


			<tr style="display:none;" id="TheDeathofaFamily_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">the death of a Family Member</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="TheDeathofaFamily_control3_class3">
				<input type='radio' name='answer(death_family_member_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(death_family_member_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="UnforeseenInjury_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">the unforeseen Injury [or Sickness] of the Covered Person or a Family Member.</p> </span>

				</td>
				<td  align='left'>
				<span style="display:none;" id="UnforeseenInjury_control3_class3">
				<input type='radio' name='answer(injury_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(injury_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="SubstancialDestructionoftheCoveredPersons_row3_class3">
				<td class='field'  align='left'>
				<span class=subfield"><p class="subfield">substantial destruction of the Covered Person's principal residence by fire or weather related activity</p></span>

				</td>
				<td  align='left'>
				<span style="display:none;" id="SubstancialDestructionoftheCoveredPersons_control3_class3">
				<input  type='radio' name='answer(destruction_weather_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input  type='radio' name='answer(destruction_weather_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="AMedicallyNecessaryCoveredEmergency_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield"><p class="subfield">a Medically Necessary covered Emergency Medical Evacuation to return the Covered Person to his or her Home &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country or to the area from which he or she was initially evacuated for continued treatment,recuperation and recovery of an Injury [or Sickness]</p></span>

				</td>
				<td  align='left'>
				<span style="display:none;" id="AMedicallyNecessaryCoveredEmergency_control3_class3">
				<input  type='radio' name='answer(emergency_medical_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input  type='radio' name='answer(emergency_medical_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>

			<tr style="display:none;" id="TripInterruption_Covered_Person_Children_Included_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Covered Person's children included</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="TripInterruption_Covered_Person_Children_Included_control3_class3">
				<input type='radio' name='answer(childrenincluded_3)'  value='Y' CHECKED><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(childrenincluded_3)'  value='N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
			</tr>




			<tr style="display:none;" id="TripInterruption_Covered_Person_Grandparents_Included_row3_class3">
				<td class='field'  align='left'>
				<span class="subfield">Covered Person's Grandparents included</span>
				</td>
				<td  align='left'>
				<span style="display:none;" id="TripInterruption_Covered_Person_Grandparents_Included_control3_class3">
				<input type='radio' name='answer(grandparentsincluded_3)'  value='Y'><span>Yes&nbsp;&nbsp;</span>
				<input type='radio' name='answer(grandparentsincluded_3)'  value='N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				

			</tr>	
 				
 			
 			<tr><td>&nbsp;</td></tr>							
 			<tr><td colspan="" >&nbsp;&nbsp;</td></tr>
 				<tr><td colspan="" >&nbsp;&nbsp;</td></tr>
 			 <tr>
			 <%
				session.setAttribute("QuoteProposal","Create Quote Proposal");
				session.setAttribute("quotestatus","In Progress");
			 %>
			 <td align="right"> <input type="submit" name="answer(button)" value="Save" class="covbutton"></td></tr>
			 <tr><td colspan="" >&nbsp;&nbsp;</td></tr>
			 </table>
			</div>
 
