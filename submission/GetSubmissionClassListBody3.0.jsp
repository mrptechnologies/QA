<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<style> 
   .locformpages{border:1px #f0aa39 solid;width:950px;margin:0 auto;padding:9px;background:url(D:/jboss/jboss-4.0.5.GA/server/default/deploy/ins.war/styles/ui3.0/i/bodybg1.gif)repeat-x;}
  BODY{FONT-WEIGHT: normal; FONT-SIZE: 0px; MARGIN: 0px; WORD-SPACING: normal; TEXT-TRANSFORM: none; COLOR: #000000; FONT-FAMILY: Verdana, Helvetica, sans-serif;LETTER-SPACING: normal; BACKGROUND-COLOR: white}
</style>
 <style type="text/css">
TD.FormLabels{margin:3px 0 3px 10px;padding:0 0 0 50px;font-family: Arial;text-align:Left; font-size: 9pt; color: #595a5f; font-weight:bold;border-right:  0px solid;border-top:  0px solid;border-left: px solid;border-bottom:0px solid;width:60%;}
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
    
 
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"></script>
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

<script type="text/javascript" src="../Scripts/JScripts/ClassRisk.js"></script>
<script language="JavaScript1.2" src="../Scripts/ui3.0/coolmenus4.js"></script>
<script language="JavaScript1.2" src="../common/BuildMenu1.0.jsp"></script>

<bean:define id="customerId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"></bean:define>
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddCustomer" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="AgencyId" property="answer(Object::Agency::AgencyId)" name="AddCustomer" />
<%String strsubmissionId1;%>
<%String strsubmissionverId1;%>

<%if(request.getParameter("answer(Object::Submission::SubmissionVerId)") != null){
	 strsubmissionId1 = ""+request.getParameter("answer(Object::Submission::SubmissionId)");
	 strsubmissionverId1 = ""+request.getParameter("answer(Object::Submission::SubmissionVerId)");
	
}else{%>
<bean:define id="SubmissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddCustomer" />
<bean:define id="SubmissionId" property="answer(Object::Submission::SubmissionId)" name="AddCustomer" />
<%strsubmissionId1 = ""+SubmissionId;%>
<%strsubmissionverId1 = ""+SubmissionVerId;%>
<%}%>
<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
<bean:define id="clearanceStatus" name="AddCustomer" property="answer(Object::Clearance::Status)"/>
<bean:define id="SubmissionStatus" name="AddCustomer" property="answer(Object::Submission::SubmissionStatus)"/>

<html:hidden property="answer(Object::Submission::SubmissionStatus)" styleId="SubmissionStatus1" value= '<%=""+SubmissionStatus %>'/>
<html:hidden property="answer(Object::Submission::SubmissionId)" styleId="SubmissionId1" value= '<%=""+strsubmissionId1 %>'/>
<html:hidden property="answer(Object::Submission::SubmissilonVerId)" styleId="SubmissionVerId1" value= '<%=""+strsubmissionverId1 %>'/>
<html:hidden property="answer(Object::Submission::SubmissilonVerId)" styleId="SubmissionVerIdHidden" value= '<%=""+strsubmissionverId1 %>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value= '<%=""+customerId %>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId1" value= '<%=""+AgencyId %>'/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<html:hidden property="answer(ActiveTab)" styleId="ActiveTab" value= '<%=""%>'/>
<%String submissionStatus = ""; 
String clearanceStatus1 = "";%>

<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+strsubmissionId1%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	

<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
		<%submissionStatus = customerDetailMap.getString("custStatus");
		clearanceStatus1 = customerDetailMap.getString("ClearanceStatus");	
		%>

</logic:present>

<html:hidden property="answer(Object::Submission::SubmissionStatus)" styleId="SubmissionStatus2" value= '<%=""+submissionStatus %>'/>
<body  topmargin=0 bottommargin=0 leftmargin=0 rightmargin=0 bgcolor="E4E4E4">
	<table><tr><td>&nbsp;</td></tr></table>

	<% String classListSize = "0";%>
	<logic:present name="ClassListSize">
		<%classListSize = ""+request.getAttribute("ClassListSize");%>
	</logic:present>
	<html:hidden property="answer(ClassListSizeId)" styleId="ClassListSizeId1" value='<%=classListSize%>' />

	<table>
		<tr>
		<td><a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+strsubmissionverId1%>&answer(Object::Submission::SubmissionId)=<%=""+strsubmissionId1%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=""+customerId%>&customerId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+customerId %>" class="button2" style="width:200px;height:17px;">Go to Submission Summary</a></td>
		<dmshtml:dms_isPresent
				property="<%=new String[]{"In Progress","Referred"}%>"
				value="<%=""+submissionStatus %>" negated="true">
		<td><a href="javascript:void(0);" onclick="appendtable();" class="button2" style="width:100px;height:17px;">Add a Class</a></td>
		<td>
			<div id='loadercontent1' style="display:none">
			<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
			<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
			<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
			Loading....
			</div>
		</td>		
		</dmshtml:dms_isPresent>
		<td>
			<div id="saveSuccess1" style="display:none;color:red;font-weight:bold;">
				Saved Successfully
			</div>
		</td>
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

<dmshtml:dms_isPresent
				property="<%=new String[]{"In Progress","Referred"}%>"
				value="<%=""+submissionStatus %>" negated="true">
<a href="../GetSubmissionDetailForCheckClearance.go?answer(TabPanelName)=Submission_Panel&answer(Object::PageType)=SUBMISSION_REGISTRATION&answer(object:Alert::ClearanceStatus)=<%=""+clearanceStatus1%>&answer(Object::Submission::SubmissionStatus)=<%="Registered"%>&answer(Object::Submission::SubmissionId)=<%=""+strsubmissionId1 %>&answer(Object::Submission::SubmissionStatus)=<%=""+SubmissionStatus%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+customerId %>&answer(requestForm)=Submission&customerId=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%>&answer(Agency::AgencyId)=<%=""+AgencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO" class="button2 right" style="margin-right:20px;width:150px;height:17px;">
				Complete Registration
	</a> 
	</dmshtml:dms_isPresent>
<br class="clear"/>

	
	<br class="clear"/>
	<div id="divide1">
		<a href="javascript:void(0);" id="ClassSchedule" onclick="opentabCount = 0;javascript:showClassList(this.id);" class="loctab_active left">	
		<div id="ClassListSize" style="font-size:11px;">Class List</div></a>
	</div>	
			
	<div class="classformpage" id="Loc3TableData">
		<div class="locformhead" style="float:left"><span class="stepHd">Class Information</span></div>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" class="">
			<tr><td width="100%" align="left">
		         <div id="ClassList1" class="locformbox1"><p style="text-align:center;margin:10px;">No classes entered yet. Add all class information before finalizing submission</p></div>
			</td></tr>
		</table>
	</div> 
	
	<div id="AddClassDiv" class="todotab_yellowbox4" style="width:900px; margin:0 0 ;background-color:#fff;border-top: #F0AA3A 1px solid;display:none;"></div>    
	
    <!--  <div id="AddClassDiv" class="classformpage"  style="clear:both;display:none">
		<div class="formpage4">
			<div class="content">
				<div class="formhead4"><h2 class="left">Add a Class</h2></div>      
				<h3>Class Information</h3>
				<div id="AddClassDiv1"></div>
			</div>
		</div>
	</div>-->
	
	<div id="LocationAndTanksList" style="display:none"></div>
    </div>
    <tr><td>&nbsp;</td></tr>
     <tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<div id='loadercontent2' style="display:none">
				<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
				<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
				<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
				Loading....
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="saveSuccess2" style="display:none;color:red;font-weight:bold;">
					Saved Successfully
				</div>
			</td>
		</tr>
		
      <dmshtml:dms_isPresent
				property="<%=new String[]{"In Progress","Referred"}%>"
				value="<%=""+submissionStatus %>" negated="true">
				<br/><br/>		
	    <tr><td><a href="../GetSubmissionDetailForCheckClearance.go?answer(TabPanelName)=Submission_Panel&answer(Object::PageType)=SUBMISSION_REGISTRATION&answer(object:Alert::ClearanceStatus)=<%=""+clearanceStatus1%>&answer(Object::Submission::SubmissionStatus)=<%="Registered"%>&answer(Object::Submission::SubmissionId)=<%=""+strsubmissionId1 %>&answer(Object::Submission::SubmissionStatus)=<%=""+SubmissionStatus%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Submission::InsuredId)=<%=""+customerId %>&answer(requestForm)=Submission&customerId=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+AgencyId%>&answer(Agency::AgencyId)=<%=""+AgencyId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""+detail.getCustomerState() %>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Submission::LOBId)=<%=""%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO" class="button2 right" style="margin-right:20px;width:150px;height:17px;">
					Complete Registration
		</a> </td></tr>
		<br/><br/>	
    </dmshtml:dms_isPresent>
    <div id="loadercontent1" style="display:none;"></div>
	<div id="loadercontent2" style="display:none;"></div>
	<div id="dialog1" style="display:none"></div>
		
	<div id="RiskPopUp" class="todotab_yellowbox4" style="padding-top:0px;display:none;">
		<div class="hd" id="containerheading"></div>
		<div class="Applicationpage2">
			<div class="bd" id="RiskPopUpBody"></div>
		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
	</div>
	
    </table>
	<div id="classSizeUpdatedLoadClassListDiv"	style="display:none" ></div>
	<script>
		document.getElementById("ClassListSize").innerHTML ="Class List";
	</script>

	<script type="text/javascript">
		var isSpecificValidationNeeded = true;	
		
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
	        
	         var formatDeleteUrl = function(elCell, oRecord, oColumn, sData) {        
		 			var className = "'"+oRecord.getData("ClassName")+"'";
		 			
		 			var onclickscript = "deleteSubmissionClass("+oRecord.getData("ClassId")+")";
	             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";                    
	        };
	        
		   var moreColumnDefsInProgress = [
	            {key:"Number", resizable:"true",width:50},
	            {key:"Class Name", resizable:"true",formatter:formatUrl,width:200},
	            {key:"Class Description",  resizable:"true",width:485},
	             {key:"Delete Class",  resizable:"true",formatter:formatDeleteUrl,width:80}
	        ];
	        
	        var moreColumnDefsOthers = [
	            {key:"Number", resizable:"true",width:50},
	            {key:"Class Name", resizable:"true",formatter:formatUrl,width:200},
	            {key:"Class Description",  resizable:"true",width:500}
	        ];
	        
	        var submissionId = document.getElementById("SubmissionId1").value;
	        var subStatus = document.getElementById("SubmissionStatus2").value;
	        var submissionVerId = document.getElementById("SubmissionVerId1").value;
	        var custId = document.getElementById("customerId1").value;
	        var ownerId = document.getElementById("ownerId1").value;
	        var agencyId = document.getElementById("AgencyId1").value;
			

	        var anotherDataSource = new YAHOO.util.DataSource("../CVGetSubmissionClassList2.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId);
	        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        anotherDataSource.responseSchema = {
	            recordDelim: "\n",
	            fieldDelim: "|",
	            fields: ["Number","Class Name","Class Description","Delete Class","ClassId","ClassName"]
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
	        
	        if(subStatus == "In Progress"){
		        var myDataTableY = new YAHOO.widget.DataTable("ClassList1", moreColumnDefsInProgress,anotherDataSource,myConfigs);  
	        }else{
	        	var myDataTableY = new YAHOO.widget.DataTable("ClassList1", moreColumnDefsOthers,anotherDataSource,myConfigs);  
	        }
		
		   return {
	            oDS2: anotherDataSource,
	          oDT2: myDataTableY
	        };
	    }();	    
    }		
    
	</script>
	
	<script>
			</script>
	
	<script>
		
	function validateTextAreaElement(frm){	
		if(frm.ClassDescription !='undefined' && frm.ClassDescription !=null){
		if((frm.ClassDescription.value=="") && (frm.ClassDescription.type=="textarea") && (frm.ClassDescription !='undefined')) {
			var ele =frm.ClassDescription;
			ele.style.background='#FFCC33';
			ele.focus();		
			alert("Please enter Description ")
			return false;	
		}
	}
	return true;
	}
	
	function doSpecificValidation(frm){
		
		return true;
	}
	
	<% 
	if(request.getParameter("showClassTabDetail")!= null){
		String className = request.getParameter("className");
		String classId = request.getParameter("classId");
		%>

		getClass('<%=classId%>','<%=className%>')
		var	submissionId = document.getElementById('SubmissionId1').value;
		var	submissionVerId = document.getElementById('SubmissionVerId1').value;
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;               
		var url = '../CVGetSubmissionClassList2.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(requestForm)=Submission&customerId='+custId+'&answer(Object::UserDetail::ownerId)='+ownerId+'&answer(OwnerId)='+ownerId+'&SearchObjectId='+custId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId
		autologout();
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){loadClassListTable();updateClassListSize(transport);}});
		
	
	<% }else{%>	
		var	submissionId = document.getElementById('SubmissionId1').value;
		var	submissionVerId = document.getElementById('SubmissionVerId1').value;
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;               
		var url = '../CVGetSubmissionClassList2.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(requestForm)=Submission&customerId='+custId+'&answer(Object::UserDetail::ownerId)='+ownerId+'&answer(OwnerId)='+ownerId+'&SearchObjectId='+custId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId
		autologout();
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showClassList('ClassSchedule');updateClassListSize(transport);}});
		
	<% }%>
	</script>
</body>