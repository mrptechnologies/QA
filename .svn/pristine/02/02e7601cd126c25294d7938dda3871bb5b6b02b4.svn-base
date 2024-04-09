<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<link rel="stylesheet" type="text/css" href="../ui3.0/i/style.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />

<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>

<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>

<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<Script type="text/javascript">
var check='Y';

function displayMailingAddressBlock() {
 document.getElementById("MailingAddressBlock").style.display="block";
}
function hiddenMailingAddressBlock() {
 document.getElementById("MailingAddressBlock").style.display="none";
}
</Script>


<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td>
	</tr>
	<tr><td><a href="../Servlet?dms_id=85ab1428c2922f5921a513d91100f89b" title="Click to go to Master Insured Record" class="button2" style="width:200px" />Go to Insured Master Record</a> </td></tr>
	<tr>
		<td width="100%">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td  class="FormLabels" align="center" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="5" align="center">SUBMISSION SUMMARY </td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<div id="dialog3" style="display:none">
Dialog 3
</div>

<div id="dialog4" style="display:none">
Dialog 4
</div>

<div id='loadercontent1' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Calculating....
	</div>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="20" class="links" width="400px">
			<a href="/cvstarr/RegisterSubmission.jsp" id="Submit_Comp_Application" class="button2" style="width:210px"/>
				Submit Completed Application
			</a>
			</td>
		<td colspan="20" class="links" width="400px">
			<a href='../Servlet?dms_id=432676d478ef36fb346f510e1a3b56d2' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application Pdf</a>
		</td>
		<td colspan="20" class="links" width="400px">
			<a href="/Servlet?dms_id=4941f88a24789a6a6b74c29358026442" id="Lapse_link" class="button2" style="width:100px">Lapse</a>
		</td>
		<td colspan="20" class="links" width="400px">
			<a href="/Servlet?dms_id=bad8e3618f4b1f7e6a83cda8d6aaed6e" id="Decline_link" class="button2" style="width:100px">Decline</a>
		</td>
		<td class="links"align="left" width="100px">
			<a href="../Servlet?dms_id=0e76ba22c4faa2240e8ced211674b443">Activity Log </a>
		</td>
	</tr>
</table>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td colspan="20" class="links" width="400px">
			&nbsp;
		</td>
	</tr>
</table>

<div class="formpagenew1">

