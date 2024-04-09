
<style>
	.caseInformation .field{float:left;padding:0 0 0 50px;margin:5px 0 5px 10px;font-size:12px;text-align:left;}
	.caseInformation{
		float:left;padding:20px 0 0 20px;margin:0;
	}
	.caseInformation h3{
		float:left;margin:0 0 20px 0;padding:0;text-align:left;clear:both;width:700px;
	}
	.caseInformation h2{
		font-size:13px;margin:0;padding:0;float:left;text-align:left;color:#5B595C;
	}
	.fieldsLeft{
		float:left;
		width:500px;
		margin:0 40px 0 0;
		padding:0;
	}
	.caseInformation .subfield{float:left;padding:0 0 0 50px;margin:5px 0 5px 30px;font-size:12px;text-align:left;}	
</style>

<SCRIPT type="text/javascript" SRC="scripts/CaseInformation.js"> </SCRIPT>

<div class="caseInformation">
		<h3>Policy Information</h3>
		<div class="field">
			<h2 class="fieldsLeft">Definitions</h2>
			<h2 class="fieldsLeft">Immediate Family Member relationship:</h2>
		</div>
		
		<div class="field">
			<p class="fieldsLeft">Child</p>
			<input type='radio' name='answer(any_age)'  style="radioButton" value='Y' CHECKED>any age&nbsp;&nbsp;
			<input type='radio' name='answer(any_age)'  style="radioButton" value='N'>18 or older&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Parent-in-law</p>
			<input type='radio' name='answer(parent_in_law)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(parent_in_law)'  style="radioButton" value='N' >No&nbsp;&nbsp;	
		</div>
		<div class="field"><p class="fieldsLeft">Son or Daughter-in-law</p>
			<input type='radio'  name='answer(son_in_daughter)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
			<input type='radio'  name='answer(son_in_daughter)'  style="radioButton" value='N' >No&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Brother or Sister-in-law</p>
			<input type='radio'  name='answer(brother_or_sister_in_law)' style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
			<input type='radio'  name='answer(brother_or_sister_in_law)' style="radioButton" value='N' >No&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Is an authorized agent considered as "We", "Our", and "Us" in the terms of the policy?</p>
			<input type='radio'  name='answer(is_an_authorized_agent)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
			<input type='radio'  name='answer(is_an_authorized_agent)'  style="radioButton" value='N'>No&nbsp;&nbsp;
		</div>
		
		<div class="field">
			<h2 class="fieldsLeft">Accident</h2>
		</div>
		
		<div class="field"><p class="fieldsLeft">If disability benefits are offered subject to offsets, are Insured's Dependents Other Income Benefits included?</p>
			<input type='radio' name='answer(if_disability_benefits)'  value='Y'>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(if_disability_benefits)'  value='N' CHECKED >No&nbsp;&nbsp;
		</div>
				
		<div class="field">
			<h2 class="fieldsLeft">Out of Country Medical</h2>
		</div>
		<div class="field"><p class="fieldsLeft">What is the maximum period for a pre-existing condition to be covered prior to the effective date of coverage (months)?</p>
			<input type='text' value='3' Size="2" maxLength="2" />
		</div>
		
		<div class="field"><p class="fieldsLeft">Minimum length of stay to be "Hospital Confined"</p>
			<input type='radio' name='answer(minimum_length)'  style="radioButton" value='Y' CHECKED>Overnight&nbsp;&nbsp;
			<input type='radio' name='answer(minimum_length)'  style="radioButton" value='N'  >24 or more concecutive hours&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Basis of Coverage</p>
			<select  class='txtbox' alt="" onchange="return displayCoverageBlock(this)">
				<option value='Primary' SELECTED>Primary</option>
				<option value='Limited Primary'>Limited Primary</option>
				<option value='Primary Excess'>Primary Excess</option>
				<option value='Limited Primary Excess'>Limited Primary Excess</option>
				<option value='Full Excess'>Full Excess</option>
				<option value='Coordination Of Benefits'>Coordination Of Benefits</option>
			</select>
		</div>
		
		<div style="display:none" id="limitedPrimaryHeading" class="field"><p class="fieldsLeft" style="margin:0 0 0 40px;color:#000;">Limited Primary</p></div>
		
		<div style="display:none" id="limitedPrimary1" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Covers first</p>
			<input type="text" size="4" maxlength="4" value="1000" />
		</div>
		
		<div style="display:none" id="limitedPrimary2" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Coverage starts again after</p>
			<input type="text" size="5" maxlength="5" value="10000" />
		</div>
		
		<div style="display:none" id="primaryExcessHeading" class="subfield"><p class="fieldsLeft" style="margin:0 0 0 20px;color:#000;">Primary Excess</p></div>
		
		<div id="primaryExcess1" style="display:none" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Covers first</p>
			<input type="text" value="1000" size="4" maxlength="4" value="1000" />
		</div>
		
		<div style="display:none" id="limitedPrimaryExcessHeading" class="subfield"><p class="fieldsLeft" style="margin:0 0 0 20px;color:#000;">Limited Primary Excess</p></div>
		
		<div id="limitedPrimaryExcess1" style="display:none" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Covers first</p>
			<input type="text" value="1000" size="4" maxlength="4" value="1000" />
		</div>
		
		<div id="limitedPrimaryExcess2" style="display:none" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Coverage starts again after</p>
			<input type="text" value="1000" size="4" maxlength="4" value="1000" />
		</div>
		
		<div class="field" >
			<h2 class="fieldsLeft" id="" >In Country Medical</h2>
		</div>
		<div class="field" id=""><p class="fieldsLeft">What is the maximum period for a pre-existing condition to be covered prior to the effective date of coverage (months)?</p>
			<input type='text' value='3' Size="2" maxLength="2" />
		</div>
		
		<div class="field" id=""><p class="fieldsLeft">Minimum length of stay to be "Hospital Confined"</p>
			<input type='radio' name='answer(minimum_length_inCountry)'  style="radioButton" value='Y' CHECKED>Overnight&nbsp;&nbsp;
			<input type='radio' name='answer(minimum_length_inCountry)'  style="radioButton" value='N'  >24 or more concecutive hours&nbsp;&nbsp;
		</div>
		
		
		<div class="field" ><p class="fieldsLeft">Basis of Coverage</p>
			<select  class='txtbox' alt="" onchange="return displayCoverageBlockInCountry(this)">
				<option value='Primary' SELECTED>Primary</option>
				<option value='Limited Primary'>Limited Primary</option>
				<option value='Primary Excess'>Primary Excess</option>
				<option value='Limited Primary Excess'>Limited Primary Excess</option>
				<option value='Full Excess'>Full Excess</option>
				<option value='Coordination Of Benefits'>Coordination Of Benefits</option>
			</select>
		</div>
		
		<div style="display:none" id="limitedPrimaryHeadingInCountry" class="field"><p class="fieldsLeft" style="margin:0 0 0 40px;color:#000;">Limited Primary</p></div>
		
		<div style="display:none" id="limitedPrimaryInCountry1" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Covers first</p>
			<input type="text" size="4" maxlength="4" value="1000" />
		</div>
		
		<div style="display:none" id="limitedPrimaryInCountry2" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Coverage starts again after</p>
			<input type="text" size="5" maxlength="5" value="10000" />
		</div>
		
		<div style="display:none" id="primaryExcessHeadingInCountry" class="subfield"><p class="fieldsLeft" style="margin:0 0 0 20px;color:#000;">Primary Excess</p></div>
		
		<div id="primaryExcess1InCountry" style="display:none" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Covers first</p>
			<input type="text" value="1000" size="4" maxlength="4" value="1000" />
		</div>
		
		<div style="display:none" id="limitedPrimaryExcessHeadingInCountry" class="subfield"><p class="fieldsLeft" style="margin:0 0 0 20px;color:#000;">Limited Primary Excess</p></div>
		
		<div id="limitedPrimaryExcessInCountry1" style="display:none" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Covers first</p>
			<input type="text" value="1000" size="4" maxlength="4" value="1000" />
		</div>
		
		<div id="limitedPrimaryExcessInCountry2" style="display:none" class="subfield"><p style="margin:0 0 0 20px;" class="fieldsLeft">Coverage starts again after</p>
			<input type="text" value="1000" size="4" maxlength="4" value="1000" />
		</div>
		
		
		<div class="field">
			<h2 class="fieldsLeft">War Risk</h2>
		</div>
		
		<div class="field"><p class="fieldsLeft">Minimum Period before any change is effective after a Notice of Change is sent (days)</p>
			<input type="text" size="2" maxlength="2"/>
		</div>
		
		<div class="field"><p class="fieldsLeft">Minimum Period before any coverage Cancellation is effective after a Notice of Cancellation is sent (days)</p>
			<input type="text" size="2" maxlength="2"/>
		</div>
		
		<div class="field"><p class="fieldsLeft" style="color:#5B595C;">War Risk Included</p></div>
		
		<div class="field"><p style="margin:0 0 0 40px;" class="fieldsLeft">Specific Countries Only</p>
			<input type='radio' name='answer(8)'  style="radioButton" value='Y' onclick="return displayCountryOrMinPeriodWarRiskIncluded(this)">Yes&nbsp;&nbsp;
			<input type='radio' name='answer(8)'  style="radioButton" value='N' onclick="return displayCountryOrMinPeriodWarRiskIncluded(this)">No&nbsp;&nbsp;
		</div>
		
		<div id="countryWarRiskIncluded" style="display:none" class="field"><p style="margin:0 0 0 60px;" class="fieldsLeft">Countries</p>
			<select name="country" size="5">									
				   		<option value="select" selected>Select</option>
				   		<option value="US">US</option>				   			
			</select>
		</div>
		
		<div id="minPeriodWarRiskIncluded" style="display:none" class="field"><p style="margin:0 0 0 60px;" class="fieldsLeft">Minimum Period of Temporary Employment (months)</p>
			<input type="text" size="2" maxlength="2"/>
		</div>
		
		
		
		<div class="field"><p class="fieldsLeft" style="color:#5B595C;">War Risk Excluded</p></div>
		
		<div class="field"><p style="margin:0 0 0 40px;" class="fieldsLeft">Specific Countries Only</p>
			<input type='radio' name='answer(8)'  style="radioButton" value='Y' onclick="return displayCountryOrMinPeriodWarRiskExcluded(this)">Yes&nbsp;&nbsp;
			<input type='radio' name='answer(8)'  style="radioButton" value='N' onclick="return displayCountryOrMinPeriodWarRiskExcluded(this)">No&nbsp;&nbsp;
		</div>
		
		<div id="countryWarRiskExcluded" style="display:none" class="field"><p style="margin:0 0 0 60px;" class="fieldsLeft">Countries</p>
			<select name="country" size="5">									
				   		<option value="select" selected>Select</option>
				   		<option value="US">US</option>				   			
			</select>
		</div>
		
		<div id="minPeriodWarRiskExcluded" style="display:none" class="subfield"><p style="margin:0 0 0 50px;" class="fieldsLeft">Minimum Period of Temporary Employment (months)</p>
			<input type="text" size="2" maxlength="2"/>
		</div>
		
		
		
		<div class="field">
			<h2 class="fieldsLeft">Claims Provisions</h2>
		</div>
		
		<div class="field"><p class="fieldsLeft">Payment of benefits will be made directly to any Hospital or person rendering covered services</p>
			<input type='radio' name='answer(payment_of_benefits)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(payment_of_benefits)'  style="radioButton" value='N'>No&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Include statement regarding Recovery of Overpayment or Error</p>
			<input type='radio' name='answer(include_statement)'  style="radioButton" value='Y' CHECKED>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(include_statement)'  style="radioButton" value='N'>No&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Include statement regarding Subrogation</p>
			<input type='radio' name='answer(regarding_subrogation)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(regarding_subrogation)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
		</div>
		
		<div class="field"><p class="fieldsLeft">Include Foreign National Facility of Payment Rider</p>
			<input type='radio' name='answer(foreign_national)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(foreign_national)'  style="radioButton" value='N'>No&nbsp;&nbsp;
		</div>
		
		<div class="field">
			<h2 class="fieldsLeft">Premium Provision</h2>
		</div>
		
		<div class="field"><p class="fieldsLeft">Advanced written notice for change in premium rates (days)</p>
			<input type="text" size="2" maxlength="2" value="31"/>
		</div>
		
		<div class="field"><p class="fieldsLeft">Minimum period after Policy Effective Date when rates may changes (months)</p>
			<input type="text" size="2" maxlength="2" value="12"/>
		</div>
		
		<div class="field"><p class="fieldsLeft">Include a rate change frequency limitation</p>
			<input type='radio' name='answer(FrequencyLimitation)'  onclick="displayChangeFrequencyLimitation(this)" style="radioButton" value='Y'>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(FrequencyLimitation)'  onclick="displayChangeFrequencyLimitation(this)" style="radioButton" value='N'>No&nbsp;&nbsp;
		</div>
		
		<div style="display:none;" id="MaximumRateChangeFrequency" class="subfield">
			<p class="fieldsLeft">Maximum rate change frequency (months)</p>
			<input type="text" size="2" maxlength="2" value="12"/>
		</div>
		
		<div class="field">
			<h2 class="fieldsLeft">General Provisions</h2>
		</div>
		
		<div class="field"><p class="fieldsLeft">Include Reporting Requirements</p>
			<input type='radio' name='answer(ReportingRequirements)'  style="radioButton" value='Y'>Yes&nbsp;&nbsp;
			<input type='radio' name='answer(ReportingRequirements)'  style="radioButton" value='N' CHECKED>No&nbsp;&nbsp;
		</div>
		
		<div class="field" style="margin:40px 0 0 150px;" id="submitButton">
			<input onClick="caseInformationtoCaseExclusions();LoadNewQuotePolicyExclusions();"  Style="Cursor:hand" type="button" value="Save" class="covbutton" id="CreateQuoteSubmit" >&nbsp;
		</div>
</div>

		

