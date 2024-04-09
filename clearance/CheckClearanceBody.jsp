<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/CheckClearance.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="AgentID" property="answer(Object::UserDetail::AgentId)" name="LoginPage" scope="session" />
<bean:define id="AgencyID" property="answer(Object::UserDetail::AgencyId)" name="LoginPage" scope="session" />

<html:form action="/ClearanceAction.do" onsubmit="return Validate()">
	<%String agencyId="";%>
	<%String agencyIdtoLink="";%>
	<%long lngAgencyTemp=0;%>
	<%long agencyId2=0;%>
	<%String agencyName2="";%>
	<%long generalagencyid2=0;%>
	<%String generalagencyname2="";
	String agencyAgentId="";%>
	<bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
	<bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>
	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="versionNum" value="1.0" />
	<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
	<html:hidden property="formName" value="form::Clearance" />
	<table WIDTH="95%" ALIGN="left" BORDER="0" CELLSPACING="0"	CELLPADDING="0">
	<tr><td>
		<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
			<tr>
				<td class="FormLabels" align="left" colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td class="NewSectionHead" colspan="5" align="center">CHECK	CLEARANCE</td>
			</tr>
			<tr>
				<td class="FormLabels" align="left" colspan="4">&nbsp;</td>
			</tr>			
				<tr>
					<td class="sectionhead" colspan="5" align="center">Agency Information</td>
				</tr>			
				<tr> 
					<td>&nbsp;</td>					
				</tr>				
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">						
			<%
				String agencyName = ""; 
			    agencyId = ""+agencyIdTemp1;
			    agencyAgentId = ""+AgentId1;
			    AgencyID = ""+agencyIdTemp1;
			%><%if(!agencyId.equalsIgnoreCase("")){%>
			<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+agencyId%>"  dbname='<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
		               <logic:present name="agencyDetail2" scope="request">
			               <bean:define id="agdetail2" name="agencyDetail2" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
			                <%agencyName = agdetail2.getString("agencyname");%>
		               </logic:present>	
	          <%} %>
				<tr>
					<td class="FormLabels" align="right" width="44%"> 
						Agency *&nbsp;&nbsp;
					</td>	
					<td class="links" width="20%">&nbsp;<html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName%>' size="60" maxlength="60" styleClass="txtbox" readonly="true" styleId="AgencyName" />
					</td>
					<td>	
						<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButtonLIU()">
					</td>									
				</tr>
			 		<tr><td>&nbsp;</td></tr>
			 		<html:hidden property="answer(Agency::AgencyId)" value='<%=""+agencyId%>'/>								 				
    		</dmshtml:dms_static_with_connector>	
    		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="false">
    			<tr>
					<td class="FormLabels" align="right" width="40%">Agency :&nbsp;&nbsp;</td>
					<%String agencyName = ""; %>
					 <dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+AgencyID%>"  dbname='<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
		               <logic:present name="agencyDetail2" scope="request">
			               <bean:define id="agdetail2" name="agencyDetail2" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
			                <%agencyName = agdetail2.getString("agencyname");%>
		               </logic:present>						
					<td class="FormLabels" align="left" width="20%"><%=""+agencyName%>
					<html:hidden property="answer(Agency::AgencyId)" value='<%=""+AgencyID%>'/>						
					<%if(!agencyAgentId.equalsIgnoreCase("")){%>
						 <html:hidden property="answer(AgentId)" value='<%=""+agencyAgentId%>' />
					 <%}else{ %>
						 <html:hidden property="answer(AgentId)" value='<%=""+AgentID%>' />
					 <%} %>	
					</td>
					<td> </td>					
					<td class="links" width="20%">&nbsp;</td>
				</tr>	
				<tr><td>&nbsp;</td></tr>			
    		</dmshtml:dms_static_with_connector>
    		</table>
			<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
			<tr>				
				<td class="sectionhead" colspan="5" align="center">Insured Information</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="FormLabels" width="40%" align="right">Insured Name Type&nbsp;&nbsp;</td>
				<td class="links" width="60%" style="Class:txtbox">
				<html:select property="answer(Object::Clearance::NameType)"
					styleClass="txtbox" styleId="NameType" name="AddCustomer"
					onchange="showPersonInformation(this.form)">
					<html:option value="Company" styleClass="txtbox">Company</html:option>
					<html:option value="Person" styleClass="txtbox">Person</html:option>					
				</html:select></td>				
			</tr>
			<tr id="company_legal_name1" >
				<td width="40%" class="FormLabels" align="right"	id="legalName1">Legal Name 1 *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text name="AddCustomer" property="answer(Object::Clearance::LegalName1)" size="50" maxlength="50" styleClass="txtbox" styleId="LegalName1" /></td>				
				
			</tr>
			<tr id="company_legal_name2">
				<td width="40%" class="FormLabels" align="right"	id="legalName2">Legal Name 2&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text	name="AddCustomer" property="answer(Object::Clearance::LegalName2)" size="50"	maxlength="50" styleClass="txtbox" styleId="LegalName2" /></td>
				
			</tr>
			<tr id="personfirstname">
				<td width="40%" class="FormLabels" align="right" id="firstName">First Name *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text name="AddCustomer" property="answer(Object::Clearance::FirstName)" size="30" maxlength="30" styleClass="txtbox" styleId="FirstName" /></td>
				
			</tr>
			<tr id="personlastname">
				<td width="40%" class="FormLabels" align="right"	id="lastName">Last Name&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text name="AddCustomer" property="answer(Object::Clearance::LastName)" size="30" maxlength="30" styleClass="txtbox" styleId="LastName" /></td>
				
			</tr>
			<tr id="insureddba">
				<td class="FormLabels" width="40%" align="right">Insured DBA&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text	name="AddCustomer" property="answer(Object::Clearance::DBA)" size="50" maxlength="50"	styleClass="txtbox" styleId="DBA" /></td>
			</tr>
			<tr>
				<td class="FormLabels" width="40%" align="right">Zip Code *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text name="AddCustomer" property="answer(Object::Clearance::Zipcode)" size="5" maxlength="5" styleClass="txtbox" readonly="false" styleId="Zip" />				
				<!--Zipcode lookup start 05-06-2006--> <a
					href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=CheckClearance&clear=yes&PopupWindowName=Zip Code Search"
					title="Search for zip code, state, county"
					onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
					SRC="../Images/zipcodefind.jpg" BORDER="0" align="top"
					ALT="Search for Zip code, City, State and County."></a></td>
				<!-- 05-06-2006 end-->
			</tr>
			
			<tr>
				<td class="FormLabels" align="right">Country&nbsp;&nbsp;</td>			
				<td class="links" style="Class:txtbox"><html:select property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
					<html:option value ="USA" styleClass="txtbox">USA</html:option>									   		   
					</html:select>
				</td>
			</tr>					
			<tr>
				<td width="40%" class="FormLabels" align="right">Proposed Effective Date *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<html:text	property="answer(Month)" size="2" maxlength="2" styleClass="txtbox"
					onkeyup="validateDate(12,this,'Month');"
					styleId="csdmm" />&nbsp; <html:text property="answer(Date)"
					size="2" maxlength="2" styleClass="txtbox"
					onkeyup="validateDate(31,this,'Date');"
					styleId="csddd" />&nbsp; <html:text property="answer(Year)"
					size="4" maxlength="4" styleClass="txtbox"
					onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');"
					styleId="csdyy" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
		</table>
		</td>
		</tr>
		<tr> <td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center">
				<html:submit value="Check Clearance" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
				<html:button value="Reset" styleClass="sbttn" styleId="reset" property="answer(button)" onclick="return resetFields()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
			</td>
		</tr>
		<tr> <td>&nbsp;</td>
		</tr>		
	</table>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden name="AddCustomer" property="answer(Object::Clearance::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden name="AddCustomer" property="answer(Object::Customer::City)"  styleId="City"/>
	<html:hidden name="AddCustomer" property="answer(Object::Customer::County)" styleId="County"/>
	<html:hidden name="AddCustomer" property="answer(Object::Customer::State)" styleId="State"/>
	<html:hidden property="answer(Object::Customer::CustomerName)" styleId="customerName1"/>
	<html:hidden property="answer(Object::Customer::CustomerName2)" styleId="customerName2"/>
	<html:hidden property="answer(Object::Customer::NameType)" styleId="HNameType" />
	<html:hidden property="answer(Object::Customer::DBA)" styleId="HDBA"/>
	<html:hidden property="answer(Object::Customer::Zip)" styleId="HZip"/>	
	<html:hidden property="answer(Object::Submission::Status)" value="In Progress" />
	<html:hidden property="answer(Object::Customer::Status)" value="In Progress" />
	<html:hidden property="answer(Object::Submission::ClearanceStatus)" value="Cleared" />
	<html:hidden property="answer(Object::isClearance)" value="Y" />
	<html:hidden property="answer(Object::Clearance::LobId)" value="1" />
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" styleId="ProposedEffectiveDate"/>
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate1)" styleId="ProposedEffectiveDate1"/>
	<html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=usernameId.toString()%>" />   
   	<html:hidden property="answer(Object::Clearance::LobId)" value="1" />
   	<html:hidden property="answer(Object::PageType)" value="CHECK_CLEARANCE" />
   	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
   	
</html:form>
<SCRIPT type="text/javaScript">	
var formElement=document.forms[0];

function resetFields(){
	formElement.LegalName1.value = "";
	formElement.LegalName2.value = "";
	formElement.FirstName.value = "";
	formElement.LastName.value = "";
	formElement.Zip.value = "";
	formElement.DBA.value = "";
	formElement.AgencyName.value = "";
}


	showPersonInformation(formElement);
  		var currdate = new Date(); 
  		var month = currdate.getMonth()+1;   		
  		if(currdate.getMonth() < 10)
  			document.getElementById('csdmm').value=new String("0"+month);
  		else 
  			document.getElementById('csdmm').value=month;  			
  		if(currdate.getDate() < 10)
  			document.getElementById('csddd').value=new String("0"+currdate.getDate());
  		else 			
  			document.getElementById('csddd').value=currdate.getDate();  				
  		document.getElementById('csdyy').value=currdate.getFullYear();  		  
</SCRIPT>