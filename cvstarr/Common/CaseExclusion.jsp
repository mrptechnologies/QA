
<style>
	.caseexclusion .field{float:left;width:520px;padding:5px 0 0 80px;margin:0px 0 0px 10px;font-size:12px;text-align:left;}
	.caseexclusion .subfield{margin:0 0 0 20px;}
	.caseexclusion .secondsubfield{margin:0 0 0 40px;}
	.caseexclusion p.secondsubfields{float:left;margin:0 0 0 40px;padding:0;width:500px;}
	.caseexclusion p.subfields{float:left;margin:0 0 0 20px;padding:0;width:500px;}
</style>

<SCRIPT type="text/javascript" SRC="scripts/ClassExclusion.js"> </SCRIPT>
<script type="text/javascript" SRC="scripts/policyExclusions.js"></script>

<tr>
<td>
<div class="caseexclusion">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td align="left"><h3 style="margin:20px 0 0 20px;padding:0;">Policy Exclusions</h3></td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td>
<div id="policy_exclusion_accident_benefits">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >
<tr>
<td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Accident Exclusions</h3></span></td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
	<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Intentionally self-inflicted Injury</span>
	</td>
	<td width='30%' colspan='$COLSPAN' align='left'>
  	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(1)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(1)'  style="radioButton" value='N'>No&nbsp;&nbsp;
	</span>
	</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Suicide or attempted suicide</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
		<input type='radio' name='answer(2)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
		<input type='radio' name='answer(2)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>War or any act of war, whether declared or not</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
		<input type='radio' name='answer(3)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
		<input type='radio' name='answer(3)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Service in the military, naval or air service of any country</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
		<input type='radio' name='answer(4)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
		<input type='radio' name='answer(4)'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span>Sickness, disease, bodily or mental infirmity, bacterial or viral infection or medical or viral infection or medical or surgical treatment thereof, except for any bacterial infection resulting from an accidental external cut or wound or accidental ingestion of contaminated food</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(5)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(5)'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span>Medical or surgical treatment, diagnostic procedure, administration of anesthesia, or medical mishap or negligence, including malpractice</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='Medical_surgical_treatment'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='Medical_surgical_treatment'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="GLHeaderImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('sports');">&nbsp;Sports
</td> 
</tr>
</table>
<%---------------------------------------------------------------------------------------------------------------%>
<div id="sportstype" style="display:none;">
<table align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class="field" width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>bungi-cord jumping</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(bungi_cord)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(bungi_cord)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>parachuting</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(parachuting)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(parachuting)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>skydiving</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(skydiving)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(skydiving)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>parasailing</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(parasailing)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(parasailing)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>hang-gliding</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(hang_gliding)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(hang_gliding)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>motorcycling</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(motorcycling)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(motorcycling)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>scuba diving</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(scuba_diving)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(scuba_diving)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>jet, snow or water skiing</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(jet_snow_water_skiing)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(jet_snow_water_skiing)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>mountain climbing (where ropes or guides are used)</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(mountain_climbing)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(mountain_climbing)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>amateur racing</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(amateur_racing)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(amateur_racing)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>piloting an aircraft</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(piloting_an_aircraft)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(piloting_an_aircraft)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span  class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>whitewater rafting</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(whitewater_rafting)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(whitewater_rafting)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>surfing</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(surfing)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(surfing)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
</table>
</div>
<%---------------------------------------------------------------------------------------------------------------%>
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span>flight in, boarding or alighting from an aircraft or any craft designed to fly above the Earth's surface</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="displayFlightBoardingorAlighting(this)" type='radio' name='answer(boarding_or_alighting)'  style="radioButton" value='FlightBoardingorAlighting_Y'>Yes&nbsp;&nbsp;
	<input onclick="displayFlightBoardingorAlighting(this)" type='radio' name='answer(boarding_or_alighting)'  style="radioButton" value='FlightBoardingorAlighting_N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Include_Specific_Questions_Row" style="display:none;">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img  class="subfield" src="/Images/down_arrow.png" name="ExceptionImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('exceptions');">&nbsp;Exceptions </span>
</td>
</tr>
</table>
<%---------------------------------------------------------------------------------------------------------------%>

