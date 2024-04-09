<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<link href="styles/Styles.css" rel="stylesheet" type="text/css">
<title>Welcome</title>
<!-- <html:base/> -->
<style type="text/css">
p {
    FONT-WEIGHT: bold;
    FONT-SIZE: 12px;
    COLOR: white;
    FONT-FAMILY: Verdana, Arial, Helvetica;
    BACKGROUND-COLOR: #151B54
}
p1 {


}

ul 
{
list-style-image: url('arrow.gif')
}
</style>

</head>
<script>

function showCoveregeQuestions(val){

 
 if(val == "Yes"){
 	document.getElementById("questions").style.display = 'block';
  }
  else{
    document.getElementById("contractDate").value = "";
    document.getElementById("sponsor").value = "";    
    document.getElementById("questions").style.display = 'none';
  }
}

function validateFields(){
    var formElement=document.forms[0];
   
		var fName = document.getElementById("InsuredFName").value;
	
		var lName = document.getElementById("InsuredLName").value;
	
		document.getElementById("customerName").value = lName+" "+fName;
    	var cust = document.getElementById("customerName").value;
    	
    
	if(document.getElementById("InsuredFName").value==""){
		alert("Please enter your First Name");
		return false;
	}
	if(document.getElementById("InsuredLName").value==""){
		alert("Please enter your Last Name");
		return false;
	}
	if(document.getElementById("EmailAddress").value==""){
		alert("Please enter your Email Address");
		return false;
	}
	if(document.getElementById("confirmEmailAddress").value==""){
		alert("Please enter your Confirm Email Address");
		return false;
	}
	
    if(formElement.PhoneNumber1.value=="" && formElement.PhoneNumber2.value=="" && formElement.PhoneNumber3.value==""){
		alert("Please enter the Phone #");
		return false;
	 }
    if(formElement.EmailAddress.value!="")
	{
		var filter  = /(([a-zA-Z0-9\-?\.?]+)@(([a-zA-Z0-9\-_]+\.)+)([a-z]{2,3})(\W?[,;]\W?(?!$))?)+$/i;
		if (!filter.test(formElement.EmailAddress.value)){
			alert("Invalid EMail address.");
			document.getElementById("EmailAddress").focus();
			return false;
	}
}
   if(document.getElementById("EmailAddress").value != document.getElementById("confirmEmailAddress").value){
	    alert("Your Email address and confirm Email address does'nt match");
	    return false;
	}
	
	
	
}
</script>
<body bgcolor="blue">
 <form  action="/RegisterInsured.go" name="AddCustomer" method="post" onsubmit="return validateFields()">
 
 <table width="100%">
 <tr>
  		                       <td width="25%" align="left" >
		                      &nbsp; <IMG SRC="../Images/SolartisLogo.gif" BORDER="0" ALT="" height="70"></td>                           
	                           </td>
                           </tr>
 <tr>
 <td>
 
  						<tr>
	                           <td align="center">
	                         <h6> <p> Life Insurance Agents Registration</p></h6>
	                           </td>
                          </tr>
 
 </td>
 
 </tr>
 <tr>
 <td class="links">
 Please enter the following information to register and start the enrollment process.
 
 </td>
 
 </tr>
 
 </table>
