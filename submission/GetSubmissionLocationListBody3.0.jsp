<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
 
<style type="text/css">

BODY
{
    FONT-WEIGHT: normal;
    FONT-SIZE: 0px;
    MARGIN: 0px;
    WORD-SPACING: normal;
    TEXT-TRANSFORM: none;
    COLOR: #000000;
    FONT-FAMILY: Verdana, Helvetica, sans-serif;
    LETTER-SPACING: normal;
    BACKGROUND-COLOR: white
}

</style>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<script type="text/javascript">
var url1 = "/saveSubmissionRisk1.do?" 
</script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>


<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />    
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/LocationTank/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/paginator-min.js"></script>  

<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/LocationRisk.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/ImportLocationRisk.js" ></script>
<script>
</script>
<style>
#yui-dt0-bodytable, #yui-dt1-bodytable, #yui-dt2-bodytable {
Width:100%;
} 
</style>

<body  topmargin=0 bottommargin=0 leftmargin=0 rightmargin=0 bgcolor="E4E4E4">
<bean:define id="customerId" name="AddRisk" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddRisk" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="AgencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="AddRisk" />
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddRisk" />
<bean:define id="submissionType1" name="AddRisk" property="answer(Object::Submission::Type)"/>
<bean:define id="submissionRenewalPolNo1" name="AddRisk" property="answer(Object::Submission::RenewalPolicy)"/>
<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="CustomerState" name="AddRisk" property="answer(state)" />
<bean:define id="clearanceStatus" name="AddRisk" property="answer(Object::Clearance::Status)"/>
<bean:define id="lobId" name="AddRisk" property="answer(Object::Submission::LOBId)"/>
<bean:define id="cId" name="AddRisk" property="answer(Object::Submission::InsuredId)"/>
<bean:define id="SubmissionStatus" name="AddRisk" property="answer(Object::Submission::SubmissionStatus)"/>
<bean:define id="AddLocationLink1" name="AddRisk" property="answer(AddLocationLink)"/>
<bean:define id="LocationId1" name="AddRisk" property="answer(Object::Location::LocationId)"/>
<bean:define id="LocationName1" name="AddRisk" property="answer(Object::Location::LocationName)"/>
<bean:define id="tankIdToPopup" name="AddRisk" property="answer(selectedRiskId)"/>
<bean:define id="tankTypeToPopup" name="AddRisk" property="answer(selectedrisk)"/>


<html:hidden property="answer(Object::Submission::Type)" styleId="submissionType" value= '<%=""+submissionType1 %>'/>
<html:hidden property="answer(Object::Submission::RenewalPolicy)" styleId="submissionRenewalPolNo" value= '<%=""+submissionRenewalPolNo1 %>'/>
<html:hidden property="answer(Object::Submission::SubmissionId)" styleId="SubmissionId1" value= '<%=""+SubmissionId %>'/>
<html:hidden property="answer(Object::Submission::SubmissilonVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value= '<%=""+customerId %>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId1" value= '<%=""+AgencyId %>'/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>

<%String strAddLocationLink = ""+AddLocationLink1; %>
<%String strLocationId = ""+LocationId1; %>
<%String strLocationName = ""+LocationName1;%>

<%
String tankIdpopup = "";
String tankTypePopup= "";
if(request.getParameter("answer(selectedRiskId)") != null){
 tankIdpopup = ""+request.getParameter("answer(selectedRiskId)");
 tankTypePopup = ""+request.getParameter("answer(selectedrisk)");
}
%>

<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
</logic:present>
<% if(detail.getCustomerState() != null) { %>
	<html:hidden property="answer(custState)" value='<%="" + detail.getCustomerState()%>' styleId="custState" />
<% } else { %>
	<html:hidden property="answer(custState)" value='' styleId="custState" />
<% } %>
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />
<%String submissionStatus = ""; 
String clearanceStatus1 = "";%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=""+SubmissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	