<div align="center" id="Insured" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>

       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
    <tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
			<tr>
				<td width="100%" align="center">

					<form name="AddCustomer" method="post" action="/SavedSubmissionInsured.go" onsubmit="return validateFields()" id="insuredTab"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="bb8dcb51cc17b672db54abff5527af6f">
					 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox">
						<tr>
								<td align="left" colspan="3">
								  <h3>Agency Information</h3>
			      				</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr><td colspan="3">
							    <table width="100%" border="0">
								     <tr>
								     	<td class="field" align="right" width="38%">Agency *</td>
								     	<td >&nbsp;&nbsp;&nbsp;</td>
										<td class="links" width="30%"><input type="text" name="answer(AgencyName)" maxlength="60" size="60" value="ACCESS E&amp;S INSURANCE SERVICES" readonly="readonly" class="txtbox" id="Agenname"></td>
										<td width="30%">
											<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOSubmissionAgencyFind()">
										</td>
								     </tr>
								 	 <tr><td colspan="4">&nbsp;</td></tr>
								</table>
			    			</td></tr>

						<tr>
							<td colspan="3" align="left"><h3>Submission Insured Information</h3></td>
				        </tr>
			    		<tr><td colspan="3">&nbsp;</td></tr>
        				<tr>
				          <td class="field" align="right" width="34%">Insured Name Type:</td>
				          <td width="2%">&nbsp;</td>
						  <td class="links" style="Class:txtbox" align="left" width="64%">
						      <select name="answer(Object::Customer::NameType)" onchange="showCompanyInformation(this.form)" class="txtbox" id="NameType"><option value="Person" class="txtbox">Person</option>
								     <option value="Company" selected="selected" class="txtbox">Company</option></select>
						  </td>
						</tr>

				     <!--  to pass to the script -->
					<input type="hidden" name="answer(Object::Customer::CustomerId)" value="7217" id="CustomerID">


					 <tr>
						<td width="34%" align="right" class="field" id="insuredNameBlock"><font color="red">* Legal Name 1:</font></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::CustomerName)" maxlength="" size="65" value="clearance 123" class="txtbox" id="InsuredName"></td>
				    </tr>
				    <tr>
						<td width="34%" align="right" class="field" id="insuredNameBlock">Legal Name 2:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::CustomerName2)" maxlength="" size="65" value="" class="txtbox" id="InsuredName2"></td>
				    </tr>
				 	<tr>
						<td width="34%" class="field" align="right">Name Code:</td>
						<td width="2%">&nbsp;</td>
						<td align="left" width="64%">
						 <input type="text" name="answer(Object::Customer::CustomerNumber)" maxlength="8" size="8" value="" class="txtbox" id="InsuredNumber">

						</td>

					</tr>
				    <tr id="DBABlock">
						<td width="34%" align="right" class="field">Insured DBA:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::DBA)" maxlength="" size="65" value="" class="txtbox" id="DBA"></td>
			       </tr>
			       <tr>
				         <td colspan="3">&nbsp;</td>
				   </tr>
				   <tr>
				         <td  colspan="3" align="left"><h3>Primary Business Address</h3></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field">Address Line 1:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::StreetName)" maxlength="50" size="60" value="" class="txtbox" id="Address1"></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field">Address Line 2:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::Address2)" maxlength="50" size="60" value="" class="txtbox" id="Address2"></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field"><font color="red">* City:</font></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::City)" maxlength="40" value="65Th Infantry" class="txtbox" id="City"></td>
				   </tr>
				   <tr>
						<td width="34%" align="right" class="field"><font color="red">* State/Province:</font></td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left">
						   <select name="answer(Object::Customer::State)" class="txtbox" id="State"><option value="" class="txtbox">Select A State</option>
								<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AS">American Samoa</option>
								<option value="AZ">Arizona</option>
								<option value="AR">Arkansas</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="DC">District of Columbia</option>
								<option value="FM">Federated States of Micronesia</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="GU">Guam</option>
								<option value="HI">Hawaii</option>
								<option value="ID">Idaho</option>
								<option value="IL">Illinois</option>
								<option value="IN">Indiana</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="ME">Maine</option>
								<option value="MH">Marshall Islands</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NV">Nevada</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="MP">Northern Mariana Islands</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PW">Palau</option>
								<option value="PA">Pennsylvania</option>
								<option value="PR" selected="selected">Puerto Rico</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VT">Vermont</option>
								<option value="VI">Virgin Islands</option>
								<option value="VA">Virginia</option>
								<option value="WA">Washington</option>
								<option value="WV">West Virginia</option>
								<option value="WI">Wisconsin</option>
								<option value="WY">Wyoming</option></select>
						</td>
				      </tr>
				      <tr>
							<td width="34%" align="right" class="field"><font color="red">* Zip Code:</font></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
							 <input type="text" name="answer(Object::Customer::Zip)" maxlength="10" value="00924" style="width:150px;" class="txtbox" id="Zip">
			            	   <a href="../Servlet?dms_id=5bd6adc669bae594e1c3284b82030e35" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
			            	</td>
					  </tr>
					  <tr>
							<td width="34%" align="right" class="field">Country:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
							    <select name="answer(Object::Customer::Address::Country)" class="txtbox" id="Country"><option value="USA" selected="selected" class="txtbox">United States</option></select>
							</td>
					  </tr>
					 
					  <tr><td colspan="3">
					   <div id="MailingAddressBlock" >
                         <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
                           <tr>
                             <td class="field" align="right" width="34%">
								Genius Address 1
							 </td>
							 <td width="2%">&nbsp;</td>
							 <td width="64%" align="left">
				     		   <input type="text" name="answer(Object::Submission::MailingAddress1)" maxlength="50" size="60" value="" class="txtbox" id="MailingAddress1">
							 </td>
						   </tr>
						   <tr>
								<td class="field" align="right" width="34%">
									Genius Address 2
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
							    	<input type="text" name="answer(Object::Submission::MailingAddress2)" maxlength="50" size="60" value="" class="txtbox" id="MailingAddress2">
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">
									Genius Address 3
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
							      <input type="text" name="answer(Object::Submission::MailingAddress3)" maxlength="50" size="60" value="65Th Infantry PR 00924" class="txtbox" id="MailingAddress3">
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">
									Genius Address 4
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
						    		<input type="text" name="answer(Object::Submission::MailingAddress4)" maxlength="50" size="60" value="" class="txtbox" id="MailingAddress4">
								</td>
							</tr><tr>
								<td class="field" align="right" width="34%">
									Genius Address 5
								</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left">
									<input type="text" name="answer(Object::Submission::MailingAddress5)" maxlength="50" size="60" value="" class="txtbox" id="MailingAddress5">
								</td>
							</tr>
						  </table>
						 </div>

						</td>
					  </tr>
					  <tr>
			               <td colspan="3">&nbsp;</td>
			          </tr>
			          <tr>
			               <td  colspan="3" align="left"><h3>Contact Information</h3></td>
			          </tr>
					  <tr>
							<td width="34%" align="right" class="field">Email Address:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><input type="text" name="answer(Object::Customer::EMailAddress)" size="30" value="" onblur="checkEmailAddress(this.form)" class="txtbox" id="emailID">
							</td>
					</tr>

					 <tr>
						<td width="34%" align="right" class="field">Phone Number:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::WorkPhoneAreaCode)" maxlength="3" size="3" value="" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" class="txtbox" id="PhoneNumber1">&nbsp;<input type="text" name="answer(Object::Customer::WorkPhoneExchangeCode)" maxlength="3" size="3" value="" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" class="txtbox" id="PhoneNumber2">&nbsp;<input type="text" name="answer(Object::Customer::WorkPhone)" maxlength="4" size="4" value="" class="txtbox" id="PhoneNumber3"></td>
					</tr>
					<tr>
						<td width="34%" align="right" class="field">Fax Number:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::FaxAreaCode)" maxlength="3" size="3" value="" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber2.focus()}" class="txtbox" id="FaxNumber1">&nbsp;<input type="text" name="answer(Object::Customer::FaxExchangeCode)" maxlength="3" size="3" value="" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber3.focus()}" class="txtbox" id="FaxNumber2">&nbsp;<input type="text" name="answer(Object::Customer::Fax)" maxlength="4" size="4" value="" class="txtbox" id="FaxNumber3"></td>
					</tr>
					<tr>
						<td width="34%" align="right" class="field">Contact First Name:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::ContactFName)" maxlength="" size="65" value="" class="txtbox" id="ContactFirstName">
						</td>
					</tr>
					<tr>
						<td width="34%" align="right" class="field">Contact Last Name:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::ContactLName)" maxlength="" size="65" value="" class="txtbox" id="ContactLastName">
						</td>
					</tr>
					<tr>
						<td width="34%" align="right" class="field">Contact Title:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::ContactTitle)" size="4" value="" class="txtbox" id="ContactTitle">
						</td>
					</tr>
					<tr id="CompanyInfmnBlock">
			          <td  colspan="3" align="left"><h3>Company Information</h3></td>
			        </tr>
					<tr id="CompanywebsiteBlock">
						<td width="34%" align="right" class="field">Website:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><input type="text" name="answer(Object::Customer::ContactURL)" size="30" value="" class="txtbox" id="CompanyWebSite">
						</td>
					</tr>
					<tr id="FOBBlock">
						<td width="34%" align="right" class="field">Form of Business:</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><select name="answer(Object::Customer::Business)" onchange="showOtherFOBInformation(this.form)" class="txtbox" id="FormOfBusiness"><option value="" selected="selected">Select</option>
							    <option value="Corporation">Corporation</option>
							    <option value="Sole Proprietor">Sole Proprietor</option>
							    <option value="Partnership">Partnership</option>
							    <option value="Joint Venture">Joint Venture</option>
							    <option value="Other">Other</option></select>
						</td>
					</tr>
					<tr id="otherFOBBlock">
						<td width="34%" align="right" class="field">If Other,please Specify</td>
						<td width="2%">&nbsp;</td>
						<td width="64%" align="left"><textarea name="answer(Object::Customer::OtherBusiness)" cols="60" rows="4" onkeyup="maxLengthTextArea()" id="OtherBusiness"></textarea>
						</td>
					</tr>
					<tr>
			               <td colspan="3">&nbsp;</td>
			          </tr>

					<tr>
							 <td width="34%" align="right">
								  <input type="submit" name="answer(button)" value="Save" class="covbutton">
							  </td>
							  <td width="2%">&nbsp;</td>
							   <td width="64%" align="left">
								   <input type="reset" value="Reset" class="covbutton">
							  </td>

				     	</tr>
				     	<tr>
			               <td colspan="3">&nbsp;</td>
			            </tr>
		</table>
	<input type="hidden" name="answer(Object::Customer::CustomerId)" value="7217">

	<input type="hidden" name="answer(Object::Submission::SubmissionId)" value="461">
	<input type="hidden" name="answer(Object::Submission::SubmissionVerId)" value="1296">
	<input type="hidden" name="answer(Object::Submission::Status)" value="In Progress">
	<input type="hidden" name="answer(Object::Submission::ClearanceStatus)" value="Blocked">
	<input type="hidden" name="answer(duplicateAllowed)" value="no">
	<input type="hidden" name="answer(Object::UserDetail::ownerId)" value="12" id="ownerId">
	<input type="hidden" name="answer(Object::Submission::OwnerId)" value="12" id="ownerId">
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
	<input type="hidden" name="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="12">
	<input type="hidden" name="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="12">

  	<input type="hidden" name="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="underwriter1">
    <input type="hidden" name="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="underwriter1">
	<input type="hidden" name="answer(requestForm)" value="Submission">
	<input type="hidden" name="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION">
   	<input type="hidden" name="answer(Object::Customer::User)" value="underwriter1">
  	<input type="hidden" name="answer(Object::Submission::CreatedBy)" value="underwriter1">
   	<input type="hidden" name="answer(Object::Submission::UpdatedBy)" value="underwriter1">
	<input type="hidden" name="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="12">
	<input type="hidden" name="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="underwriter1">
	<input type="hidden" name="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="12">
	<input type="hidden" name="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="underwriter1">
	<input type="hidden" name="answer(versionid)" value="3">
	<input type="hidden" name="answer(RootTemplate)" value="yes">

	<input type="hidden" name="answer(Object::Submission::InsuredId)" value="7217">
	<input type="hidden" name="answer(AgentId)" value="0">

		<input type="hidden" name="answer(Agency::AgencyId)" value="6">


	<input type="hidden" name="answer(form::ForwordControl)" value="success">
	<input type="hidden" name="answer(form::ForwordControl)" value="success">

		<input type="hidden" name="answer(Agency::AgencyId)" value="6">


		<input type="hidden" name="answer(Object::Agency::AgencyId)" value="6">




	<input type="hidden" name="answer(Object::Customer::CustomerId)" value="7217">

	<input type="hidden" name="TabPanelName" value="Submission_Panel">

 </form>
