<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>


 <SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"></SCRIPT>
 <SCRIPT type="text/javascript" SRC="../Scripts/JScripts/BusinessClass.js"></SCRIPT>
 <script type="text/javascript" src="../Scripts/prototype.js"></script>
 
 
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/assets/skins/sam/menu.css">
<%-- <link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/assets/skins/sam/skin.css">--%>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../Scripts/YUI/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
 

<!--<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/autocomplete/assets/skins/sam/autocomplete.css" />
--><script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
 
 <jsp:include page="../common/autoCompleteScript.jsp">
 <jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEzIPCODEADDEDITEMPLOYER" />
 </jsp:include>

<style>
#container { 
       height:2em;        
       z-index: 100;
       }
</style>

<SCRIPT type="text/javascript">
	function submitAgency(form){
	 	var url = "/updateQuoteAgencyAgent.do?";
	 	new Ajax.Request(url,{method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){
			forwardToLoginPageIfInvalidSession(transport.responseText);
		 },onSuccess: function(transport){UpdateAgency(form)}});
	}
</SCRIPT>
<script>
YAHOO.namespace("example.container");
 
function ShowDialogBox(form) {
	// Define various event handlers for Dialog
	var handleYes = function() {
		document.getElementById("linkToInsured").value = "true";
		submitAgency(form);
		this.hide();
	};
	var handleNo = function() {
		document.getElementById("linkToInsured").value = "false";
		submitAgency(form);
		this.hide();
	};
	
	var handleCancel = function(){
	this.hide();
	}

	// Instantiate the Dialog
	YAHOO.example.container.simpledialog1 = new YAHOO.widget.SimpleDialog("simpledialog1", 
{ 
width: "500px",
fixedcenter: false,
draggable: false,
visible: false,
close: false,
text:"Saving Agency/Agent Contact will update information for this Quote. Do you wish to update this change for the Insured (level) also? <br><br> Click 'Yes' to save at Insured level too. <br> Click 'No' to make this change only for this Quote.<br> Click 'Cancel' not to save.",
constraintoviewport: true,
buttons: [  { text:"Yes", handler:handleYes, isDefault:true },
			{ text:"No",  handler:handleNo },
			{ text:"Cancel",  handler:handleCancel } ]
		 } );
	YAHOO.example.container.simpledialog1.setHeader("Change Agency/Agent");
	
	// Render the Dialog
	YAHOO.example.container.simpledialog1.render("container");
   YAHOO.example.container.simpledialog1.show();
	YAHOO.util.Event.addListener("show", "click", YAHOO.example.container.simpledialog1.show, YAHOO.example.container.simpledialog1, true);
	//YAHOO.util.Event.addListener("hide", "click", YAHOO.example.container.simpledialog1.hide, YAHOO.example.container.simpledialog1, true);

}

</script>

<script type="text/javascript">
   function EditAgent(form){
 		var url = "/UpdateAgent.do?";
 		new Ajax.Request(url,{method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){
			forwardToLoginPageIfInvalidSession(transport.responseText);
		 },onSuccess: function(transport){ShowDialogBox(form)}})
  }
</script>

<script type="text/javascript">
  function UpdateAgency(form){
   	var dispParentQUoteId= escape(form.parentQuoteId.value);
   	var dispParentQuoteStatus = escape(form.parentQuoteStatus.value);
   	var disCustid = escape(form.CustomerID.value);
   	var pars = "parentQuoteId="+dispParentQUoteId+"&paretQuoteStatus="+dispParentQuoteStatus+"&answer(customerId)="+disCustid;
   	var url = "../common/QuoteInsuredAgencyLink.jsp?"+pars;
   	new Ajax.Request(url,{method: 'post',parameters:pars,onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
	 },onSuccess: function(transport){window.opener.QuoteInsuerdAgencyAgentHeader.innerHTML = transport.responseText;window.close();}});
 
 }
</script>

