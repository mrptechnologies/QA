

<style>
	.classhazards .field{float:left;width:250px;height:5px;padding:7px 0 0 10px;margin:3px 0 3px 10px;font-size:12px;text-align:left;}
	.classhazards .subfield{float:left;margin:0 0 0 20px;padding:0;width:250px;}
	.classhazards .secondsubfield{margin:0 0 0 40px;}
	.classhazards p.secondsubfields{float:left;margin:0 0 0 40px;padding:0;width:250px;}
	.classhazards p.subfields{float:left;margin:0 0 0 20px;padding:0;width:250px;}
	.classhazards { margin:0 0 0 100px; }
</style>


<SCRIPT type="text/javascript" SRC="scripts/classhazardsclass1.js"> </SCRIPT>

<div class="classhazards">
<table BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
				<tr>
					<td width="55%" align="left"><h3 style="margin:20px 0 0 0px;padding:0;">Class Hazards</h3></td>
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>
				<tr><td><table>
						<tr><td  align='left'><span><p style="margin:0px;padding:0px;text-align:left;width:200px;">Class Name</p></span></td>
    						    <td align='left'><span>Class&nbsp;1</span></td>
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
				
				<tr>
				<td class='field' align='Right'>
				<span>Travel (24 Hour)</span>
				</td>
				
				<td align='left'>
				<span>
				<input onClick="return display_travel_tour_24_class1(this)" type='radio' name='answer(travel_24hour_class1)' id='travel_24hour_class1_Y' value='Y'>Yes&nbsp;&nbsp;
				<input onClick="return display_travel_tour_24_class1(this)" type='radio' name='answer(travel_24hour_class1)' id='travel_24hour_class1_N'  value='N' CHECKED>No&nbsp;&nbsp;</span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				<%-----------------------%>
				<tr style="display:none;" id ="row1" >
				<td class='field' align='Right'>
				<span class="subfield" >Specified Trip only</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="specified_trip_class1">
				<input type='radio' onClick="return displaySpecifiedTrip(this)" name='answer(specified_trip_class1)'  id='specified_trip_class1_Y'  value='Y'><span id="specified_trip_class1_YL">Yes&nbsp;</span>&nbsp;
				<input type='radio' onClick="return displaySpecifiedTrip(this)" name='answer(specified_trip_class1)'  id='specified_trip_class1_N' value='N' CHECKED><span id="specified_trip_class1_NL">No&nbsp;&nbsp;</span>
				</span></td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				
				<tr style="display:none;" id ="subrow1" >
				<td class='field' align='Right'>
				<span class="secondsubfield" >Coverage starts at actual start of trip</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="coverageTripStart">
				<input type='radio' name='answer(coverageStart)'  id='coverageTripStart_Y'  value='Y' CHECKED><span>Yes&nbsp;</span>&nbsp;
				<input type='radio' name='answer(coverageStart)'  id='coverageTripStart_N' value='N' ><span>No&nbsp;&nbsp;</span>
				</span></td>
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				
				<tr style="display:none;" id ="subrow2" >
				<td class='field' align='Right'>
				<span class="secondsubfield" >Type of Travel</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="travelType">
				<input type='radio' name='answer(travelType)'  id='travelType_Business'  value='Business' CHECKED><span>Business&nbsp;</span>&nbsp;
				<input type='radio' name='answer(travelType)'  id='travelType_Pleasure' value='Bus_Pleasure' ><span>Business & Pleasure&nbsp;&nbsp;</span>
				</span></td>
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>	
				
				<tr style="display:none;" id ="row2" >
				<td class='field' align='Right'>
				<span class="subfield" >Type of Loss or Injury</span>
				</td>
				
				<td  align='left'>
				<span style="display:none;" id="type_of_loss_injury_class1">
				<select>
					<option>Accident</option>
					<option>Accident & Sickness</option>
				</select>
				</span></td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr  style="display:none;" id ="row3" >
				<td class='field' align='Right'>
				<span class="subfield" >Type of Travel</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="type_of_travel_class1">
				<select>
					<option>Business</option>
					<option>Business & Pleasure</option>
				</select>
				</span></td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id ="row4">
				<td class='field' align='Right'>
				<span class="subfield" >Place of Travel</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="place_of_travel_class1">
				<select style="width:125px;">
					<option>Outside of the United States</option>
					<option>Away from the Covered Person&#44;s Home Country</option>
					<option SELECTED>Worldwide</option>
				</select>
				</span></td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" align='left' id ="row5">
				<td class='field' align='Right'>
				<span class="subfield" >Length of Stay (months)</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="length_of_stay_class1">
				<select id='length_of_stay_select_class1'>
					<option>Select</option>
					<option SELECTED><3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select></span></td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span id='commuting'>Commuting</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(commuting_class1)'  id='commuting_class1_Y' value='commuting_class1_Y'><span id="commuting_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(commuting_class1)'  id='commuting_class1_N' value='commuting_class1_N' CHECKED><span id="commuting_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span id='exposure_and_disappearnace'>Exposure and Disappearance </span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(exposure_and_disappearnace_class1)'  id='exposure_and_disappearnace_class1_Y' value='exposure_and_disappearnace_class1_Y' CHECKED><span id="exposure_and_disappearnace_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(exposure_and_disappearnace_class1)'  id='exposure_and_disappearnace_class1_N' value='exposure_and_disappearnace_class1_N' ><span id="exposure_and_disappearnace_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span id='family_accompanying_the_insured'>Family Accompanying the Insured</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(family_accompanying_the_insured_class1)'  id='family_accompanying_the_insured_class1_Y' value='family_accompanying_the_insured_class1_Y'><span id="family_accompanying_the_insured_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(family_accompanying_the_insured_class1)'  id='family_accompanying_the_insured_class1_N' value='family_accompanying_the_insured_class1_N' CHECKED><span id="family_accompanying_the_insured_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span id='family_reaction_trip'>Family Relocation Trip </span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(family_reaction_trip_class1)'  id='family_reaction_trip_class1_Y' value='family_reaction_trip_class1_Y'><span id="family_reaction_trip_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(family_reaction_trip_class1)'  id='family_reaction_trip_class1_N' value='family_reaction_trip_class1_N' CHECKED><span id="family_reaction_trip_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span id='full_occupational'>Full Occupational  </span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' onClick="return displayOccupational1(this)" name='answer(full_occupational_class1)'  id='full_occupational_class1_Y' value='full_occupational_class1_Y'><span id="full_occupational_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' onClick="return displayOccupational1(this)" name='answer(full_occupational_class1)'  id='full_occupational_class1_N' value='full_occupational_class1_N' CHECKED><span id="full_occupational_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				
				<tr style="display:none;" id ="occupationRow1" >
				<td class='field' align='Right'>
				<span class="subfield" >Does a Business trip need to be authorized by the Policyholder?</span>
				</td>
				<td align='left'>
				<span style="display:none;" id="authorizedTrip">
				<input type='radio'  name='answer(authorizedTrip)'  id='authorizedTripY'  value='Y' CHECKED>Yes&nbsp;&nbsp;
				<input type='radio'  name='answer(authorizedTrip)'  id='authorizedTripN' value='N' >No&nbsp;&nbsp;
				</span></td>
				</tr>
				
				<tr style="display:none;" id ="occupationRow2" >
				<td class='field' align='Right'>
				<span class="subfield" >Coverage starts at actual start of trip</span>
				</td>
				<td align='left'>
				<span style="display:none;" id="coverageStartofTrip">
				<input type='radio'  name='answer(coverageStartofTrip)'  id='coverageStartofTripY'  value='Y' CHECKED>Yes&nbsp;&nbsp;
				<input type='radio'  name='answer(coverageStartofTrip)'  id='coverageStartofTripN' value='N' >No&nbsp;&nbsp;
				</span></td>
				</tr>
				
				<tr>
				<td class='field' align='Right'>
				<span id='hijacking_air_piracy'>Hijacking and Air Piracy</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(32)'  id='hijacking_air_piracy_class1_Y' value='hijacking_air_piracy_class1_Y'><span id="hijacking_air_piracy_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(32)'  id='hijacking_air_piracy_class1_N' value='hijacking_air_piracy_class1_N' CHECKED><span id="hijacking_air_piracy_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span id='non_employee_director'>Non-Employee Director</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(35)'  id='non_employee_director_class1_Y' value='non_employee_director_class1_Y'><span id="non_employee_director_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(35)'  id='non_employee_director_class1_N' value='non_employee_director_class1_N' CHECKED><span id="non_employee_director_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				
				</tr>
				
				<tr><td>&nbsp;</td></tr>
				<tr>
				<td class='field' align='Right'>
				<span id='private_passenger_automobile'>Private Passenger Automobile </span>
				</td>
				
				<td align='left'>
				<span>
				<input onclick="return display_private_passenger_class1(this)" type='radio' name='answer(38)'  id='private_passenger_automobile_class1_Y' value='private_passenger_automobile_class1_Y'><span id="private_passenger_automobile_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input onclick="return display_private_passenger_class1(this)" type='radio' name='answer(38)'  id='private_passenger_automobile_class1_N' value='private_passenger_automobile_class1_N' CHECKED><span id="private_passenger_automobile_class2_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="type_of_travel_private">
					<td class='field' align='Right'>
					<span class="subfield" style="display:none;" id='type_of_travel_private_passenger'>Type of Travel</span>
				</td>
				
				<td align='left'>
				<div id="type_of_travel_private_class1" style="display:none;">
				<span>
				<select>
					<option SELECTED>Business</option>
					<option>Business & Pleasure</option>
				</select>
				</span>
				</div>
				</td>
				
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr id="sponsered">
				<td class='field' align='Right'>
				<span id='sponsered_activities'>Sponsored Activities</span>
				</td>
				
				<td align='left'>
				<span>
				<input onclick="return display_sponsered_activities_class1(this)" type='radio' name='answer(41)' id='sponsered_activities_class1_Y' value='sponsered_activities_class1_Y'><span id="sponsered_activities_class1_YL">Yes&nbsp;&nbsp;</span>			
				<input onclick="return display_sponsered_activities_class1(this)" type='radio' name='answer(41)' id='sponsered_activities_class1_N' value='sponsered_activities_class1_N' CHECKED><span id="sponsered_activities_class1_NL">No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>		
				<tr style="display:none;" id="include_travel">
				<td class='field' align='Right'>
				<span class="subfield" style="display:none;" id='include_travel_coverage'>Include Travel Coverage</span>
				</td>
				
				<td align='left'>
				<div id="include_travel_coverage_class1" style="display:none;">
				<span>
				<input onclick="return display_include_travel_class1(this)" type='radio' name='answer(44)' id='include_travel_coverage_class1_Y' value='include_travel_coverage_class1_Y'><span id="include_travel_coverage_class1_Y">Yes&nbsp;&nbsp;</span>			
				<input onclick="return display_include_travel_class1(this)" type='radio' name='answer(44)' id='include_travel_coverage_class1_N' value='include_travel_coverage_class1_N' CHECKED><span id="include_travel_coverage_class1_N">No&nbsp;&nbsp;</span></span>
				</div>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>
				<tr style="display:none;" id="licensed">
				<td class='field' align='Right'>
				<span class="secondsubfield" style="display:none;" id='licensed_driver'>Licenced driver must be greater than</span>
				</td>
				
				<td align='left'>
				<span>
				<select style="display:none;" id='licensed_driver_class1'>
					<option>Select</option>
					<option>19</option>
					<option>21</option>
					<option>23</option>
					<option>24</option>
					<option>25</option>
				</select></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="travel_time">
				<td class='field' align='Right'>
				<span class="secondsubfield" style="display:none;" id='travel_time_maximum'>Travel time maximum (hours)</span>
				</td>
				
				<td align='left'>
				<span>
				<input style="display:none;" type="text" class="txt_box" id="travel_time_maximum_txt_class1" size="2" maxLength="2"/>
				</select></span>
				</td>
				
				
				</tr>
				
				<tr id="24_Hour">
				<td class='field' align='Right'>
				<span id='24_hours'>24 Hour</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' name='answer(47)' value='24_hour_class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(47)' value='24_hour_class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr><td>&nbsp;</td></tr>
				<tr>
				<td class='field' align='Right'>
				<span>Owned Aircraft</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' onclick="display_aircraft_typeoftravel_class1(this)" name='answer(Own_AirCraft_class1)'  id="Own_AirCraft_class1_Y" value='Own_AirCraft_class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' onclick="display_aircraft_typeoftravel_class1(this)" name='answer(Own_AirCraft_class1)'  id="Own_AirCraft_class1_N" value='Own_AirCraft_class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Own_TypeofTravel_Row">
				<td class='field' align='Right'>
				<span class="subfield" style="display:none;" id="Own_TypeofTravel_Label">Type of Travel</span>
				</td>
				
				<td align='left'>
				<span>
				<select style="display:none;" id="Own_TypeofTravel_class1">
					<option>Business</option>
					<option>Business & Pleasure</option>
				</select>
				</span>
				</td>
				
				
				</tr>
				
				<tr id="AirCraft_explicitly_not_covered_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="AirCraft_explicitly_not_covered_Label">Owned Aircraft explicitly not covered</span>
				</td>
				
				<td align='left'>
				<span id="AirCraft_explicitly_not_covered_class1">
				<input type='radio' name='answer(AirCraft_explicitly_not_covered_class1)'  value='AirCraft_explicitly_not_covered_class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(AirCraft_explicitly_not_covered_class1)'  value='AirCraft_explicitly_not_covered_class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr><td>&nbsp;</td></tr>
				<tr>
				<td class='field' align='Right'>
				<span>Pilot</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' onclick="display_pilot_class1(this)" name='answer(Pilot_Class1)'  id="Pilot_Class1_Y" value='Pilot_Class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' onclick="display_pilot_class1(this)" name='answer(Pilot_Class1)'  id="Pilot_Class1_N" value='Pilot_Class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Include_Crew_Members_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="Include_Crew_Members_Label">Include Crew Members</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="Include_Crew_Members_Class1">
				<input type='radio' name='answer(Include_Crew_Members_Class1)' value='Include_Crew_Members_Class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(Include_Crew_Members_Class1)' value='Include_Crew_Members_Class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Pilot_TypeofTravel_Row">
				<td class='field' align='Right'>
				<span class="subfield" style="display:none;" id="Pilot_TypeofTravel_Label">Type of Travel</span>
				</td>
				
				<td align='left'>
				<span>
				<select style="display:none;" id="Pilot_TypeofTravel_class1">
					<option>Business</option>
					<option>Business & Pleasure</option>
				</select>
				</span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Policyholder_Authorization_Trip_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="Policyholder_Authorization_Trip_Label">Require Policyholder authorization for <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trip</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="Policyholder_Authorization_Trip_class1">
				<input type='radio' name='answer(Policyholder_Authorization_Trip_class1)' value='Policyholder_Authorization_Trip_class1_Y' CHECKED><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(Policyholder_Authorization_Trip_class1)' value='Policyholder_Authorization_Trip_class1_N' ><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr><td>&nbsp;</td></tr>
				<tr><td class="field" align="right">Covered Aircraft:</td></tr>
				
				<tr>
				<td class='field' align='Right'>
				<span>Year</span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span>Make</span>
				</td>
				
				<td align='left'>
				<span><input type='text' size="25" maxlength="128"/></span>			
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span>Model</span>
				</td>
				
				<td align='left'>
				<span><input type='text' size="25" maxlength="32"/></span>			
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span>Serial Number</span>
				</td>
				
				<td align='left'>
				<span><input type='text' size="25" maxlength="32"/></span>			
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span>Crew Seats</span>
				</td>
				
				<td align='left'>
				<span><input type='text' size="2" maxlength="2"/></span>			
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr>
				<td class='field' align='Right'>
				<span>Passenger Seats</span>
				</td>
				
				<td align='left'>
				<span><input type='text' size="3" maxlength="3"/></span>			
				</td>
				
				
				</tr>
				
				<%-------------------------------------------------------------------------------------------------------------------%>				<%-----------------------%>
				
				<tr><td>&nbsp;</td></tr>
				<tr>
				<td class='field' align='Right'>
				<span>Scheduled Airlines and Military Air Transport</span>
				</td>
				
				<td align='left'>
				<span>
				<input type='radio' onclick="display_Scheduled_Airlines_Class1(this)" name='answer(Scheduled_Class1)'  id="Scheduled_Class1_Y" value='Scheduled_Class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' onclick="display_Scheduled_Airlines_Class1(this)" name='answer(Scheduled_Class1)'  id="Scheduled_Class1_N" value='Scheduled_Class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr><td>&nbsp;</td></tr>
				<tr style="display:none;" id="Scheduled_TypeofTravel_Row">
				<td class='field' align='Right'>
				<span class="subfield" style="display:none;" id="Scheduled_TypeofTravel_Label">Type of Travel</span>
				</td>
				
				<td align='left'>
				<span>
				<select style="display:none;" id="Scheduled_TypeofTravel_Class1">
					<option>Business</option>
					<option>Business & Pleasure</option>
				</select>
				</span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr id="Aircraft_Restrictions_Row">
				<td class='field' align='Right'>
				<span id="Aircraft_Restrictions_Label">Aircraft Restrictions</span>
				</td>
				
				<td align='left'>
				<span id="Aircraft_Restrictions_Class1">
				<input onclick="display_Aircraft_Restrictions_Class1(this)" type='radio' name='answer(Aircraft_Restrictions_Class1)' id="Aircraft_Restrictions_Class1_Y" value='Aircraft_Restrictions_Class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input onclick="display_Aircraft_Restrictions_Class1(this)" type='radio' name='answer(Aircraft_Restrictions_Class1)' id="Aircraft_Restrictions_Class1_N" value='Aircraft_Restrictions_Class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				
				<tr style="display:none;" id="Riding_As_Passenger_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="Riding_As_Passenger_Label">riding as a passenger only, and not as a pilot or member of the crew</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="Riding_As_Passenger_Class1">
				<input type='radio' name='answer(Riding_As_Passenger_Class1)' value='Riding_As_Passenger_Class1_Y' CHECKED><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(Riding_As_Passenger_Class1)' value='Riding_As_Passenger_Class1_N' ><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Aircraft_Has_Valid_Certificate_Row_Space"><td>&nbsp;</td></tr>
				<tr style="display:none;" id="Aircraft_Has_Valid_Certificate_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="Aircraft_Has_Valid_Certificate_Label">the aircraft has a valid certificate of airworthiness</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="Aircraft_Has_Valid_Certificate_Class1">
				<input type='radio' name='answer(Aircraft_Has_Valid_Certificate_Class1)' value='Aircraft_Has_Valid_Certificate_Class1_Y' CHECKED><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(Aircraft_Has_Valid_Certificate_Class1)' value='Aircraft_Has_Valid_Certificate_Class2_N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Aircraft_Flown_By_Pilot_Row_Space"><td>&nbsp;</td></tr>
				<tr style="display:none;" id="Aircraft_Flown_By_Pilot_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="Aircraft_Flown_By_Pilot_Label">the aircraft is flown by a pilot with a valid license</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="Aircraft_Flown_By_Pilot_Class1">
				<input type='radio' name='answer(Aircraft_Flown_By_Pilot_Class1)' value='Aircraft_Flown_By_Pilot_Class1_Y' CHECKED><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(Aircraft_Flown_By_Pilot_Class1)' value='Aircraft_Flown_By_Pilot_Class1_N'><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="Aircraft_Not_Being_Used_For_Row_Space"><td>&nbsp;</td></tr>
				<tr style="display:none;" id="Aircraft_Not_Being_Used_For_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="Aircraft_Not_Being_Used_For_Label">the aircraft is not being used for: (i) crop dusting, spraying, or seeding; fire fighting; sky writing; sky diving or hang gliding; pipeline or power line inspection; aerial photography or exploration; racing, endurance tests, stunt or acrobatic flying; or (ii) any operation which requires a special permit from the FAA, even if it is granted (this does not apply if the permit is required only because of the territory flown over or landed on).</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="Aircraft_Not_Being_Used_For_Class1">
				<input type='radio' name='answer(Aircraft_Not_Being_Used_For_Class1)' value='Aircraft_Not_Being_Used_For_Class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(Aircraft_Not_Being_Used_For_Class1)' value='Aircraft_Not_Being_Used_For_Class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr style="display:none;" id="A_Military_Aircraft_Row_Space"><td><div style="padding:0 0 130px 0;"></div></td></tr>
				
				<tr style="display:none;" id="A_Military_Aircraft_Row">
				<td class='field' align='Right'>
				<span class="subfield" id="A_Military_Aircraft_Label">a military aircraft, other than transport aircraft flown by the U.S. Military Airlift Command (MAC), or a similar air transport service of another country</span>
				</td>
				
				<td align='left'>
				<span style="display:none;" id="A_Military_Aircraft_Class1">
				<input type='radio' name='answer(A_Military_Aircraft_Class1)' value='A_Military_Aircraft_Class1_Y'><span>Yes&nbsp;&nbsp;</span>			
				<input type='radio' name='answer(A_Military_Aircraft_Class1)' value='A_Military_Aircraft_Class1_N' CHECKED><span>No&nbsp;&nbsp;</span></span>
				</td>
				
				
				</tr>
				<%-------------------------------------------------------------------------------------------------------------------%>				
				<tr><td>&nbsp;</td></tr>
				<tr><td align="right"> <input type="button" name="answer(button)" onClick="LoadNewQuoteClassHazardsClass2();"  Style="Cursor:hand" value="Save" class="covbutton"></td></tr>
							         			 </table>
			         			 </div>