<script type="text/javascript" language="JavaScript">
  <!--
  var focusControl = document.forms["AddCustomer"].elements["InsuredName"];

  if (focusControl.type != "hidden") {
     focusControl.focus();
  }
  // -->
</script>


				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>
<div align="center" id="AdditionalInsured" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
   </tr>
 	<tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
			<tr>
				<td width="100%" align="center">
					<form name="AdditionalInsured" method="post" action="/DeleteSubmissionAdditionalInsured.go" onsubmit="return deleteInsured()" id="DeleteInsuredForm"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="bb8dcb51cc17b672db54abff5527af6f">
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<tr><td colspan="12">&nbsp;</td></tr>
						 <tr>
						 <td>&nbsp;</td>
						 <td colspan="11" align="left">
						  <a href="../Servlet?dms_id=92316b9ea04db6f57075d6de77f1a0f0" class="button2" style="width:150px" />Add Additional Insured</a>
						 </td>
						 </tr>
						 <tr><td colspan="12">&nbsp;</td></tr>
						<tr>
							<td colspan="12">
							<span class="Error">Currently no Additional Insured are listed</span></td>
						</tr>

						<tr><td colspan="12">&nbsp;</td></tr>
					   </table>
						<input type="hidden" name="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="N">
						<input type="hidden" name="answer(Object::AdditionalInsured::CustomerID)" value="7217">
			  			<input type="hidden" name="answer(Object::AdditionalInsured::OwnerId)" value="12">
			        	<input type="hidden" name="TabPanelName" value="Submission_Panel">
				        <input type="hidden" name="answer(submissionId)" value="461">
				        <input type="hidden" name="answer(submissionVerId)" value="1296">
				        <input type="hidden" name="answer(Object::Customer::CustomerId)" value="7217">
			            <input type="hidden" name="answer(Object::Submission::SubmissionVerId)" value="1296">
					    <input type="hidden" name="answer(Object::Submission::SubmissionId)" value="461">
					    <input type="hidden" name="answer(customerId)" value="7217">
					    <input type="hidden" name="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION">
					    <input type="hidden" name="answer(Object::Submission::InsuredId)" value="7217">
						<input type="hidden" name="answer(Object::Customer::CustomerId)" value="7217">
						<input type="hidden" name="answer(InsuredSummaryActiveTab)" value="AdditionalInsured">
						<input type="hidden" name="InsuredSummaryActiveTab" value="AdditionalInsured">
					</form>
 		     </td>
 			</tr>
 		</table>
 	  </td>
 	 </tr>
   </table>
 </div>