<table WIDTH="100%" style="height:50%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="">
<tr>
<td>
 <table WIDTH="99.9%" style="height:90%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="">
         
                           
                           
                           
                           
                           <tr height="2%" >
								<td width="30%" class="FormLabels" align="left">First Name:*</td>
								<td class="links">&nbsp;
								<input type=text name="answer(Object::Customer::Contact::FName)" size="30" maxlength="60" class="txtbox" id="InsuredFName" />
								</td>
							</tr>
								
							 
							
							<tr height="2%">
								<td class="FormLabels" align="left" width="30%">Last Name:*</td>
								<td class="links">&nbsp;
								<input type=text   name="answer(Object::Customer::Contact::LName)" size="25" maxlength="40" class="txtbox" id="InsuredLName" /> 
							</td>
							</tr>	
							 <tr height="2%">
								<td class="FormLabels" align="left" width="30%">Phone #</td>
								<td class="links">&nbsp;
								<input type=text   name="answer(Object::Customer::WorkPhoneAreaCode)"  size="3" maxlength="3" class="txtbox" id="PhoneNumber1"  onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}"/>&nbsp;<input type = text  name ="answer(Object::Customer::WorkPhoneExchangeCode)"  size="3" maxlength="3" class="txtbox" id="PhoneNumber2" onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;<input type=text  name="answer(Object::Customer::WorkPhone)"  size="4" maxlength="4" class="txtbox" id="PhoneNumber3" /></td>
							</tr>	
							<tr height="2%">
								<td align="left" class="FormLabels" width="30%">Email Address:*</td>
								<td class="links">&nbsp;
								<input type=text name="answer(Object::Customer::EMailAddress)" size="30" class="txtbox" id="EmailAddress">
							</tr>
							<tr height="2%">
								<td align="left" class="FormLabels" width="30%">Confirm Email Address:*</td>
								<td class="links">&nbsp;
								<input type=text name="answer(Object::Customer::ConfirmEMailAddress)" size="30" class="txtbox" id="confirmEmailAddress">
							</tr>
												
							<tr height="2%">
								<td class="FormLabels" align="left" width="30%">Resident license State:*</td>
							
								<td class="links" style="Class:txtbox">&nbsp;
								<select  name="answer(Object::Customer::State)" class="txtbox" id="State">
																		   	
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
												<option value="PR">Puerto Rico</option>
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
												<option value="WY">Wyoming</option>
												

			                                   
									  
   
									</select>
								</td>
							</tr>
							<tr height="2%">
								<td align="left" class="FormLabels" width="30%">Approximately when were you, or when will you be, contracted with the sponsor of this insurance program ?(MM/DD/YYYY)- leave blank if you do not have current coverage &nbsp;</td>
								<td class="links">&nbsp;
									<input type=text class="txtbox"  name="answer(Object::Customer::SponsorDate)" size="11" maxlength="11" id="contractDate"/>
								</td>
							
							</tr>
							<tr height="2%">
								<td align="left" class="FormLabels" width="30%">Do you have current coverege? &nbsp;</td>
								<td class="links">&nbsp;
									Yes&nbsp;<input type=radio   name="answer(Object::CustomerAdditional::CurrentCoverege)" value = yes  id="currentCoverege"onclick='showCoveregeQuestions("Yes");'/>
									No&nbsp;<input type=radio   name="answer(Object::CustomerAdditional::CurrentCoverege)" value = No  id="currentCoverege1" onclick='showCoveregeQuestions("No");'/>
									
								</td>
							
							</tr>
							
					</td>
					</tr>		
							
							
					</table>
					</td>
					</tr>
					<tr>
					<td>
					<div id=questions style="display: none;">
				<table WIDTH="99.9%" style="height:93%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="">
					<tr>
								<td align="left" class="FormLabels" width="30%">What is the expiration date of your current E&O coverage? (MM/DD/YYYY)  &nbsp;</td>
								<td class="links">&nbsp;
									<input type=text class="txtbox"  name="answer(Object::CustomerAdditional::CoverageExpirationDate)" size="11" maxlength="11" id="contractDate"/>
								</td>
							
							</tr>
							
							<tr>							
							    <td align="left" class="FormLabels"width="30%">Who is the carrier for your current coverage? &nbsp;</td>		
							    <td class="links" style="Class:txtbox">&nbsp;
								    <input type="text" class="txtbox" name=answer(Object::CustomerAdditional::CoverageCarrier) size=30 maxlength=40 id=sponsor />
								    							
								</td>
							</tr>
					
					</table>
					</td>
					</tr>
					</div>
					<tr>
					<td>
					<table>
					<tr>
									<td align="left" >
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
										<input type=submit value="Register" name="amswer(button)" class="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
										&nbsp;&nbsp;&nbsp;
										<input type=reset value="Reset" class="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
									
									</td>
							</tr>
							</td>
							</tr>
							
					</table>
					    <input type=hidden name="answer(Object::Customer::CustomerName)" id="customerName" />
					    <input type=hidden  name="AddCustomer" property ="answer(AgencyName)" value="Boswell Insurance Agency"  />
					    <input type=hidden name="answer(Object::CustomerAdditional::ProgramName)" value="Producer Protection Group" />
						<input type=hidden name="answer(Object::UserDetail::PrimaryObjectType)" value="CUSTOMER" />
						<input type=hidden name="answer(Object::UserDetail::email)" value=""/>
						<input type=hidden name="answer(Object::UserDetail::userName)" value="GUEST"/>
						<input type=hidden name="answer(Object::UserDetail::passWord)" value="" />
						<input type=hidden name="answer(Object::UserDetail::PasswordKey)" value="" />
						<input type=hidden name="answer(Object::UserDetail::passWordConfirm)" value="" />
						<input type=hidden name="answer(Object::UserDetail::roleName)" value="CUSTOMER"/>
						<input type="hidden" name="answer(AgentId)" value="11">
						<input type="hidden" name="answer(Agency::AgencyId)" value="11">
						<input type="hidden" name="answer(Object::Agency::AgencyId)" value="11">
						<input type=hidden name="answer(Object::UserDetail::PrimaryObjectId)" />
						<input type=hidden name="answer(Object::UserDetail::User)" value="GUEST" />
						<input type=hidden name="answer(forwardNavigate)" value="success" />
						<input type=hidden name="formName" value="form::LINKCUSTOMER" />
						<input type=hidden name="answer(Object::Notification::Email::AttachmentCount)" value="0" /> 
					    <input type=hidden name="answer(Object::Notification::Email::NotificationType)" value="EMAIL" />
					    <input type=hidden name="answer(Object::Notification::Email::OwnerId)" value="12" />
					    <input type=hidden name="answer(Object::Notification::Email::FromAddress)" value="test@solartis.net" />                               
					    <input type=hidden name="answer(Object::UserDetail::passWord)" value="" id=passWord/>
					 <%
						 session.setAttribute("InsType","Professional Liability");
						 session.setAttribute("ownerId","12");
						 session.setAttribute("dbname","java:/jdbc/solartisds");
						 session.setAttribute("ReadDS","java:/jdbc/solartisds");
						 session.setAttribute("WriteDS","java:/jdbc/solartisds");
	 				%>
	 			
		<!-- <td colspan="2" align="center"><input type="submit" value="Log In1" class="sbttn"></td> -->
		<INPUT name="answer(form::ForwordControl)" type=hidden value="success"/>
		<INPUT name="answer(Object::UserDetail::siteId)" type=hidden value="12"/>
		<INPUT name="answer(Object::UserDetail::ownerId)" type=hidden value="12"/>
		<INPUT name="answer(dbname)" type=hidden value="java:/jdbc/solartisds"/>
		<INPUT name=ownerId type=hidden value="12"/>
		<INPUT name=formName type=hidden value="form::LoginMICACARE"/>
		<INPUT name=page type=hidden value="1"/>
		<INPUT name="answer(INSURANCE_TYPE)" type=hidden value="Professional Liability"/>
		<INPUT name="answer(Page::Title)" type=hidden value=""/>
		<INPUT name="answer(PageLogo)" type=hidden value=""/>
     <table>
     <tr>
     
     </tr>
	<tr>
							<td align="left" width="300px">
								<img src="../Images/Poweredby.gif" alt="Powered By Solartis" WIDTH="100" HEIGHT="25">
							</td>
							<td align="center" class ="PageFooter" width="450px">
								
							</td>
  </tr>			
  </table>				
  
					</table>
		</form>			
	</body>
	
	</html:html>
					
					
