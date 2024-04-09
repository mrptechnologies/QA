<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<style> 
  BODY{FONT-WEIGHT: normal; FONT-SIZE: 0px; MARGIN: 0px; WORD-SPACING: normal; TEXT-TRANSFORM: none; COLOR: #000000; FONT-FAMILY: Verdana, Helvetica, sans-serif;LETTER-SPACING: normal; BACKGROUND-COLOR: white}
</style>

<script type="text/javascript">
	var url1 = "/CVSaveSubmissionClassRisk1.go?" 
</script>

<script type="text/javascript" src="../Scripts/prototype.js"></script>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
    
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/Class/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/paginator-min.js"></script>  
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>

<script type="text/javascript" src="../cvstarr/scripts/ClassRisk.js"></script>
<script language="JavaScript1.2" src="../Scripts/ui3.0/coolmenus4.js"></script>
<script language="JavaScript1.2" src="../common/BuildMenu1.0.jsp"></script>

<bean:define id="customerId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddCustomer" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="AgencyId" property="answer(Object::Agency::AgencyId)" name="AddCustomer" />
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddCustomer" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="AddCustomer" />
<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="clearanceStatus" name="AddCustomer" property="answer(Object::Clearance::Status)"/>
<bean:define id="SubmissionStatus" name="AddCustomer" property="answer(Object::Submission::SubmissionStatus)"/>


<html:hidden property="answer(Object::Submission::SubmissionId)" styleId="SubmissionId1" value= '<%=""+SubmissionId %>'/>
<html:hidden property="answer(Object::Submission::SubmissilonVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value= '<%=""+customerId %>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId1" value= '<%=""+AgencyId %>'/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<%String submissionStatus = ""; 
String clearanceStatus1 = "";%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+SubmissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	

<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
		<%submissionStatus = customerDetailMap.getString("custStatus");
		clearanceStatus1 = customerDetailMap.getString("ClearanceStatus");	
		%>

</logic:present>
<body  topmargin=0 bottommargin=0 leftmargin=0 rightmargin=0 bgcolor="E4E4E4">
	<table><tr><td>&nbsp;</td></tr></table>

	<% String classListSize = "0";%>
	<logic:present name="ClassListSize">
		<%classListSize = ""+request.getAttribute("ClassListSize");%>
	</logic:present>
	<html:hidden property="answer(ClassListSizeId)" styleId="ClassListSizeId1" value='<%=classListSize%>' />

	<table>
		<tr>
		<td><a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+SubmissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=""+customerId%>&customerId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+customerId %>" class="locbutton3">Go to Submission Summary</a></td>
		<dmshtml:dms_isPresent
				property="<%=new String[]{"In Progress","Referred"}%>"
				value="<%=""+submissionStatus %>" negated="true">
		<td><a href="javascript:void(0);" onclick="appendtable();" class="locbutton2 center">Add a Class</a></td>
		</dmshtml:dms_isPresent>
		</tr>
	</table>
<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
</logic:present>


<a href="../GetSubmissionDetailForCheckClearance.go?answer(TabPanelName)=Submission_Panel&answer(Object::PageType)=SUBMISSION_REGISTRATION&answer(object:Alert::ClearanceStatus)=<%=""+clearanceStatus1%>&answer(Object::Submission::SubmissionStatus)=<%="Registered"%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionStatus)=<%=""+SubmissionStatus%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+customerId %>&answer(requestForm)=Submission&customerId=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%>&answer(Agency::AgencyId)=<%=""+AgencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO" class="locbutton3 right">
				Complete Registration
	</a> 
<br class="clear"/>

	
	<br class="clear"/>

	<div id="divide1">
		<a href="javascript:void(0);" id="ClassSchedule" onclick="javascript:showClassList(this.id);" class="loctab_active left">	
		<div id="ClassListSize">Class (<%=classListSize %>)</div></a>
	</div>	
			
	<div class="locformpage" id="Loc3TableData">
		<div class="locformhead"><span class="step">1</span><span class="stepHd">Class Information</span></div>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" class="">
			<tr><td width="100%" align="left">
		         <div id="ClassList1" class="locformbox1"><p style="text-align:center;margin:10px;">No classes entered yet. Add all class information before finalizing submission</p></div>
			</td></tr>
		</table>
	</div>

    <div id="AddClassDiv" style="display:none">
		<div class="formpage4">
			<div class="content">
				<div class="formhead4"><h2 class="left">Add a Class</h2></div>      
				<h3>Class Information</h3>
				<div id="AddClassDiv1"></div>
			</div>
		</div>
	</div>
	<div id="LocationAndTanksList" style="display:none"></div>
    </div>
    <tr><td>&nbsp;</td></tr>
    <tr><td><a href="../GetSubmissionDetailForCheckClearance.go?answer(TabPanelName)=Submission_Panel&answer(Object::PageType)=SUBMISSION_REGISTRATION&answer(object:Alert::ClearanceStatus)=<%=""+clearanceStatus1%>&answer(Object::Submission::SubmissionStatus)=<%="Registered"%>&answer(Object::Submission::SubmissionId)=<%=""+SubmissionId %>&answer(Object::Submission::SubmissionStatus)=<%=""+SubmissionStatus%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+customerId %>&answer(requestForm)=Submission&customerId=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%>&answer(Agency::AgencyId)=<%=""+AgencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO" class="locbutton3 right">
				Complete Registration
	</a> </td></tr>
    
    <div id="loadercontent1" style="display:none;"></div>
	<div id="loadercontent2" style="display:none;"></div>
	<div id="dialog1" style="display:none"></div>
		
	<div id="RiskPopUp" style="display:none;">
		<div class="hd" id="containerheading"></div>
		<div class="Applicationpage2">
			<div class="bd" id="RiskPopUpBody"></div>
		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
	</div>
	
    </table>
		
	<script>
		document.getElementById("ClassListSize").innerHTML ="Class ("+ document.getElementById("ClassListSizeId1").value+")";
	</script>

	<script type="text/javascript">
		var isSpecificValidationNeeded = false;	
		function loadClassListTable(){
	 	    YAHOO.example.XHR_Text = function() {
	 	    
		    var formatUrl = function(elCell, oRecord, oColumn, sData) {        
		 			var className = "'"+oRecord.getData("ClassName")+"'";
		 			var classString = new String(className);
		 			classString = classString.replace(/ /g,"%20");
		 			classString = classString.replace(/&#39;/g,"___");
		 			var onclickscript = "getClass("+oRecord.getData("ClassId")+","+classString+")";
	             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";                    
	        };
	        
		   var moreColumnDefs = [
	            {key:"Number", resizable:"true",width:100},
	            {key:"Class Name", resizable:"true",formatter:formatUrl,width:200},
	            {key:"Class Description",  resizable:"true",width:500}
	        ];
	        
	        var submissionId = document.getElementById("SubmissionId1").value;
	        var submissionStatus="";
	        var submissionVerId = document.getElementById("SubmissionVerId1").value;
	        var custId = document.getElementById("customerId1").value;
	        var ownerId = document.getElementById("ownerId1").value;
	        var agencyId = document.getElementById("AgencyId1").value;
	        var anotherDataSource = new YAHOO.util.DataSource("../CVGetSubmissionClassList2.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId);
	        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        anotherDataSource.responseSchema = {
	            recordDelim: "\n",
	            fieldDelim: "|",
	            fields: ["Number","Class Name","Class Description","ClassId","ClassName"]
	        };
	        
	        // Configuration for Pagination
	        var myConfigs = {   
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
	        
	        var myDataTableY = new YAHOO.widget.DataTable("ClassList1", moreColumnDefs,anotherDataSource,myConfigs);  
		
		   return {
	            oDS2: anotherDataSource,
	          oDT2: myDataTableY
	        };
	    }();
    }		
	</script>
	<script>
		 YAHOO.example.XHR_Text = function() {
	 	    
		    var formatUrl = function(elCell, oRecord, oColumn, sData) {        
		 			var className = "'"+oRecord.getData("ClassName")+"'";
		 			var classString = new String(className);
		 			classString = classString.replace(/ /g,"%20");
		 			classString = classString.replace(/&#39;/g,"___");
		 			var onclickscript = "getClass("+oRecord.getData("ClassId")+","+classString+")";
	             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";                    
	        };
	        
		   var moreColumnDefs = [
	            {key:"Number", resizable:"true",width:100},
	            {key:"Class Name", resizable:"true",formatter:formatUrl,width:200},
	            {key:"Class Description",  resizable:"true",width:500}
	        ];
	        
	        var submissionId = document.getElementById("SubmissionId1").value;
	        var submissionStatus="";
	        var submissionVerId = document.getElementById("SubmissionVerId1").value;
	        var custId = document.getElementById("customerId1").value;
	        var ownerId = document.getElementById("ownerId1").value;
	        var agencyId = document.getElementById("AgencyId1").value;
	        var anotherDataSource = new YAHOO.util.DataSource("../CVGetSubmissionClassList2.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId);
	        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        anotherDataSource.responseSchema = {
	            recordDelim: "\n",
	            fieldDelim: "|",
	            fields: ["Number","Class Name","Class Description","ClassId","ClassName"]
	        };
	        
	        // Configuration for Pagination
	        var myConfigs = {   
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
	        
	        var myDataTableY = new YAHOO.widget.DataTable("ClassList1", moreColumnDefs,anotherDataSource,myConfigs);  
		
		   return {
	            oDS2: anotherDataSource,
	          oDT2: myDataTableY
	        };
	    }();
	</script>
	<% 
	if(request.getParameter("showClassTabDetail")!= null){
		String className = request.getParameter("className");
		String classId = request.getParameter("classId");
		%>
	
	<script type="text/javascript">
		getClass('<%=classId%>','<%=className%>')
	</script>
	<% } %>
</body>