<div align="center" id="Locations" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
        <td align="center" valign=bottom>
    		 <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">AdditionalInsured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
       </tr>
     </table>
         </td>

       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
  <tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
			<tr>
				<td width="100%" align="center">


					<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">




					<tr>
						<td>
						 &nbsp;<a href="../Servlet?dms_id=95b95fdd14f46d3af392e1f7d22326c5" id="AddLocation_link" class="button2" style="width:100px">Add Locations</a>	&nbsp;
						</td>
					</tr>

							<tr>
							<td class="sectionhead" width="3%" align="center">
								Edit
							</td>
							<td class="sectionhead" width="8%" align="center">
								Location Number
							</td>
							<td class="sectionhead" width="7%" align="center">
								Location Name
							</td>

							<td class="sectionhead" width="5%">
								Address1
							</td>
							<td class="sectionhead" width="5%">
								Address2
							</td>

							<td class="sectionhead" width="5%">
								City
							</td>

							<td class="sectionhead" width="5%">
								State
							</td>

							<td class="sectionhead" width="5%">
								Country
							</td>

						</tr>
							<tr>
								<td>

								</td>
							</tr>
							<tr>
								<td class="SearchResult" align="center">
									<a href="javascript:void(0);" onclick="document.getElementById('dialog3').style.display = 'block';YAHOO.example.container.dialog3.show();" ><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT=""></a>
								</td>
								<td class="SearchResult" align="center">
										<a href="../Servlet?dms_id=22b0e63e917dda85b05966040bb71b74" />1</a>

								</td>
								<td class="SearchResult" align="center">
									<a href="../Servlet?dms_id=e75bf9ffafbf0918204f86da2c582d03" />Test</a>
									&nbsp;
								</td>
								<td class="SearchResult">
									&nbsp;
								</td>

								<td class="SearchResult">
									&nbsp;
								</td>

								<td class="SearchResult">
									65Th Infantry&nbsp;
								</td>

								<td class="SearchResult">
									PR&nbsp;
								</td>

								<td class="SearchResult">
									US&nbsp;
								</td>
							</tr>
					</table>
				</td>
			</tr>
		</table>
				</td>
			</tr>
		</table>
</div>