<div id="specific_exceptions" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr id="Fare_Paying_Passenger_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield">a fare-paying passenger on a regularly scheduled commercial or charter airline</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(farepaying_passenger )'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(farepaying_passenger )'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Passenger_Non_Scheduled_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="secondsubfields">a passenger in a non-scheduled, private aircraft used for pleasure purposes with no commercial intent during the flight</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(passenger_non_scheduled )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(passenger_non_scheduled )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Passenger_Military_Aircraft">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="secondsubfields">a passenger in a military aircraft flown by the Air Mobility Command or its foreign equivalent</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(passenger_military_aircraft )'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(passenger_military_aircraft )'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Being_Flown_By_Covered_Person_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="secondsubfields">being flown by the Covered Person or in which the Covered Person is a member of the crew</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(being_flown )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(being_flown )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
</table>
</div>
<%---------------------------------------------------------------------------------------------------------------%>
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr style="display:none;" id="Aircraft_Uses_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img  class="subfield" src="/Images/down_arrow.png" name="AircraftImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('aircraft_uses');">&nbsp;Aircraft uses</span>
</td>
</tr></table>
<%---------------------------------------------------------------------------------------------------------------%>
<div id="aircraft_uses_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >

<tr id="Crop_Dusting_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield">crop dusting</span>
</td>
<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(crop_dusting )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(crop_dusting )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Spraying_Or_Seeding_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>spraying or seeding</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(spraying_seeding )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(spraying_seeding )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Giving_And_Receiving_Flying_Instructions_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>giving and receiving flying instruction</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(giving_receiving )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(giving_receiving )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Fire_Fighting_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>fire fighting</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(fire_fighting )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(fire_fighting )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Sky_Writing_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>sky writing</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(sky_writing )'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(sky_writing )'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Sky_Diving_or_Hang_Gliding_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>sky diving or hang-gliding</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(sky_diving)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(sky_diving)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Pipeline_or_PowerLine_Inspection_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>pipeline or power line inspection</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(pipeline_power_line)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(pipeline_power_line)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Aerial_Photography_or_Exploration_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>aerial photography or exploration</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(aerial_photography)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(aerial_photography)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Racing_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>racing</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(racing)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(racing)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Endurance_Tests_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>endurance tests</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(endurance_tests)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(endurance_tests)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Stunt_or_Acrobatic_Flying_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>stunt or acrobatic flying</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(stunt_acrobatic_flying)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(stunt_acrobatic_flying)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr id="Special_Permit_From_FAA_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="secondsubfield" id='ApplicationList_ATTRIBUTEHEAD790'>any operation that requires a special permit from the FAA, even if it is granted (this does not apply if the permit is required only because of the territory flown over or landed on)</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(special_permit_from_the_FAA)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(special_permit_from_the_FAA)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr></table>
</div>
<%---------------------------------------------------------------------------------------------------------------%>
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr style="display:none;" id="Designed_For_Flight_Above_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>designed for flight above or beyond the earth's atmosphere</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(designed_for_flight)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(designed_for_flight)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr style="display:none;" id="Ultra_Light_or_Glider_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'>an ultra-light or glider</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(ultra_light_glider)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(ultra_light_glider)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr style="display:none;" id="Purpose_of_Parachuting_Row">
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield">being used for the purpose of parachuting or skydiving</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(purpose_parachuting)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(purpose_parachuting)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr style="display:none;" id="Used_By_Any_Military_Authority_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfields">Being used by any military authority, except an aircraft used by the Air Mobility Command or its foreign equivalent</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(military_authority)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(military_authority)'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr></table>
<%---------------------------------------------------------------------------------------------------------------%>
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="OtherExclusionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('otherExclusions');">&nbsp;Other exclusions not usually listed on the policy
</td> 
</tr></table>
<%---------------------------------------------------------------------------------------------------------------%>
<div id="other_exclusions_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">piloting or serving as a crewmember</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(Piloting_or_Servicing)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(Piloting_or_Servicing)'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">riding in any aircraft except as a fare-paying passenger on a regularly scheduled or charter airline</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(riding_any_craft)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(riding_any_craft)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">commission of, or attempt to commit a felony</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(commission)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(commission)'  style="radioButton" value='N'>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">commission of, or attempt to commit an assault or other illegal activity</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(commission_illegal_activity)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(commission_illegal_activity)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">active participation in a riot, or insurrection</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(active_participation)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(active_participation)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield"> Travel in or on any on-road or off-road motorized vehicle not requiring licensing as amotor vehicle</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(Travel_any_road)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(Travel_any_road)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">An Accident if the Covered Person is the operator of a motor vehicle and does not possess a valid motor vehicle operator's license, except while participating in Driver's Education Program</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(Covered_Person_operator)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(Covered_Person_operator)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">Travel in any aircraft owned, leased or controlled by the Policyholder</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(controlled_by_Policyholder)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(controlled_by_Policyholder)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'> <p class="subfield">Including aircraft owned, leased or controlled by any of its subsidiaries or affiliates</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(controlled_by_any_of_its_subsidiarie)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(controlled_by_any_of_its_subsidiarie)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">The Covered Person being legally intoxicated as determined according to the laws of the jurisdiction in which the Injury occurred</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(being_legally_intoxicated)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(being_legally_intoxicated)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield"> An Accident that occurs while on active duty service in the military, naval or air force of any country or international organization</p></span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(occurs_while_on_active)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(occurs_while_on_active)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">A cardiovascular malfunction or stroke caused solely and exclusively by exertion, as verified by a Doctor, while the Covered Person participates in a Covered Activity</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(52)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(52)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield"> Aggravation, during a Covered Activity, of an injury the Covered Person suffered before participating in that Covered Activity, unless We receive a written medical release from the Covered Person's Doctor prior to engaging in the Covered Activity</p>  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(53)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(53)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield"id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">Flight in any aircraft owned or leased by the Policyholder</p>  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(54)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(54)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">The Covered Person being under the influence of drugs or intoxicants, unless taken under the advice of a Doctor</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(55)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(55)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield" id='ApplicationList_ATTRIBUTEHEAD790'><p class="subfield">Where the Covered Person's Trip to the host country is undertaken for treatment or advice, except as provided in the Policy.</p> </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(56)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(56)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
    </span>
