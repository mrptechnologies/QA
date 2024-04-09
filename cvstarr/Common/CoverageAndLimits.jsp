<style>
	.coverageandlimits .field{float:left;width:405px;height:5px;padding:7px 0 0 100px;margin:3px 0 3px 10px;font-size:12px;text-align:left;}
	.coverageandlimits .subfield{margin:0 0 0 20px}
</style>

<SCRIPT type="text/javascript" SRC="scripts/CoverageAndLimits.js"> </SCRIPT>

<div class="coverageandlimits">

<table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='100%' >

				<tr><td align="left"><h3 style="margin:20px 0 0 20px;padding:0;">Policy Coverage and Limits</h3></td></tr>
				<tr>
				<td class='field' width='40%' align='Right'><span>Accident</span></td>
				<td width='40%' align='left'><span><input type='radio'
					onClick="return setAccidentBenefits(this)" name='answer(Accident)'
					id='accidentY' value='Y' CHECKED>Yes&nbsp;&nbsp; <input type='radio'
					onClick="return setAccidentBenefits(this)" name='answer(Accident)'
					id='accidentN' value='N'>No&nbsp;&nbsp; </span></td>
				</tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Medical</span></td>
				<td width='40%' align='left'>
				<span><input type='radio' onClick="displayMedical(this);setMedical(this);" name='answer(Medical)' id='medicalY' value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' onClick="displayMedical(this);setMedical(this);" name='answer(Medical)'  id='medicalN'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr id="outtaCountry" style="display:none"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
				<span class="subfield">Out of Country</span>
				</td><td width='40%' align='left'>
				<span><input type='radio' onclick="return setOutCountryMedical(this)" name='answer(outtaMedical)' id='outtaMedicalY' value='Y' CHECKED>Yes&nbsp;&nbsp;
				<input type='radio' onclick="return setOutCountryMedical(this)" name='answer(outtaMedical)'  id='outtaMedicalN'  value='N' >No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr id="inCountry" style="display:none"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
				<span class="subfield">In Country</span>
				</td><td width='40%' align='left'>
				<span><input type='radio' onclick="setInCountryMedical(this)" name='answer(inMedical)' id='inMedicalY' value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' onclick="setInCountryMedical(this)" name='answer(inMedical)'  id='inMedicalN'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Sickness</span></td>
				<td width='40%' align='left'>
				<span><input type='radio' onClick="return displaySickness(this)" name='answer(Sickness)' id='sickness' value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' onClick="return displaySickness(this)" name='answer(Sickness)'  id='sickness'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr id="outtaSicknessCountry" style="display:none"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
				<span class="subfield">Out of Country</span>
				</td><td width='40%' align='left'>
				<span><input type='radio' name='answer(outtaSickness)' id='outtaSickness' value='Y' CHECKED>Yes&nbsp;&nbsp;
				<input type='radio' name='answer(outtaSickness)'  id='outtaSickness'  value='N' >No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr id="inSicknessCountry" style="display:none"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
				<span class="subfield">In Country</span>
				</td><td width='40%' align='left'>
				<span><input type='radio' name='answer(inSickness)' id='inSickness' value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' name='answer(inSickness)'  id='inSickness'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>War Risk</span></td>
				<td class='' width='40%' align='left'>
				<span><input type='radio' name='answer(WarRisk)'  id='war_riskY'  onClick="displayWarRisk(this);setWarRisk1(this)" value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' name='answer(WarRisk)' onClick="displayWarRisk(this);setWarRisk1(this)" id='war_riskN' value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr id="warExplicitlyCovered"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
				<span class="subfield">War Risk explicitly not covered</span>
				</td><td width='40%' align='left'>
				<span><input type='radio' onclick="return setWarRisk2(this)" name='answer(WarRiskExplicitlyNotCovered)' id='war_rish_not_explicitly_not_covered_Y' value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' onclick="return setWarRisk2(this)" name='answer(WarRiskExplicitlyNotCovered)'  id='war_rish_not_explicitly_not_covered_N'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Pilot</span></td>
				<td width='40%' align='left'>
				<span><input type='radio'  onClick="return displayAircraftSchedule(this);" name='answer(Sickness)' id='pilot_Y' value='Y'>Yes&nbsp;&nbsp;
				<input type='radio'  onClick="return displayAircraftSchedule(this);" name='answer(Sickness)'  id='pilot_N'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Aggregate Limit</h3></span></td></tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Aggregate Limit applies</span></td>
				<td class='' width='40%' colspan='$COLSPAN' align='left'>
				<span><input type='radio' onClick="return display(this)" name='answer(AggregateLimitApplies)' $DISABLED id='aggregate_limit_applies' value='Y' CHECKED>Yes&nbsp;&nbsp;
				<input type='radio' onClick="return display(this)" name='answer(AggregateLimitApplies)' $DISABLED id='aggregate_limit_applies' value='N'>No&nbsp;&nbsp;
				</span></td></tr>
				
				
				<tr id="benefitMaximum"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
				<span class="subfield">Benefit Maximum</span>
				</td><td class='' width='40%' colspan='$COLSPAN' align='left'>
				<span id='ApplicationList_ATTRIBUTE11'>
				<input type="text" maxlength="9" class="txtbox" value="$500000" /></span>
				</td></tr>
				

				<tr><td class='field'><span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#5B595C;">Initial Premium Rates</h3></span></td></tr>

				<tr><td class='field' width='40%' align='Right'>
				<span>Period</span></td>
				<td class='' width='40%' align='left'>
				<span>
					<select id="Period" class="txtbox" onchange="return displayIfOthersPeriod(this)">
						<option value="">Select</option>
						<option value="PolicyTerm">Policy Term</option>
						<option value="Year" SELECTED>Year</option>
						<option value="6Months">6 months</option>
						<option value="Quarter">Quarter</option>
						<option value="Monthly">Monthly</option>
						<option value="Weekly">Weekly</option>
						<option value="Daily">Daily</option>
						<option value="Other">Other</option>
					</select>

				</span>
				</td></tr>
				
				<tr id="IfOthersPeriod" style="display:none;"><td class='field' width='40%' align='Right'>
				<span class="subfield">If Other please specify</span>
				</td><td width='40%' align='left'>
				<span><input type="text" maxlength="32" class="txtbox"/>
				</span></td></tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Unit</span></td>
				<td width='40%' align='left'>
				<span>
					<select class="txtbox" onchange="return displayIfOthersUnit(this)">
						<option value=''>Select</option>
						<option value='Person'>Person</option>
						<option value='ThousandDollars' SELECTED>Thousand dollars of annual payroll</option>
						<option value='HundredDollars'>Hundred dollars of annual payroll</option>
						<option value='Other'>Other</option>
					</select>
				</span>
				</td></tr>
				
				<tr id="IfOthersUnit" style="display:none;"><td class='field' width='40%' align='Right'>
				<span class="subfield">If Other please specify</span>
				</td><td width='40%' align='left'>
				<span><input type="text" maxlength="32" class="txtbox"/>
				</span></td></tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Rate</span>
				</td><td width='40%' align='left'>
				<span><input type="text" maxlength="8" size="8" class="txtbox"/>
				</span></td></tr>
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Minimum and Deposit</span></td>
				<td class='' width='40%' colspan='$COLSPAN' align='left'>
				<span><input type='radio' name='answer(MinimumAndDeposit)' $DISABLED id='war_rish_not_explicitly_not_covered'  value='Y' >Yes&nbsp;&nbsp;
				<input type='radio' name='answer(MinimumAndDeposit)' $DISABLED id='war_rish_not_explicitly_not_covered'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				
				<tr><td class='field' width='40%' align='Right'>
				<span>Subject to audits</span></td>
				<td width='40%' align='left'>
				<span><input type='radio' onclick="return displayaudit(this)" name='answer(9)' $DISABLED id='subject_to_audits'  value='Y'>Yes&nbsp;&nbsp;
				<input type='radio' onclick="return displayaudit(this)" name='answer(9)' $DISABLED id='subject_to_audits'  value='N' CHECKED>No&nbsp;&nbsp;
				</span></td></tr>
				
				
				<tr id='audit_period' style="display:none;">
				<td class='field' width='40%' align='Right'>
				<span class="subfield">Audit Period</span></td>
				<td class='' width='40%' align='left'>
				<span>
					<select class="txtbox">
						<option>Select</option>
						<option>Annual</option>
						<option>Semi-annual</option>
						<option SELECTED>Quarterly</option>
						<option>Monthly</option>
					</select>
				</span>
				</td></tr>
				<tr><td>&nbsp;</td></tr>
				<TR><td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;
					<div id="submitButton">
					<input onClick="covandLimitsToCaseInformation();LoadNewQuotePolicyInformation();"  Style="Cursor:hand" type="button" value="Save" class="covbutton" id="CreateQuoteSubmit" >&nbsp;
					</div>
				</td></TR></table></div>