<div align="center" id="ScheduleofTanks" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">AdditionalInsured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
  <tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
			<tr>
				<td width="100%" align="center">


					<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">
				<!-- 	<a href="../Servlet?dms_id=5e5076f394c9c2812cbb6831b08cdc14" >Risk</a>
					<tr>
					<td>&nbsp;
					</td>
					</tr>
					<a href="../Servlet?dms_id=afa6f756b1d9ebb3efdfd376bb76cd36" >Locations</a>
					<a href="../Servlet?dms_id=6526a70749d36878656fff82b78af4c4" >Location Tree List</a>
					 -->
						<tr><td colspan="10">&nbsp;</td></tr>
						<tr>
							<td class="sectionhead" width="10%" align="center">
								Number
							</td>
							<td class="sectionhead" width="20%" align="center">
								Class Name
							</td>
							<td class="sectionhead" width="70%" align="center">
								Description
							</td>
                        </tr>
						<tr>
							<td class="SearchResult" width="10%" align="center">
								1
							</td>
							<td class="SearchResult" width="20%" align="center">
								Class 1&nbsp;								
							</td>
							<td class="SearchResult" align="left" width="70%" >
								All employees of Carleton College who are in active service and are traveling on the business of Carleton College outside of their country of residence or permanent assignment.
							</td>
						</tr>

						<tr>
							<td class="SearchResult" width="10%" align="center">
								2
							</td>

							<td class="SearchResult" width="20%"  align="center">
						    	Class 2		&nbsp;
							</td>
					    	<td class="SearchResult" align="left" width="70%">
									All Dependents of a Class I Covered Person,  students, volunteers, chaperons and invited guests of Carleton College while traveling to , participating in and returning from an Insured sponsored trip outside their country of residence or permanent assignment.
							</td>
						</tr>
				</table>
				</td>
			</tr>
		</table>
				</td>
			</tr>
		</table>
</div>

<!--<div id="dialog1" style="display:none;">
<div class="hd">Please enter Class Information
</div>
<div class="bd">
<table>
	<tr>
		<td class="FormLabels" align="right">
		 Class Name
		</td>
		<td>
		  <input type="textbox" name="answer(Object::Class::Classname)" size="40" id="tankname" />
		</td>
	</tr>
	<tr>
			<td class="FormLabels" align="right">
			Description
			</td>
			<td>
			  <TEXTAREA Name="description" rows="6" cols="30"></TEXTAREA>
			</td>
	</tr>
	<tr>
		<td class="FormLabels" align="left">
		   Are Dependents included as Covered Persons in this Class
		</td>
		<td>
		  <input type="radio" name="answer(Object::Class::Like::Dependents)" value="Yes" align="left"/> Yes
		  <input type="radio" name="answer(Object::Class::Like::Dependents)" value="No" /> No
		</td>
	</tr>
	<tr>
		<td class="FormLabels" align="left">
		  Do Spouse Dependants have to be under 70
		</td>
		<td>
		<input type="radio" name="answer(Object::Class::Like::SpouseDependents)" value="Yes" align="left"/> Yes
		<input type="radio" name="answer(Object::Class::Like::SpouseDependents)" value="No" /> No
		</td>
	</tr>
	<tr>
		<td class="FormLabels" align="left">
		   Are Domestic Partners included as Dependents
		</td>
		<td>
		 <input type="radio" name="answer(Object::Class::Like::DomesticDependents)" value="Yes" align="left" /> Yes
		 <input type="radio" name="answer(Object::Class::Like::DomesticDependents)" value="No" /> No
		</td>
   </tr>

	<tr>
		<td class="FormLabels" align="left">
		   Are Dependents allowed by the IRS included as Covered Persons in this Class
		</td>
		<td>
		  <input type="radio" name="answer(Object::Class::Like::IRSDependents)" value="Yes" align="left"/> Yes
		  <input type="radio" name="answer(Object::Class::Like::IRSDependents)" value="No" /> No
		</td>
       </tr>
       <tr>
       		<td>&nbsp;&nbsp; </td>
       </tr>
	<tr>
			<td align="center">
			      <input type="button" name="answer()" value="Add Class" Id="SubmitRisk"/>
		          <input type="button" name="answer()" value="Cancel" Id="CancelRisk"/>
			</td>
	</tr>
</table>
</div>
<a class="container-close" href="javascript:void(0);" id="closeIcon1"></a>
</div>-->

<div align="center" id="RequestedCoverages" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">AdditionalInsured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr>
     <td width="100%" colspan="2" >
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
  		 <tr>
			  		<td>Currently no Requested Coverages are listed</td>
		</tr>

		</table>
     </td>
   </tr>
 </table>
</div>