</td>
</tr></table></div></td></tr>
<%---------------------------------------------------------------------------------------------------------------%>
<tr><td><div id="policy_exclusion_out_of_country_medical_benefits"><table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >	
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >				
<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Out of Country Medical Exclusions</h3></span></td></tr>

<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Pre-Existing Conditions, as defined herein</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(9)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(9)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Pregnancy, childbirth, miscarriage, abortion or any complications of any of these conditions </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(75)'  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name='answer(75)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Mental and nervous disorders </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(76)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(76)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Any treatment, services or supplies received by the Covered Person that are incurred or received while he or she is in his or her Home Country  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(112)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(112)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="MedicalconditionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('medicalConditions');">&nbsp;Medical conditions
</td> 
</tr>
</table>

<div id="medical_conditions_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Including the statement "whether or not caused by a Covered Event" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(64)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(64)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Treatment of hernia</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(65)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(65)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Osgood-Schlatter's Disease</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(66)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(66)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Osteochondritis</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(67)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(67)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Appendicitis</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(68)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(68)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Osteomyelitis</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(69)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(69)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Cardiac disease or conditions</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(70)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(70)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Pathological fractures</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(71)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(71)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp; Congenital weakness</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(72)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(72)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detached retina unless caused by an Injury</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(73)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(73)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp; Mental disorder or psychological or psychiatric care or treatment</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(74)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(74)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table></div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="policylistedexclusionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('exclusions_listed_on_policy');">&nbsp;Other exclusions usually listed on the policy
</td> 
</tr>
</table>