<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
		<%submissionStatus = customerDetailMap.getString("custStatus");
		clearanceStatus1 = customerDetailMap.getString("ClearanceStatus");	
		%>

</logic:present>
<html:hidden property="answer(Object::Submission::SubmissionStatus)" styleId="SubmissionStatus1" value= '<%=""+submissionStatus %>'/>

		<% if(request.getAttribute("ApplicationMap")!=null){
				
				com.dms.ejb.data.QuestionHashMap applicationMap = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("ApplicationMap");
				String submissionVerId = applicationMap.getString("Object::Submission::SubmissionVerId");
			}else{
		%>
		<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddRisk" />
		
		<%} %>
		<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
		<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>
		
		<html:hidden property="answer(Object::Submission::SubmissionVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<table>
	<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
		<tr>
				<td width="1200px" bgcolor="#C6DEEA">
					<table width="95%">
						<tr>
							<td colspan="2">
								<table width="95%" align="center" border="1">
									<tr>
										<td>
											<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
										</td>
									</tr>
								</table>
							</td>
						</tr>				
						
					</table>
				</td>
			</tr>
	</logic:notEqual>
  <tr>
	<td>&nbsp;</td>
  </tr>
 
</table>

<% String locationListSize = "0";%>
<logic:present name="LocationListSize">
<% 	locationListSize = ""+request.getAttribute("LocationListSize");%>

</logic:present>
<table >
<tr>
<td>
<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" class="locbutton3" title="<bean:message key='ToolTip.LocationsandTanks.SubmissionSummary'/>">
	Go to Submission Summary
</a>
</td>
<td>
<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=""+submissionStatus %>" negated="true" >
	<span title="<bean:message key='ToolTip.LocationsandTanks.AddLocation'/>"><a href="javascript:void(0);" onclick="appendtable();" class="locbutton2 center">Add a Location</a></span>
</dmshtml:dms_isPresent>
</td>

<td>
<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=""+submissionStatus %>" negated="true" >
	<span title="<bean:message key='ToolTip.ImportExport.ImportLocationandTank'/>"><a href="javascript:void(0);" onclick="importExportLocation('<%=""+SubmissionId %>','<%=""+ownerId %>','<%=""+customerId %>','<%=""+SubmissionVerId%>');" class="locbutton3 right center">Import Location/Tank Information</a></span>
</dmshtml:dms_isPresent>
</td>

<%boolean GeniusAddressValidation=false; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="false">

<% GeniusAddressValidation=true; %>
</dmshtml:dms_static_with_connector>
<td width="100%" align="right">
<dmshtml:dms_isPresent property='<%=new String[]{"In Progress"}%>' value="<%=submissionStatus.toString()%>" negated="true">
	<a href="../GetSubmissionDetailForCheckClearance.go?answer(TabPanelName)=Submission_Panel&answer(Object::PageType)=SUBMISSION_REGISTRATION&answer(object:Alert::ClearanceStatus)=<%=""+clearanceStatus1%>&answer(Object::Submission::SubmissionStatus)=<%="Registered"%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionStatus)=<%=""+SubmissionStatus%>&answer(Object::Submission::Type)=<%=""+submissionType1%>&answer(Object::Submission::RenewalPolicy)=<%=""+submissionRenewalPolNo1%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+customerId %>&answer(requestForm)=Submission&customerId=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%>&answer(Agency::AgencyId)=<%=""+AgencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(pagename)=Add/Edit Location/Tank Page&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO&answer(Object::Validation::GeniusAddress)=<%=""+GeniusAddressValidation%>" title="<bean:message key='ToolTip.LocationsandTanks.SubmitApplication'/>" class="locbutton3 right">
				Submit Completed Application 
	</a> 
</dmshtml:dms_isPresent>
</td>
</tr>
</table>
<div id="divide1">
<a href="javascript:void(0);" id="LocationSchedule" onclick="javascript:showLocationList(this.id);" title="<bean:message key='ToolTip.LocationsandTanks.LocationSchedule'/>" class="loctab_active left">
	