<div align="center" id="GeneralQuestions" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">AdditionalInsured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	  </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=250 >
			<tr>
				<td width="100%" align="center">

					<body>
					<table>
								<tr>
									<td align="left">
											&nbsp;
									</td>
								</tr>
					</table>
					<table width="100%" align="center">
			  		 <tr>
			  		 <td align="left">
			  		 
					<div id='General Questions' ><p><form name='GeneralQuestions' method='post' action='/saveSubmissionGeneralQuestionAppSummary.go?answer(ruleName)=APPLICATION_DATA_VALIDATION_ALL_ATTRIBUTES' id='Application0' onsubmit='return validateDynamicForm1(this);'> <table  align='$ALIGN' BORDER='0' CELLSPACING='2' CELLPADDING='2' class='FormLabelsApplication' WIDTH='%' ><tr><td class='FormLabels' width='' colspan='$COLSPAN' align='$ALIGN'></td></tr><tr><td class='fieldRed' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD774'>Have you during the last five years been prosecuted, or are you currently being prosecuted, for violations of any standard or law relating to the release or threatened release from the location of a regulated substance, hazardous waste or any other pollutant?</span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE774'><input type='radio' name='answer(Object::Submission::GeneralQuestion::IsProsecuted__DMS_SUBMISSION_GENERAL_QUESTION~PROSECUTED)' $DISABLED id='IsProsecuted' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}' onclick="{if(this.value=='N'){this.form.DescribeProsecuted.value='';};executeApplicationListRule('GET_SUB_QUESTION_LIST',new Array('34'),267,282,this.form);}" value='Y'   >Yes&nbsp;&nbsp;<input type='radio' name='answer(Object::Submission::GeneralQuestion::IsProsecuted__DMS_SUBMISSION_GENERAL_QUESTION~PROSECUTED)' $DISABLED id='IsProsecuted' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}' onclick="{if(this.value=='N'){this.form.DescribeProsecuted.value='';};executeApplicationListRule('GET_SUB_QUESTION_LIST',new Array('34'),267,282,this.form);}" value='N'   >No&nbsp;&nbsp;</span></td></tr><tr><td class='fieldHidden' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD775' style='display:none'></span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE775'><input type='hidden' name='answer(Object::Submission::GeneralQuestion::DescribeProsecuted__DMS_SUBMISSION_GENERAL_QUESTION~DESCRIBE_PROSECUTED)' value='' id='DescribeProsecuted' ></span></td></tr><tr><td class='fieldRed' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD776'>Have any claims been made against you during the past five years for cleanup or response action, regulated substances, or bodily injury or property damage, resulting from the release of regulated substances, hazardous waste or any other pollutants, from this location, or other locations owned or operated by you, into the environment?</span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE776'><input type='radio' name='answer(Object::Submission::GeneralQuestion::AnyClaims__DMS_SUBMISSION_GENERAL_QUESTION~CLAIMS)' $DISABLED id='AnyClaims' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}' onclick="{if(this.value=='N'){this.form.AnyClaimsDescribe.value='';};executeApplicationListRule('GET_SUB_QUESTION_LIST',new Array('35'),267,282,this.form);}" value='Y'   >Yes&nbsp;&nbsp;<input type='radio' name='answer(Object::Submission::GeneralQuestion::AnyClaims__DMS_SUBMISSION_GENERAL_QUESTION~CLAIMS)' $DISABLED id='AnyClaims' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}' onclick="{if(this.value=='N'){this.form.AnyClaimsDescribe.value='';};executeApplicationListRule('GET_SUB_QUESTION_LIST',new Array('35'),267,282,this.form);}" value='N'   >No&nbsp;&nbsp;</span></td></tr><tr><td class='fieldHidden' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD777' style='display:none'></span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE777'><input type='hidden' name='answer(Object::Submission::GeneralQuestion::AnyClaimsDescribe__DMS_SUBMISSION_GENERAL_QUESTION~DESCRIBE_CLAIMS)' value='' id='AnyClaimsDescribe' ></span></td></tr><tr><td class='fieldRed' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD778'>At the time of the signing of this application, do you know of any facts or circumstances which may reasonably be expected to result in a claim being asserted against your company for environmental cleanup or response, or for bodily injury or property damage arising from the release of a pollutant into the environment? </span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE778'><input type='radio' name='answer(Object::Submission::GeneralQuestion::AnyClaimsAtSigning__DMS_SUBMISSION_GENERAL_QUESTION~CLAIMS_SIGNED)' $DISABLED id='AnyClaimsAtSigning' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}' onclick="{if(this.value=='N'){this.form.AnyClaimsAtSigningDescribe.value='';};executeApplicationListRule('GET_SUB_QUESTION_LIST',new Array('36'),267,282,this.form);}