<div id="exclusions_listed_on_policy_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Damage to or loss of dentures or bridges, or damage to existing orthodontic equipment  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(77)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(77)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>			

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Expense incurred for treatment of temporomandibular or craniomandibular joint dysfunction and associated myofacial pain  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(78)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(78)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or loss contributed to by the use of drugs unless administered by a Doctor </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(81)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(81)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Cosmetic surgery </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(89)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(89)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Any elective treatment, surgery, health treatment, or examination </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="display_Any_Elective_Element(this)" type='radio' name='answer(any_elective_treatment)'  id="Any_Elective_Element_Y" style="radioButton" value='Any_Elective_Element_Y' CHECKED>Yes&nbsp;&nbsp;
	<input onclick="display_Any_Elective_Element(this)" type='radio' name='answer(any_elective_treatment)'  id="Any_Elective_Element_N" style="radioButton" value='Any_Elective_Element_N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr id="Including_Any_Service_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Including any service, treatment or supplies that: (a) are deemed by Us to be experimental; and (b) are not recognized and generally accepted medical practices in the United States </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(91)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(91)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Eye refractions or eye examinations for the purpose of prescribing corrective lenses or for the fitting thereof</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(107)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(107)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Covered medical expenses for which the Covered Person would not be responsible for in the absence of the Policy</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(108)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(108)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Conditions that are not caused by a Covered Event </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(109)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(109)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Participation in any activity or hazard not specifically covered by the Policy </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(110)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(110)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Any treatment, service or supply not specifically covered by the Policy  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(111)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(111)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Personal comfort or convenience items </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(113)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(113)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Pregnancy or childbirth </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(115)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(115)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Routine nursery care </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(116)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(116)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Routine physicals </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(117)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(117)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Cosmetic or plastic surgery </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(118)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(118)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Elective surgery </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(118)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(118)'  style="radioButton" value='N'>No&nbsp;&nbsp;
	</span>
	</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Any mental or nervous disorder or rest cures </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(119)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(119)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Substance abuse </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(120)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(120)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Birth defects and congenital anomalies </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(121)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(121)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> New eye glasses or contact lenses; eye examinations related to the correction of vision or related to the fitting of glasses or contact lenses; or repair or replacement of existing eye glasses or contact lenses </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(122)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(122)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Routine dental care and treatment </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(123)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(123)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Expenses incurred during holiday travel </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(124)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(124)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Rest cures or custodial care</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(125)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(125)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Treatment of Injuries that result over a period of time </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(103)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(103)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Treatment or service provided by a private duty nurse </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(104)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(104)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Organ or tissue transplants and related services. </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(127)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(127)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Confinement or institutional care  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(136)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(136)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Maternity and routine nursery care  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(137)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(137)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Any expenses covered by any other employer or government sponsored plan for which, and to the extent that the Covered Person is eligible for reimbursement  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(138)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(138)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Services, supplies, or treatment including any period of Hospital confinement which were not recommended, approved and certified as necessary and reasonable by a Doctor; or expenses which are non-medical in nature  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(139)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(139)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Treatment relating to birth defects and congenital conditions, or complications arising from those conditions  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(140)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(140)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Sexually transmitted diseases or immune deficiency disorders and related conditions  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(141)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(141)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Expenses incurred for services related to the diagnostic treatment of infertility or other problems related to the inability to conceive a child, unless such infertility  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(142)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(142)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>   Expenses incurred for birth control including surgical procedures and devices</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(143)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(143)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Nasal or sinus surgery, except surgery made necessary as the result of a covered Injurycorrection thereof.]]   </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(144)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(144)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> A deviated nasal septum including sub mucous resection and surgical correction thereof </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(145)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(145)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> expenses incurred in connection with weak, strained or flat feet, corns, calluses or toenails </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(146)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(146)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> treatment of acne </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(147)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(147)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="policynotlistedexclusionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('exclusions_not_listed_on_policy');">&nbsp;Other exclusions usually not listed on the policy
</td> 
</tr>
</table>

<div id="exclusions_not_listed_on_policy_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<span id='ApplicationList_ATTRIBUTEHEAD790'>Intentionally self-inflicted Injury</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(6)'  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name='answer(6)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Suicide or attempted suicide </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(7)'  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name='answer(7)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>War or any act of war, whether declared or not</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(8)'  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name='answer(8)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Treatment by persons employed or retained by a Policyholder</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="display_Treatment_By_Persons_or_Retained_PolicyHolder(this)" type='radio' name='answer(employed_or_retained)'  style="radioButton" value='Employed_Or_Retained_Y' CHECKED>Yes&nbsp;&nbsp;
	<input onclick="display_Treatment_By_Persons_or_Retained_PolicyHolder(this)" type='radio' name='answer(employed_or_retained)'  style="radioButton" value='Employed_Or_Retained_N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr style="display:none;" id="Treatment_FamilyMember_MemberofCoveredPersons_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield">Treatment by any Immediate Family Member or member of the Covered Person's household </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(62)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(62)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Treatment of sickness, disease or infections except pyogenic infections or bacterial infections that result from the accidental ingestion of contaminated substances  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(63)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(63)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or Sickness covered by Workers' Compensation, Employer's Liability Laws or similar occupational benefits   </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(79)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(79)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Including the statment "or while engaging in activity for monetary gain from sources other than the Policyholder" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(80)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(80)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or death to which a contributing cause is the Covered Person's violation or attempt to violate any duly-enacted law </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(82)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(82)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Including the statement ", or the commission or attempt to commit an assault or a felony" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(83)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(83)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Including the statement ", or that occurs while the Covered Person is engaged in an illegal occupation" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(84)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(84)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or death caused while riding in or on, entering into or alighting from, or being struck by a 2 or 3-wheeled motor vehicle or a motor vehicle not designed primarily for use on public streets and highways </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(85)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(85)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>				

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Blood </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="display_blood(this)" type='radio' name='answer(blood)'  style="radioButton" value='Blood_Y'>Yes&nbsp;&nbsp;
	<input onclick="display_blood(this)" type='radio' name='answer(blood)'  style="radioButton" value='Blood_N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr style="display:none;" id="Blood_Plasma_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Including blood plasma</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(87)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(87)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr style="display:none;" id="Blood_Storage_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Including blood storage</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(88)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(88)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Expenses payable by any automobile insurance policy without regard to fault </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(102)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(102)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Replacement of Artificial limbs </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(104)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(104)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Replacement of Eyes </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(105)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(105)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Replacement of Larynx </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(106)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(106)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Any condition for which the Covered Person is entitled to benefits under any Workers' Compensation Act or similar law </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(126)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(126)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury/Sickness that occurs while the Covered Person has been determined to be legally intoxicated as determined according to the laws of the jurisdiction in which the Injury/Sickness occurred, or under the influence of any narcotic, barbiturate, or hallucinatory drug, unless administered by a Doctor and taken in accordance with the prescribed dosage </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(128)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(128)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="durablemedicalequipmentImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('durable_medical_equipment');">&nbsp;Durable Medical Equipment