<div id="LocationListSize">Location Schedule(<%=locationListSize%>)</div></a>
</div>	
			
<div id='loadercontent1' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Saving....
	</div>

<div class="locformpage" id="Loc3TableData">
	<br class="clear"/>
		<div class="locformhead"><span class="step">1</span><span class="stepHd">Location Name and Address</span>
		     
		</div>

			<table width="100%">
		          <tr>
		         	 <td width="100%" align="center">
		          		<div id="LocationList1" class="locformbox1"></div>
		          	</td>
		          </tr>
		   </table>
</div>



          	<div id="AddLocationDiv" style="display:none">
			<div class="formpage2">
          	<div class="content">
				<div class="formhead2"><h2 class="left">Add Location</h2></div>      
  					<h3>Location Information</h3>

				<div id="AddLocationDiv1"  ></div>
			</div>
			</div>
			</div>
			
			<div id="ImportLocationDiv" style="display:none">
			<div class="formpage2">
          	<div class="content">
				<div class="formhead2"><h2 class="left">Import Location</h2></div>      
  					<h3>Import Location Information</h3>

				<div id="ImportLocationDiv1" ></div>
			</div>
			</div>
			</div>


				<div id="LocationAndTanksList" style="display:none"></div>
		
<div id='loadercontent2' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Saving....
	</div>

<table width="900px">
	
	<tr>
	<td width="40%" rowspan="1">
		<div id="RiskPopUp" style="display:none;">
			<div class="hd" id="containerheading">UST Specific Questions</div>
			<div class="formhead" align="right"><h2 class="right"></h2>
		
			</div>      
				<div class="Applicationpage2" style="overflow:scroll; height:40em;">
			<div class="bd" id="RiskPopUpBody">
			</div>
			</div>
			<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
		</div>
	
		</td>
	</tr>
</table>



<table width="100%">
  <tr>
   
	<td width="100%">
<div id="dialog1" style="display:none;">
<div class="hd">Please enter Tank Information

</div>
<div class="bd">

<table>

	<tr>

		<td class="FormLabels" align="left">Tank Type</td>
		
		<td>
			<select class="txtbox" name="answer(Object::Risk::RiskType__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_TYPE)" id="RiskSelection" >	
				<option value =''>Select</option>	
				<%
				if(riskTypeList!=null){
					for(int i=0;i<riskTypeList.size();i++) {
						com.dms.ejb.data.QuestionHashMap riskTypeMap=(com.dms.ejb.data.QuestionHashMap)riskTypeList.get(i);	
				%>
								
					<%String riskType=riskTypeMap.getString("Object::Risk::RiskTypeName");%>
					<%String riskTypeDesc=riskTypeMap.getString("Object::Risk::RiskTypeDesc");%>
					<option value ='<%=riskType%>'><%=riskTypeDesc %></option>											
					<%}
				}%>	 																												
			</select>

		</td>
		<td>
		
  </td>

		
	</tr>
	
	<tr>
		<td class="FormLabels" align="left"> 
		  Tank Name
		</td>
		<td>
		  <input type="textbox" name="answer(Object::Risk::RiskName__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NAME)" size="60" id="tankname" />
		</td>
		
		
	</tr>
	
	<td class="FormLabels" align="left"> 
		  Tank Description
		</td>
		<td>
		 <textarea rows="4" cols="50" 
		 id="LocationDescription" height="4" width="30" maxlength="100" 
		 name="answer(Object::Location::LocationDescription__DMS_SUBMISSION_LOCATION~LOCATION_DESCRIPTION)" >
		 </textarea>
		</td>
	<tr>
	<td class="Links" title="<bean:message key='ToolTip.LocationsandTanks.AddTank'/>" >
	&nbsp;&nbsp;<html:button  property="answer()" styleId="SubmitRisk" onclick="AddRisk1();" value="Add Tank"/>
	</td>
	<td class="Links" title="<bean:message key='ToolTip.LocationsandTanks.Cancel'/>">
	&nbsp;<html:button  property="answer()" styleId="CancelRisk" value="Cancel"/>
	</td>

	</tr>