" value='Y'   >Yes&nbsp;&nbsp;<input type='radio' name='answer(Object::Submission::GeneralQuestion::AnyClaimsAtSigning__DMS_SUBMISSION_GENERAL_QUESTION~CLAIMS_SIGNED)' $DISABLED id='AnyClaimsAtSigning' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}' onclick="{if(this.value=='N'){this.form.AnyClaimsAtSigningDescribe.value='';};executeApplicationListRule('GET_SUB_QUESTION_LIST',new Array('36'),267,282,this.form);}
" value='N'   >No&nbsp;&nbsp;</span></td></tr><tr><td class='fieldHidden' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD800' style='display:none'></span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE800'><input type='hidden' name='answer(Object::Submission::GeneralQuestion::AnyClaimsAtSigningDescribe__DMS_SUBMISSION_GENERAL_QUESTION~DESCRIBE_CLAIMS_SIGNED)' value='' id='AnyClaimsAtSigningDescribe' ></span></td></tr><tr><td class='fieldRed' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD780'>Name of Applicant</span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE780'><input type='text' name='answer(Object::Submission::GeneralQuestion::NameOfApplicat__DMS_SUBMISSION_GENERAL_QUESTION~NAME_APLICANT)' $DISABLED value="" maxlength='100' class='txtbox' size='25'  id='NameOfApplicat' onkeyup=""  onblur=""  onClick="" alt="var canSubmit=true;canSubmit=validatePrimaryData(this,'String','','','N','Please enter the Name of Applicant');canSubmit;" onChange="executePrimaryDataValidationRule('APPLICATION_DATA_VALIDATION_VER1',this.form,this,'780','Please enter the Name of Applicant','')" ></span></td></tr><tr><td class='fieldRed' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD781'>Title of Applicant</span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE781'><input type='text' name='answer(Object::Submission::GeneralQuestion::TitleOfApplicat__DMS_SUBMISSION_GENERAL_QUESTION~TITLE_APPLICANT)' $DISABLED value="" maxlength='100' class='txtbox' size='25'  id='TitleOfApplicat' onkeyup=""  onblur=""  onClick="" alt="var canSubmit=true;canSubmit=validatePrimaryData(this,'String','','','N','Please enter the Title of Applicant');canSubmit;" onChange="executePrimaryDataValidationRule('APPLICATION_DATA_VALIDATION_VER1',this.form,this,'781','Please enter the Title of Applicant','')" ></span></td></tr><tr><td class='fieldHidden' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD782' style='display:none'></span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE782'><input type='hidden' name='answer(Object::Submission::SubmissionId__DMS_SUBMISSION_GENERAL_QUESTION~DMS_SUBMISSION_ID)' value='' id='SubmissionId' ></span></td></tr><tr><td class='fieldHidden' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD783' style='display:none'></span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE783'><input type='hidden' name='answer(Object::Submission::SubmissionVerId__DMS_SUBMISSION_GENERAL_QUESTION~DMS_SUBMISSION_VER_ID)' value='' id='SubmissionVerId' ></span></td></tr><tr><td class='fieldHidden' width='40%' colspan='$COLSPAN' align='Right'><span id='ApplicationList_ATTRIBUTEHEAD804' style='display:none'></span></td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'><span id='ApplicationList_ATTRIBUTE804'><input type='hidden' name='answer(Object::Submission::InsuredId__DMS_SUBMISSION_GENERAL_QUESTION~DMS_SUBMISSION_INSURED_ID)' value='' id='InsuredId' ></span></td></tr></table> <table><tr><td><INPUT TYPE='submit' name='answer(SubmitType)' value='Next' class='sbttn' id ='submitButton' onclick='formSubmitType=updateElement'></td><td></td></tr> <input type='hidden' name='answer(SubApplicationId)' value='267'> <input type='hidden' name='answer(SubApplicationVerId)' value='282'> <input type='hidden' name='answer(defaultSubAppTabIndex)' value=''> <input type='hidden' name='answer(applicationId)' value='171'> <input type='hidden' name='answer(applicationVerId)' value='217'> <input type='hidden' name='answer(ruleName)' value='$RULENAME' id='ruleName'> <input type='hidden' name='answer(ruleGroupId)' value='' id='ruleGroupId' > <input type='hidden' name='Navigation' value='' id='Navigation' > <input type='hidden' name='applicationIndex' value='ApplicationList' id='applicationIndex' ><input type='hidden' name='answer(requestForm)' value='Submission' id='requestForm' ><input type='hidden' name='answer(Object::Submission::SubmissionId)' value='461' id='SubmissionId' ><input type='hidden' name='answer(customerId)' value='7217' id='customerId' ><input type='hidden' name='answer(dbName)' value='java:/jdbc/libertyds' id='dbName' ><input type='hidden' name='answer(Object::Customer::CustomerId)' value='7217' id='CustomerId' ><input type='hidden' name='answer(TabPanelName)' value='Submission_Panel' id='TabPanelName' ><input type='hidden' name='answer(tabNo)' value='0' id='tabNo' ><input type='hidden' name='answer(Object::Application::ApplicationType)' value='SUBMISSION_APPLICATION' id='ApplicationType' ><input type='hidden' name='answer(Object::Submission::InsuredId)' value='7217' id='InsuredId' ><input type='hidden' name='answer(Object::Submission::SubmissionVerId)' value='1296' id='SubmissionVerId' > </table></form></p></div>
					<span id="messageHoldernew" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
					</td>
					</tr>
					</table>
					</body>
				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>