</td> 
</tr>
</table>

<div id="durable_medical_equipment_types" style="display:none">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Including examinations or prescriptions for them  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(92)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(92)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Eyeglasses </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(93)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(93)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Contact lenses</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(94)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(94)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Hearing aids </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(95)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(95)'  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Wheelchairs </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(96)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(96)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Braces </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(97)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(97)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Appliances </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(97)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(97)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Repair or replacement of artificial limbs</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="outcountry_display_repair_or_replacement(this)" type='radio' name='answer(repair_replacement)' id="outcountry_Repair_Replacement_Y" style="radioButton" value='outcountry_Repair_Replacement_Y'>Yes&nbsp;&nbsp;
	<input onclick="outcountry_display_repair_or_replacement(this)" type='radio' name='answer(repair_replacement)' id="outcountry_Repair_Replacement_N" style="radioButton" value='outcountry_Repair_Replacement_N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr style="display:none;" id="outcountry_Aritificial_Limbs_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;Including existing artificial limbs  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(99)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(99)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Orthopedic braces </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(100)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(100)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Orthotic devices </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(101)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(101)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="sportsinjuryImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('sports_injury');">&nbsp;Sports Injury
</td> 
</tr>
</table>
<div id="sports_injury_types" style="display:none">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp; &nbsp; Amateur  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(129)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(129)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp; &nbsp;&nbsp; &nbsp; Intramural  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(130)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(130)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;Club  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(131)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(131)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interscholastic  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(132)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(132)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp; &nbsp;&nbsp; &nbsp; Intercollegiate  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(133)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(133)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Semiprofessional sports  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(134)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(134)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp; &nbsp;&nbsp; &nbsp; Professional  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='answer(135)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='answer(135)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div></div></td></tr>

<tr><td><div id="policy_exclusion_in_country_medical_benefits"><table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >	
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >				
<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">In Country Medical Exclusions</h3></span></td></tr>

<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Pre-Existing Conditions, as defined herein</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='incountry_pre_existing_condition'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='incountry_pre_existing_condition'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Pregnancy, childbirth, miscarriage, abortion or any complications of any of these conditions </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='incountry_pregnancy'  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name='incountry_pregnancy'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Mental and nervous disorders </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name='incountry_mental_nervous'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name='incountry_mental_nervous'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="IncountryMedicalconditionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('IncountrymedicalConditions');">&nbsp;Medical conditions
</td> 
</tr>
</table>

<div id="Incountry_medical_conditions_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Including the statement "whether or not caused by a Covered Event" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Treatment of hernia</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Osgood-Schlatter's Disease</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Osteochondritis</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Appendicitis</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Osteomyelitis</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Cardiac disease or conditions</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Pathological fractures</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp; Congenital weakness</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detached retina unless caused by an Injury</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp; Mental disorder or psychological or psychiatric care or treatment</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table></div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="incountry_policylistedexclusionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('incountry_exclusions_listed_on_policy');">&nbsp;Other exclusions usually listed on the policy
</td> 
</tr>
</table>