<script type="text/javascript">
	function dispTextBoxes(){
	
		if(document.getElementById("StyleAgentNumber").value > 0){
		
			document.getElementById("StyleAgentFirstName2").value = document.getElementById("StyleAgentFirstName").value;
			document.getElementById("firstName1").style.display= 'none';
			document.getElementById("firstName2").style.display= 'inline';
			document.getElementById("StyleAgentLastName2").value = document.getElementById("StyleAgentLastName").value;
			document.getElementById("LastName1").style.display= 'none';
			document.getElementById("LastName2").style.display= 'inline';
			document.getElementById("StyleAgentMiddleName2").value = document.getElementById("StyleAgentMiddleName").value;
			document.getElementById("MiddleName1").style.display= 'none';
			document.getElementById("MiddleName2").style.display= 'inline';
			document.getElementById("StyleAgentBusinessID2").value = document.getElementById("StyleAgentBusinessID").value;
			document.getElementById("emailId1").style.display= 'none';
			document.getElementById("emailId2").style.display= 'inline';
			document.getElementById("StyleAgentPhone2").value = document.getElementById("StyleAgentPhone").value;
			document.getElementById("workPh1").style.display= 'none';
			document.getElementById("workPh2").style.display= 'inline';
			document.getElementById("StyleAgentFax2").value = document.getElementById("StyleAgentFax").value;
			document.getElementById("fax1").style.display= 'none';
			document.getElementById("fax2").style.display= 'inline';
			document.getElementById("ChangeAgencyAgent1").style.display= 'none';
			document.getElementById("EditAgencyAgent").style.display= 'inline';
			var agentId = document.getElementById("StyleAgentId").value;
			var agencyId = document.getElementById("StyleAgencyId").value;

		var url = "/EditAgentInQuote.do?answer(agencyId)="+agencyId+"&answer(Object::Entity::EntityId)="+agentId+"&TabPanelName=QUOTE_PANEL&entityId="+agentId;
 		new Ajax.Request(url,{method: 'post',onComplete:function(transport){
			forwardToLoginPageIfInvalidSession(transport.responseText);
		 },onSuccess: function(transport){document.getElementById("getEntityDetails").innerHTML= ""+transport.responseText}});
 	}else{
 			alert("Please select the Agent!")
 	}
}
</script>

<script type="text/javascript">
  function cancelChanges(){
 		 
		document.getElementById("firstName1").style.display= 'inline';
		document.getElementById("firstName2").style.display= 'none';
		document.getElementById("LastName1").style.display= 'inline';
		document.getElementById("LastName2").style.display= 'none';
		document.getElementById("MiddleName1").style.display= 'inline';
		document.getElementById("MiddleName2").style.display= 'none';
		document.getElementById("emailId1").style.display= 'inline';
		document.getElementById("emailId2").style.display= 'none';
		document.getElementById("workPh1").style.display= 'inline';
		document.getElementById("workPh2").style.display= 'none';
		document.getElementById("fax1").style.display= 'inline';
		document.getElementById("fax2").style.display= 'none';
		document.getElementById("ChangeAgencyAgent1").style.display= 'inline';
		document.getElementById("EditAgencyAgent").style.display= 'none';
}
</script>