</table>
</div>
<a class="container-close" href="javascript:void(0);" id="closeIcon1"></a>

</div>

</td>
</tr>
<tr>

<td>
&nbsp;
</td>
</tr>
<tr>

<td>
&nbsp;
</td>
</tr>

<tr>
<td>

<dmshtml:dms_isPresent property='<%=new String[]{"In Progress"}%>' value="<%=submissionStatus.toString()%>" negated="true">
	<a href="../GetSubmissionDetailForCheckClearance.go?answer(TabPanelName)=Submission_Panel&answer(Object::PageType)=SUBMISSION_REGISTRATION&answer(object:Alert::ClearanceStatus)=<%=""+clearanceStatus1%>&answer(Object::Submission::SubmissionStatus)=<%="Registered"%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionStatus)=<%=""+SubmissionStatus%>&answer(Object::Submission::Type)=<%=""+submissionType1%>&answer(Object::Submission::RenewalPolicy)=<%=""+submissionRenewalPolNo1%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+customerId %>&answer(requestForm)=Submission&customerId=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%>&answer(Agency::AgencyId)=<%=""+AgencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(pagename)=Add/Edit Location/Tank Page&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO&answer(Object::Validation::GeniusAddress)=<%=""+GeniusAddressValidation%>" title="<bean:message key='ToolTip.LocationsandTanks.SubmitApplication'/>" class="locbutton3 right">
				Submit Completed Application 
			</a> 
</dmshtml:dms_isPresent>
</td>

</tr>
</table>
<script>
YAHOO.util.Event.addListener(window, "load", function() {
    YAHOO.example.XHR_Text = function() {
    
	 var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			//alert(locString);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			var onclickscript = "getTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };
        
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:135},
            {key:"Address Line 1",  resizable:"true",width:100},
            {key:"Address Line 2", resizable:"true",width:100},
            {key:"City", resizable:"true",width:120},
            {key:"State",  resizable:"true",width:90},
            {key:"Zip",  resizable:"true",width:80},
            {key:"UST",  resizable:"true",width:40},
            {key:"AST",  resizable:"true",width:40}
        ];
        var submissionId = document.getElementById("SubmissionId1").value;
        var submissionStatus="";
        var submissionVerId = document.getElementById("SubmissionVerId1").value;
       // alert(submissionVerId);
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;
        var parameters ="?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId;
  		//alert("entered")
  		autologout();
        var anotherDataSource = new YAHOO.util.DataSource("../GetSubmissionLocationList2.do");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

        
        // Configuration for Pagination
        var myConfigs = {   
                initialRequest : parameters,
                generateRequest: parameters,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
});


</script>
<logic:present name="LocationListSize">
<% 	locationListSize = ""+request.getAttribute("LocationListSize");%>

</logic:present>
<html:hidden property="answer(LocationListSizeId)" styleId="LocationListSizeId1" value='<%=locationListSize%>' />
<!-- For AddLocation link from Submission Summary page -->
<%if(strAddLocationLink.equals("YES")){ %>

<script type="text/javascript">

	appendtable();

</script>

<%} %>
<%if((strLocationId.length()!=0)&&(strLocationName.length()!=0)){ %>
<% strLocationName=strLocationName.replaceAll("'","___");%>
<script type="text/javascript">
 
	getTanksWithLocation(<%=strLocationId%>,'<%=strLocationName.replaceAll("<","&lt;").replaceAll(">","&gt;")%>');
	<%if(!tankIdpopup.equals("") && !tankTypePopup.equals("")){%>
	
	setTimeout("geteditRiskPopUp('<%=tankIdpopup%>','<%=tankTypePopup%>')",8);
	<%}%>
	
</script>

<%} %>
<script>
initTankPopUp();
	document.getElementById("LocationListSize").innerHTML ="Location Schedule("+ document.getElementById("LocationListSizeId1").value+")";
	isSpecificValidationNeeded = true;
	
	function doSpecificValidation(frm){
	if(frm.name == "Location"){
		if(frm.Use_of_Facility.value==""){
  
  			alert("Please select Use Of Facility");
			return false;
  
  		}
	
		if(!frm.Owner_Type[0].checked && !frm.Owner_Type[1].checked){
			alert('Please select Owned or Leased');
			return false;
		}
		
	}			
			if(frm.name!="Location"){		
			if(doValidateTank(frm)){
				return true;
			}else{
				return false;
			}
		}
		
		
		return true;
	}