<div align="center" id="Quotes" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">AdditionalInsured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>
	 </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
			<tr>
				<td width="100%" align="center">

					<form name="DataForm" method="post" action="/DeleteEILQuoteConfirmAction.go" onsubmit="return validateDelete(this)"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="bb8dcb51cc17b672db54abff5527af6f">
					<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">
						<tr>
					      <td>
					        <input type="hidden" name="answer(Object::Risk::RiskId)" value="1">
    				           <input type="hidden" name="answer(Object::Activity::OwnerId)" value="12">
								<input type="hidden" name="answer(Object::Activity::CreatedBy)" value="underwriter1">
							<input type="hidden" name="answer(Object::Activity::UpdatedBy)" value="underwriter1">
					      </td>
					    </tr>
					<tr>
						<td colspan="3">
						<span class="Error">Currently no Quotes are listed</span></td>
					</tr>
				<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="5">
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				</tr>
				</table></td>
				</tr>
	</table>
			<input type="hidden" name="answer(Object::Agency::AgencyId)" value="6">
			<input type="hidden" name="answer(Object::Customer::CustomerId)" value="7217">
			<input type="hidden" name="answer(Entity::Equals::OwnerId)" value="12">
			<input type="hidden" name="answer(Object::UserDetail::ownerId)" value="12">
			<input type="hidden" name="answer(Object::Customer::State)" value="PR">
			<input type="hidden" name="TabPanelName" value="Submission_Panel">
			<input type="hidden" name="answer(Object::Submission::SubmissionId)" value="461">
			<input type="hidden" name="answer(Object::Submission::SubmissionVerId)" value="1296">
			<input type="hidden" name="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION">
			<input type="hidden" name="answer(Object::Clearance::RetroDateFlag)" value="" id="RetroDateModifiedFlag">
</form>
				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>
<div align="center" id="Policy" style="display:none">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">
	<tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
    <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  >
				<tr>
					<td align="center" onClick="document.getElementById('Insured').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Insured</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('AdditionalInsured').style.display='inline';document.getElementById('Policy').style.display='none';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none'"  Style="Cursor:hand">AdditionalInsured</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('ScheduleofTanks').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 >
				<tr>
					<td align="center" onClick="document.getElementById('RequestedCoverages').style.display='inline';document.getElementById('Insured').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand" >Requested Coverages</td>
				</tr>
			</table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Quotes').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('Policy').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" class="todotab_active" height=35>
				<tr>
					<td align="center" onClick="document.getElementById('Policy').style.display='inline';document.getElementById('RequestedCoverages').style.display='none';document.getElementById('Locations').style.display='none';document.getElementById('ScheduleofTanks').style.display='none';document.getElementById('GeneralQuestions').style.display='none';document.getElementById('Quotes').style.display='none';document.getElementById('Insured').style.display='none';document.getElementById('AdditionalInsured').style.display='none';"  Style="Cursor:hand">Policy</td>
				</tr>
			</table>
         </td>

       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>
   <tr>
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height=100 >
			<tr>
				<td width="100%" align="center">
							 <table WIDTH="100%" ALIGN="center" cellspacing=1 cellpadding="1" border="0">
   							 <tr>
									<td class="error">
										No Policies associated to the insured
									</td>
								</tr>

						</table>

				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>
</div>

<SCRIPT type="text/javascript">
   	isSpecificValidationNeeded = true;
	 function doSpecificValidation(frm){
	 	if(frm.name !="RequestedCoverages"){
	 	   if(validateGeneralQuestions(frm)){
					return true;
				}else{
					return false;
				}
	 	}
	 	return true;
 	}
    tooltipYOffset2 = '+60';
    tooltipXOffset2 = '+50';
	var formElement=document.getElementById("insuredTab");

	showCompanyInformation(formElement);
	function validateDelete(form)
	{
		var formElement=form;
		var found_it = false;
		for (var i=0; i < formElement.elements.length; ++i) {
			// Get the current field
			form_field = formElement.elements[i];
			// Get the field's id
			form_element_id = formElement.elements[i].id;
			// Is it a check box field?
			if (form_element_id.indexOf("quoteDelCheckbox")!=-1) {
				if (form_field.checked)
				{
					found_it = true;
				    break;
				}
			}
		}
		if(!found_it)
		{
			alert("Please select the quote to delete.");
			return false;
		}
		return true;
	}
	document.getElementsByName('answer(SubmitType)')[0].value='Save';
	document.getElementsByName('answer(SubmitType)')[1].value='Save';

if (check=='Y'){
 document.getElementById("MailingAddressSameAsBusinessAddress_Y").checked="checked";
}

if(check=='N') {
 document.getElementById("MailingAddressSameAsBusinessAddress_N").checked="checked";
 document.getElementById("MailingAddressBlock").style.display="block";
}
</SCRIPT>
<script type="text/javascript">
	document.getElementById("Insured").style.display = "block";
function deleteInsured(){

			var frm = document.getElementById("DeleteInsuredForm");
			var count = 0;
			for(var i=0; frm.elements[i]!=null; i++) {

				if(frm.elements[i].name == "answer(Object::AdditionalInsured::SelectedAdditionalInsured)" && frm.elements[i].checked == true) {
					count++;
					break;
				}
			}
			if(count>0) {
				var ans = window.confirm('Are you sure that you want to delete the selected records?');
				if (ans)
					return true;
				else
					return false;
			} else {
				alert("Please Select any Additional Insured to Delete.");
				return false;
			}
	}
</script>
<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>
 	 	</div>
<br class="clear" />
<div style="display:none" id="EmptyDivForResetTimer"></div>
</html>