<script type="text/javascript">
	function validateChangeAgency(form){
		var AgencyName= escape(form.Agenname.value);
	if(AgencyName == ""){
 		alert("Please enter the agency name");
 		form.Agenname.focus();
 		return false;
	}
	if(form.StyleBusinessName.value!=form.Agenname.value)
	{
		alert("Please select a valid Agency");
		return false;
	}
 return true;
}
</script>

  <% 
  		String parentQId = "";
  		if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				parentQId=request.getParameter("answer(parentQuoteId)");
			}
  		    String agencyName = "";
	  		String agentFName = "";
	  		String agentMName = "";
	  		String agentLName="";
	  		String custName = "";
	  		String agentBusinessId="";
	  		String agentNumber="";
	  		String customerId="";
	  		String customerCreatedBy = "";
	  		String agencyCode = "";
	  		String agentPhone = "";
	  		String agentFax = "";
	  		String customerCreatedDate ="";
	  		String strAgencyId = "";
	  		String strAgentId = "";
	  		String generalagencyId ="";
	       
			String StrQuoteNumber = "";
			String StrQuoteSubNumber = "";
			String StrQuoteType = "";
			String StrQuoteStartDate = "";
			String StrQuoteStatus = "";
	%>
 
  <html:form action="/updateQuoteAgencyAgent">
  
  	<html:hidden property="answer(pQuoteId)" name="UpdateAgencyAgentInQuote" value="<%=""+parentQId%>" styleId="parentQuoteId"/>
  	 <html:hidden property="answer(parentQuoteId)" name="UpdateAgencyAgentInQuote" value="<%=""+parentQId%>" />
  	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
  	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
  	<html:hidden property="answer(linkToInsuredFromQuote)" value="false" styleId="linkToInsured" name="UpdateAgencyAgentInQuote"/>
  
  <table width="100%" ALIGN="justify" BORDER="0" CELLSPACING="0" CELLPADDING="0">
        <tr><td>&nbsp;</td></tr>
        
		<tr>
			<td class="NewSectionHead" colspan="4" align="center"> CHANGE AGENT </td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
	    <tr>
		   <td class="NewSectionHead" colspan="4" align="center"> QUOTE INFORMATION </td>
	    </tr>
  </table>	

  <table WIDTH="100%" ALIGN="justify" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#C6DEEA">
       <tr>
       		<td>
       		<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
				<logic:present name="parentQuoteDetail" scope="request">
				<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
				<bean:define id="QuoteNumber" name="parentQuoteDetail" property="quoteNumber" scope="request"/>
				<bean:define id="SubNumber" name="parentQuoteDetail" property="quoteSubNumber" scope="request"></bean:define>
				<bean:define id="QuoteType" name="parentQuoteDetail" property="quoteType" scope="request"></bean:define>
				<bean:define id="QuoteStartDate" name="parentQuoteDetail" property="quoteStartDate" scope="request"></bean:define>
				<bean:define id="QuoteStatus" name="parentQuoteDetail" property="quoteStatus" scope="request"></bean:define>
				<html:hidden property="answer(quoteStatus)" value="<%=""+QuoteStatus%>" styleId="parentQuoteStatus"/>
				
				<%if(QuoteNumber!=null){
					StrQuoteNumber = QuoteNumber.toString();
				}
				if(SubNumber!=null){
					StrQuoteSubNumber = SubNumber.toString();
				}
				if(QuoteType!=null){
					StrQuoteType = QuoteType.toString();
				}
				if(QuoteStartDate!=null){
					StrQuoteStartDate = QuoteStartDate.toString();
				}
				if(QuoteStatus!=null){
					StrQuoteStatus = QuoteStatus.toString();
				}
				%>
				</logic:present>
       		</td>
       </tr>
       
 		<tr>
			<td align="left" width="35%" class="FormLabels">&nbsp;Quote Number
			</td>
				<%if(StrQuoteSubNumber.length()>0){ %>
					<td align="left" class="sectionhead1" width="65%"><%=""+StrQuoteNumber+"-"+StrQuoteSubNumber%>
				<%}else{%>
					<td align="left" class="sectionhead1" width="65%"><%=StrQuoteNumber%>
				<%} %>
			</td>
		<tr>
			<td align="left" width="35%" class="FormLabels">&nbsp;Quote Status</td>
			<td align="left" class="sectionhead1" width="65%"><%=StrQuoteStatus%>
			</td>
		</tr>	
		<tr>
			<td align="left" width="35%" class="FormLabels">&nbsp;Quote Type</td>
			<td align="left" class="sectionhead1" width="65%"><%=StrQuoteType%>
			</td>
		</tr>
		<tr>
			<td align="left" width="35%" class="FormLabels">&nbsp;Quote Effective Date</td>
			<td align="left" class="sectionhead1" width="65%"><%=StrQuoteStartDate%>
			</td>
		</tr>
 </table> 

 <table width="100%" ALIGN="justify" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 
  	 <tr><td></td></tr>
	  <tr>
		<td class="NewSectionHead" colspan="4" align="center"> AGENCY/AGENT INFORMATION </td>
	 </tr>
 </table>
 
 <table  width="100%">	
	<tr>
		<td>
		<dmshtml:Get_Customer_Agency_Agent_QuoteSummary nameInSession="quoteInsuredDetail" parentQuoteId="<%=""+parentQId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'></dmshtml:Get_Customer_Agency_Agent_QuoteSummary>
							<logic:present name="quoteInsuredDetail" scope="request">
								<bean:define id="customerDetailMap" name="quoteInsuredDetail" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
																	<%
								strAgencyId=customerDetailMap.getString("agencyid");
								strAgentId=customerDetailMap.getString("agentid");
								agencyName=customerDetailMap.getString("agencyname");
								agentFName=customerDetailMap.getString("agentFirstName");
								agentMName=customerDetailMap.getString("agentMiddleName");
								agentLName=customerDetailMap.getString("agentLastName");
								custName = customerDetailMap.getString("custname");
								agentBusinessId=customerDetailMap.getString("businessId");
								agentNumber=customerDetailMap.getString("agentNumber");
								customerId=customerDetailMap.getString("customerId");
								customerCreatedBy = customerDetailMap.getString("customerCreatedBy");
								agencyCode = customerDetailMap.getString("agencyCode");
								agentPhone = customerDetailMap.getString("agentPhone");
								agentFax = customerDetailMap.getString("agentFax");
								generalagencyId = customerDetailMap.getString("generalAgencyId");
								customerCreatedDate = customerDetailMap.getString("customerCreatedDate");%>
									<html:hidden property="answer(agencyId1)" value="<%=""+strAgencyId%>" styleId="StyleAgencyId" name="UpdateAgencyAgentInQuote"/>
									<html:hidden property="answer(generalAgencyId)" value="<%=""+generalagencyId%>" name="UpdateAgencyAgentInQuote"/>
									<html:hidden property="answer(createdBy)" value="<%=""+customerCreatedBy%>" name="UpdateAgencyAgentInQuote"/>
							</logic:present>										
			<table width="100%" align="Left" border="0" bgcolor="#C6DEEA" >
				<tr >
					<td class="FormLabels" align="left" width="10%"><bean:message key="Top.EmployerGroupName"/></td>
				 	<td class="sectionhead1" align="left" width="5%"><%=custName%></td> 
				 	<td  class="FormLabels" align="left"  width="10%"> <bean:message key="Top.CreatedBy"/></td>
				 	<td class="sectionhead1" align="left"  width="20%"><%=""+customerCreatedBy%></td>
		  		 </tr>	
		   		<tr bgcolor="#C6DEEA">
		   		    <td  class="FormLabels" align="left"  width="10%">Agency Code</td>
				    <td class="sectionhead1" align="left"  colspan="1" width="10%"><%=""+strAgencyId%></td>
		          	<td class="FormLabels" align="left" colspan="1" width="10%"><bean:message key="Top.AgencyName"/></td> 
					<td class="sectionhead1" align="left"  colspan="2" width="20%"> <%=agencyName%></td>
				</tr>
				<tr bgcolor="#C6DEEA">
				  <td class="FormLabels" align="left"  width="10%" >Agent Code</td>
				  <td class="sectionhead1" align="left" colspan="1"><%=""+agentNumber%></td>
				  <td class="FormLabels" align="left" colspan="1"><bean:message key="Top.AgentName"/></td>
				  <td class="sectionhead1" align="left" colspan="2"><%=agentFName%> <%=" "%><%=agentLName%></td>		
			   </tr>
			   <tr><td height="5"></td></tr>					
           </table>
    </tr>
    <tr>
  		<td>
  	   		<table width="100%" align="center"  >
				<tr>
					<td class="NewSectionHead" width="100%" align="center" colspan="4" >CHANGE AGENT </td>
				</tr>
	 			<tr><td>&nbsp;</td></tr>
 				 <tr height="25pt">
   					<td class="sectionhead1" align="left" width="42%"> 
									&nbsp;&nbsp;Agency/Contact *
					</td>					
   	 		 		<td class="links" width="29%">&nbsp;
   	 						 <jsp:include page="../agency/AutoCompleteChangeAgencyAgent.jsp">
									<jsp:param name="AutoCompleteAgencyAgentLookupSqlName" value="searchByAgencyAgentNameOrNumber" />
									<jsp:param name="ParamFormName" value="UpdateAgencyAgentInQuote" />
									<jsp:param name="ParamAgencyName" value="<%=agencyName%>" />
									<jsp:param name="ParamOwnerId" value="<%=ownerId%>" />
									<jsp:param name="isAgencyChangeAllowed" value="No" />
							</jsp:include> 
							<!-- <html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName%>' size="60" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />-->    		
   	 				</td>
   	 				<td align="left" width="30%">
   	 					<html:hidden property="answer(AgencyName)" value="<%=""+agencyName%>" styleId="StyleAgencyName" name="UpdateAgencyAgentInQuote"/>
   	 					<html:hidden property="answer(agentId1)" value="<%=""+strAgentId%>" styleId="StyleAgentId" name="UpdateAgencyAgentInQuote"/>
     					<html:hidden property="answer(customerId1)" value="<%=""+customerId%>" styleId="CustomerID" name="UpdateAgencyAgentInQuote"/>
   	 					<html:hidden property="answer(IsPopupEnabledAgencyFind)" value="true" styleId="IsPopupEnabledAgencyFind" name="UpdateAgencyAgentInQuote"/>
   	 					<%
   	 						String quoteStatusValue = ""+StrQuoteStatus;
   	 						if(quoteStatusValue.equalsIgnoreCase("In Progress") && !StrQuoteType.equalsIgnoreCase("ENDORSEMENT")){
   	 					%>
   	 						<html:hidden property="answer(isAgencyChangeAllowed)" value="No" styleId="isAgencyChangeAllowed" name="UpdateAgencyAgentInQuote"/>
   	 					<%}else if(!quoteStatusValue.equalsIgnoreCase("In Progress")|| StrQuoteType.equalsIgnoreCase("ENDORSEMENT")){ %>
   	 						<html:hidden property="answer(isAgencyChangeAllowed)" value="No" styleId="isAgencyChangeAllowed" name="UpdateAgencyAgentInQuote"/>
   	 					<%} %>
						<!--  <IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()">-->
						<html:button property="find" alt="Search for Agency." value="Select Agency/Agent" styleClass="sbttn2" onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()"></html:button>
					</td>
 				 </tr>
 				 <tr height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Agency Code</td>
   	 				<td align="left" class="TextMatter">
   						<html:text property="answer(Agency::Like::AgencyCode)" name="UpdateAgencyAgentInQuote" value="<%=""+strAgencyId%>" styleId="ObjectAgencyId" readonly="true"/>   					

   			 		</td>
  				</tr>
  				<tr height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Agent Number</td>
   	 				<td align="left" class="TextMatter">
   						<html:text property="answer(Object::Agent::Number)" name="UpdateAgencyAgentInQuote" value="<%=""+agentNumber%>" styleId="StyleAgentNumber" readonly="true"/>

   			 		</td>
  				</tr>
  				<tr style="display:inline" id="agentName1" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Agent Name </td>
   	 				<td align="left" class="TextMatter">
   						<html:text property="angentFirstName" name="UpdateAgencyAgentInQuote" value="<%=agentFName+" "+agentLName%>" styleId="StyleAgentFullName" readonly="true"/>

   			 		</td>
  				</tr>
  				<tr style="display:none" id="agentName2" height="25pt">
  		
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Agent Name</td>
   	 				<td align="left" class="TextMatter">
   						<html:text property="angentFirstName" name="UpdateAgencyAgentInQuote" value="<%=agentFName+" "+agentLName%>" styleId="StyleAgentFullName2" readonly="true"/>

   						</td>
  				</tr>
  		
  				<tr style="display:inline" id="firstName1" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Contact First Name</td>
   	 				<td align="left" class="TextMatter">
     					 <html:text property="answer(FirstName)" name="UpdateAgencyAgentInQuote"name="UpdateAgencyAgentInQuote" value="<%=""+agentFName%>" styleId="StyleAgentFirstName" readonly="true"/>

   	 				</td>
   	 				<td align="left" width="30%">
   	 				
   			  		<!--  	<IMG SRC="../Images/edit.jpg"  BORDER="0" align="left" ALT="Edit Agent Contacts." onmouseover="this.style.cursor='hand';" onclick="dispTextBoxes();">-->
   			  			
   			 		</td>
  				</tr>
  				<tr style="display:none" id="firstName2" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Contact First Name</td>
   	 				<td align="left" class="TextMatter">
     			 		<html:text property="answer(Object::Entity::FirstName)" name="UpdateAgencyAgentInQuote" value="<%=""+agentFName%>" styleId="StyleAgentFirstName2" readonly="true"/>

   	 				</td>
   	 				<td align="left" width="30%">
   			  			<IMG SRC="../Images/cancel.jpg"  BORDER="0" align="left" ALT="Cancel Changes." onmouseover="this.style.cursor='hand';" onclick="cancelChanges();">
   			 		</td>
  				</tr>
  				<tr style="display:inline" id="LastName1" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Contact Last Name</td>
   	 				<td align="left" class="TextMatter">
      					<html:text property="agentLastName" name="UpdateAgencyAgentInQuote" value="<%=""+agentLName%>" styleId="StyleAgentLastName" readonly="true"/>

   	 				</td>
 		 		</tr>
 		 		<tr style="display:none" id="LastName2" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;Contact Last Name</td>
   	 				<td align="left" class="TextMatter">
      					<html:text property="answer(Object::Entity::LastName)" name="UpdateAgencyAgentInQuote" value="<%=""+agentLName%>" styleId="StyleAgentLastName2" readonly="true"/>

   	 				</td>
 		 		</tr>
  				<tr style="display:inline" id="MiddleName1" height="25pt">
   	      			<td align="left" class="sectionhead1" width="10%">&nbsp;Contact Middle Name</td>
   	 				<td align="left" class="TextMatter">
    			 		<html:text property="agentMiddleName" name="UpdateAgencyAgentInQuote" value="<%=""+agentMName%>" styleId="StyleAgentMiddleName" readonly="true"/>
   	 				</td>
 		 		</tr>
 			   <tr style="display:none" id="MiddleName2" height="25pt">
   	      			<td align="left" class="sectionhead1" width="10%">&nbsp;Contact Middle Name</td>
   	 				<td align="left" class="TextMatter">
    			 		<html:text property="answer(Object::Entity::middleName)" name="UpdateAgencyAgentInQuote" value="<%=""+agentMName%>" styleId="StyleAgentMiddleName2" readonly="true"/>

   	 				</td>
 		 		</tr>
  				<tr style="display:inline" id="emailId1" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;E-Mail Address</td>
   	 				<td align="left" class="TextMatter">
     						<html:text property="answer(mailId)" name="UpdateAgencyAgentInQuote" value="<%=""+agentBusinessId%>" styleId="StyleAgentBusinessID" readonly="true"/>

   			 		</td>
 				 </tr>
 		 		<tr style="display:none" id="emailId2" height="25pt">
   	 				<td align="left" class="sectionhead1" width="10%">&nbsp;E-Mail Address</td>
   	 				<td align="left" class="TextMatter">
     						<html:text property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" name="UpdateAgencyAgentInQuote" value="<%=""+agentBusinessId%>" styleId="StyleAgentBusinessID2" readonly="true"/>

   			 		</td>
 		 		</tr>
 		 		<tr style="display:inline" id="workPh1" height="25pt">
   	      			<td align="left" class="sectionhead1" width="10%">&nbsp;Work Phone</td>
   	 				<td align="left" class="TextMatter">
    					 <html:text property="answer(Object::Contact::Phone)" name="UpdateAgencyAgentInQuote" value="<%=""+agentPhone%>" styleId="StyleAgentPhone" readonly="true"/>

   	 				</td>
 				 </tr>
 		 		<tr style="display:none" id="workPh2" height="25pt">
   	      			<td align="left" class="sectionhead1" width="10%">&nbsp;Work Phone</td>
   	 				<td align="left" class="TextMatter">
    			 		<html:text property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" name="UpdateAgencyAgentInQuote" value="<%=""+agentPhone%>" styleId="StyleAgentPhone2" readonly="true"/>

   	 				</td>
 				 </tr>
 		 		<tr style="display:inline" id="fax1" height="25pt">
   	      			<td align="left" class="sectionhead1" width="10%">&nbsp;Fax</td>
   	 				<td align="left" class="TextMatter">
    			 		<html:text property="answer(Object::entity::Fax)" name="UpdateAgencyAgentInQuote" value="<%=""+agentFax%>" styleId="StyleAgentFax" readonly="true"/>

   	 				</td>
 		 		</tr>
 		 		<tr style="display:none" id="fax2" height="25pt">
   	      			<td align="left" class="sectionhead1" width="10%">&nbsp;Fax</td>
   	 				<td align="left" class="TextMatter">
    			 		<html:text property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)" name="UpdateAgencyAgentInQuote" value="<%=""+agentFax%>" readonly="true"/>

   	 				</td>
 		 		</tr>
   				<tr><td>
   				
    	</td></tr>	
  		</table>
	</tr>
 </table>
 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
    <tr style="display:inline" id="ChangeAgencyAgent1">
		<td colspan="2" align="center" >
			<html:button value="Save Agency/Agent Selection" property="Search" styleClass="sbttn2" onclick="javascript:if(validateChangeAgency(this.form)){document.getElementById('linkToInsured').value = 'false';submitAgency(form);this.hide();};"/>
			</td>
	</tr>
	<tr style="display:none" id="EditAgencyAgent">
		<td colspan="2" align="center" >
			<html:button value="Save Agency/Agent Selection" property="Search" styleClass="sbttn2" onclick="EditAgent(this.form);alert()"/>
	</tr>
	<tr><td></td></tr>
	<tr>
    	<td>
    	<div id="container">
			</div>
    	</td>
    </tr>
    <tr>
    	<td id="AgencyNameHeader" style="display:none">
    	</td>
    	<td id="AgentNameHeader" style="display:none">
    	</td>
    </tr>
 </table> 
  <div id="getEntityDetails"> 
 </div>
</html:form>
	