<div id="incountry_exclusions_listed_on_policy_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Damage to or loss of dentures or bridges, or damage to existing orthodontic equipment  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>			

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Expense incurred for treatment of temporomandibular or craniomandibular joint dysfunction and associated myofacial pain  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or loss contributed to by the use of drugs unless administered by a Doctor </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Cosmetic surgery </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Any elective treatment, surgery, health treatment, or examination </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="display_Any_Elective_Element(this)" type='radio' name='answer(incountry_any_elective_treatment)'  id="Any_Elective_Element_Y" style="radioButton" value='Any_Elective_Element_Y' CHECKED>Yes&nbsp;&nbsp;
	<input onclick="display_Any_Elective_Element(this)" type='radio' name='answer(incountry_any_elective_treatment)'  id="Any_Elective_Element_N" style="radioButton" value='Any_Elective_Element_N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr id="Including_Any_Service_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp; Including any service, treatment or supplies that: (a) are deemed by Us to be experimental; and (b) are not recognized and generally accepted medical practices in the United States </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Eye refractions or eye examinations for the purpose of prescribing corrective lenses or for the fitting thereof</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Covered medical expenses for which the Covered Person would not be responsible for in the absence of the Policy</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Conditions that are not caused by a Covered Event </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Participation in any activity or hazard not specifically covered by the Policy </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Any treatment, service or supply not specifically covered by the Policy  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Personal comfort or convenience items </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Pregnancy or childbirth </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Routine nursery care </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Routine physicals </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Cosmetic or plastic surgery </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Elective surgery </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
	</span>
	</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Any mental or nervous disorder or rest cures </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Substance abuse </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Birth defects and congenital anomalies </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> New eye glasses or contact lenses; eye examinations related to the correction of vision or related to the fitting of glasses or contact lenses; or repair or replacement of existing eye glasses or contact lenses </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Routine dental care and treatment </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Expenses incurred during holiday travel </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Rest cures or custodial care</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Treatment of Injuries that result over a period of time </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Treatment or service provided by a private duty nurse </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Organ or tissue transplants and related services. </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Confinement or institutional care  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Maternity and routine nursery care  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Any expenses covered by any other employer or government sponsored plan for which, and to the extent that the Covered Person is eligible for reimbursement  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Services, supplies, or treatment including any period of Hospital confinement which were not recommended, approved and certified as necessary and reasonable by a Doctor; or expenses which are non-medical in nature  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>  Treatment relating to birth defects and congenital conditions, or complications arising from those conditions  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Sexually transmitted diseases or immune deficiency disorders and related conditions  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Expenses incurred for services related to the diagnostic treatment of infertility or other problems related to the inability to conceive a child, unless such infertility  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>   Expenses incurred for birth control including surgical procedures and devices</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Nasal or sinus surgery, except surgery made necessary as the result of a covered Injurycorrection thereof.]]   </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> A deviated nasal septum including sub mucous resection and surgical correction thereof </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> expenses incurred in connection with weak, strained or flat feet, corns, calluses or toenails </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> treatment of acne </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="incountry_policynotlistedexclusionsImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('incountry_exclusions_not_listed_on_policy');">&nbsp;Other exclusions usually not listed on the policy
</td> 
</tr>
</table>

<div id="incountry_exclusions_not_listed_on_policy_types" style="display:none;">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<span id='ApplicationList_ATTRIBUTEHEAD790'>Intentionally self-inflicted Injury</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Suicide or attempted suicide </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>War or any act of war, whether declared or not</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' >Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>


<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Treatment by persons employed or retained by a Policyholder</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="display_Treatment_By_Persons_or_Retained_PolicyHolder(this)" type='radio' name='answer(incountry_employed_or_retained)'  style="radioButton" value='Employed_Or_Retained_Y' CHECKED>Yes&nbsp;&nbsp;
	<input onclick="display_Treatment_By_Persons_or_Retained_PolicyHolder(this)" type='radio' name='answer(incountry_employed_or_retained)'  style="radioButton" value='Employed_Or_Retained_N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	

