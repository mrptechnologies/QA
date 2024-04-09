<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<style> 
   .locformpages{border:1px #f0aa39 solid;width:950px;margin:0 auto;padding:9px;background:url(D:/jboss/jboss-4.0.5.GA/server/default/deploy/ins.war/styles/ui3.0/i/bodybg1.gif)repeat-x;}
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

<script type="text/javascript" src="../Scripts/JScripts/ClassRisk.js"></script>
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

<html:hidden property="answer(Object::Submission::SubmissionStatus)" styleId="SubmissionStatus1" value= '<%=""+SubmissionStatus %>'/>
<html:hidden property="answer(Object::Submission::SubmissionId)" styleId="SubmissionId1" value= '<%=""+SubmissionId %>'/>
<html:hidden property="answer(Object::Submission::SubmissilonVerId)" styleId="SubmissionVerId1" value= '<%=""+SubmissionVerId %>'/>
<html:hidden property="answer(Object::Submission::SubmissilonVerId)" styleId="SubmissionVerIdHidden" value= '<%=""+SubmissionVerId %>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value= '<%=""+customerId %>'/>
<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId1" value= '<%=""+AgencyId %>'/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<html:hidden property="answer(ActiveTab)" styleId="ActiveTab" value= '<%=""%>'/>
<%String submissionStatus = ""; 
String clearanceStatus1 = "";%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" submissionId='<%=""+SubmissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	

<logic:present name="customerDetail1" scope="request">

<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		<%submissionStatus = customerDetailMap.getString("custStatus");
		clearanceStatus1 = customerDetailMap.getString("ClearanceStatus");	
		%>

</logic:present>
<body  topmargin=0 bottommargin=0 leftmargin=0 rightmargin=0 bgcolor="E4E4E4">
		
	<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
	<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
	</logic:present>
	<br>
	<br>
	<div id="AddClassDiv" class="todotab_yellowbox2" style="width:920px; padding:20px 0 0 30px;margin:0 0 ;background-color:#fff;border-top: #F0AA3A 1px solid;">
		<h3>Coverages and Limits Information</h3>
		<div id="AddClassDiv1">
			<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
			objectVerId="0" objectName='<%="COVERAGESANDLIMITS"%>' applicationType="RISK" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubCoveragesandLimitsApplicationBTA.go?" isApplicationEnabled='Y'  showOneTabAtTime="N"/>
			<logic:present name="Application" scope="request">
			<bean:define id="htmlPage" name="Application" type="java.lang.StringBuffer" />
			<%out.println(htmlPage.toString());%>
			</logic:present>
					<logic:notPresent name="Application" scope="request">
					<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
			</logic:notPresent>
		</div>
	</div>
</body>