function conformRemoveAction(frm,thisBttn,actionName){
   var removeAction = window.confirm("Are you sure you want to continue?");
  if(removeAction){
  	if(removeObject!=null && removeObject!=undefined){
  		removeObject=true;
  		//alert(removeObject);
  		Ajaxsubmit(frm,'Remove',actionName);
  		
  		//YAHOO.example.container.dialog2.cancel();
  	}
   
  }
   
}

		
		
	 function loadLocationListTable(){
 	    YAHOO.example.XHR_Text = function() {
    
	 var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			var onclickscript = "getTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };
        
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:135},
            {key:"Address Line 1",  resizable:"true",width:100},
            {key:"Address Line 2", resizable:"true",width:100},
            {key:"City", resizable:"true",width:120},
            {key:"State",  resizable:"true",width:90},
            {key:"Zip",  resizable:"true",width:80},
            {key:"UST",  resizable:"true",width:40},
            {key:"AST",  resizable:"true",width:40}
        ];
        var submissionId = document.getElementById("SubmissionId1").value;
        var submissionStatus="";
        var submissionVerId = document.getElementById("SubmissionVerId1").value;
       // alert(submissionVerId);
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;
  		//alert("entered")
  		var parameters ="answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId;
        var anotherDataSource = new YAHOO.util.DataSource("../GetSubmissionLocationList2.do");
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

        
        // Configuration for Pagination
        var myConfigs = {   
                initialRequest: parameters,
                generateRequest: parameters,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
        
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
 
 
 }	


	 function loadTankListTable(){
 	    YAHOO.example.XHR_Text = function() {
    
	 var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var riskType = "'"+oRecord.getData("RiskType")+"'";
	 			var riskType = new String(riskType);
	 			
	 			var onclickscript = "geteditRiskPopUp("+oRecord.getData("TankId")+","+riskType+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };
        
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Tank Name", resizable:"true", formatter:formatUrl,width:140,sortable:true},
            {key:"Type",  resizable:"true",width:50,sortable:true},
            {key:"Year Installed", resizable:"true",width:80,sortable:true},
            {key:"Capacity", resizable:"true",width:90,sortable:true},
            {key:"Construction",  resizable:"true",width:115},
            {key:"SW/DW",  resizable:"true",width:60},
            {key:"Contents",  resizable:"true",width:100},
            {key:"Retro",  resizable:"true",width:70}
        ];
       	var submissionId = document.getElementById("SubmissionId1").value;
       	var submissionStatus = document.getElementById("SubmissionStatus1").value;
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;
       	var locId=document.getElementById("locIdUpdated").value;
        var anotherDataSource = new YAHOO.util.DataSource("../getTanklistForTable.do");
        var parameters = "answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(Object::Location::LocationId)="+locId;
        alert("loadTankListTable2")
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.connMethodPost = true;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Tank Name","Type","Year Installed","Capacity","Construction","SW/DW","Contents","Retro","TankId","RiskType"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

          
        // Configuration for Pagination
        var myConfigs = {   
                initialRequest:parameters,
                generateRequest:parameters,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
       
        var myDataTableY = new YAHOO.widget.DataTable("LocationTankList1", moreColumnDefs,anotherDataSource,myConfigs);  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
 
 
 
 
 }	
</script>

<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>
<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JSc ripts/RiskApplication.js">
</script> -->
<!-- Loc3Select Data Close  -->
</body>