<tr style="display:none;" id="Treatment_FamilyMember_MemberofCoveredPersons_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span class="subfield">Treatment by any Immediate Family Member or member of the Covered Person's household </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Treatment of sickness, disease or infections except pyogenic infections or bacterial infections that result from the accidental ingestion of contaminated substances  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or Sickness covered by Workers' Compensation, Employer's Liability Laws or similar occupational benefits   </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Including the statment "or while engaging in activity for monetary gain from sources other than the Policyholder" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>	


<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or death to which a contributing cause is the Covered Person's violation or attempt to violate any duly-enacted law </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Including the statement ", or the commission or attempt to commit an assault or a felony" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Including the statement ", or that occurs while the Covered Person is engaged in an illegal occupation" </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury or death caused while riding in or on, entering into or alighting from, or being struck by a 2 or 3-wheeled motor vehicle or a motor vehicle not designed primarily for use on public streets and highways </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>				

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Blood </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="display_blood(this)" type='radio' name=''  style="radioButton" value='Blood_Y'>Yes&nbsp;&nbsp;
	<input onclick="display_blood(this)" type='radio' name=''  style="radioButton" value='Blood_N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr style="display:none;" id="Blood_Plasma_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Including blood plasma</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr style="display:none;" id="Blood_Storage_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Including blood storage</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Expenses payable by any automobile insurance policy without regard to fault </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Replacement of Artificial limbs </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Replacement of Eyes </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Replacement of Larynx </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>Any condition for which the Covered Person is entitled to benefits under any Workers' Compensation Act or similar law </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>



<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Injury/Sickness that occurs while the Covered Person has been determined to be legally intoxicated as determined according to the laws of the jurisdiction in which the Injury/Sickness occurred, or under the influence of any narcotic, barbiturate, or hallucinatory drug, unless administered by a Doctor and taken in accordance with the prescribed dosage </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="incountry_durablemedicalequipmentImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('incountry_durable_medical_equipment');">&nbsp;Durable Medical Equipment
</td> 
</tr>
</table>

<div id="incountry_durable_medical_equipment_types" style="display:none">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Including examinations or prescriptions for them  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Eyeglasses </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Contact lenses</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Hearing aids </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N'>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp;&nbsp;&nbsp;&nbsp;Wheelchairs </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Braces </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp;&nbsp;&nbsp;&nbsp;Appliances </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Repair or replacement of artificial limbs</span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input onclick="incountry_display_repair_or_replacement(this)" type='radio' name='answer(incountry_repair_replacement)' id="incountry_Repair_Replacement_Y" style="radioButton" value='incountry_Repair_Replacement_Y'>Yes&nbsp;&nbsp;
	<input onclick="incountry_display_repair_or_replacement(this)" type='radio' name='answer(incountry_repair_replacement)' id="incountry_Repair_Replacement_N" style="radioButton" value='incountry_Repair_Replacement_N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr style="display:none;" id="incountry_Aritificial_Limbs_Row">
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;Including existing artificial limbs  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Orthopedic braces </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> Orthotic devices </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div>

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='70%' colspan='$COLSPAN' align='left'>
<img src="/Images/down_arrow.png" name="incountrysportsinjuryImg" height="12" width="12" align="left" onclick="ShowAndHideLOBs('incountry_sports_injury');">&nbsp;Sports Injury
</td> 
</tr>
</table>
<div id="incountry_sports_injury_types" style="display:none">
<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='81%' >
<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp; &nbsp; Amateur  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp; &nbsp;&nbsp; &nbsp; Intramural  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;Club  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interscholastic  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp; &nbsp;&nbsp; &nbsp; Intercollegiate  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Semiprofessional sports  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>

<tr>
<td class='field' width='100%' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTEHEAD790'>&nbsp; &nbsp;&nbsp; &nbsp; Professional  </span>
</td>

<td class='$CLASS' width='$WIDTH' colspan='$COLSPAN' align='left'>
	<span id='ApplicationList_ATTRIBUTE790'>
	<input type='radio' name=''  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
	<input type='radio' name=''  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
</span>
</td>
</tr>
</table>
</div></div></td></tr>


<tr><td colspan="2" >&nbsp;&nbsp;</td></tr>


<TR><td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;
				<div id="submitButton">
				<input type="button" onClick="caseExclusionsToClassHazards();LoadNewQuoteClassHazards();"  Style="Cursor:hand" value="Save" class="covbutton" id="CreateQuoteSubmit" >&nbsp;
				</div></td></TR><tr><td colspan="2" >&nbsp;&nbsp;</td></tr></table></div></td></tr>
