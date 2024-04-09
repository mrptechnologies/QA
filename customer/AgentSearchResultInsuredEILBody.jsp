<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<SCRIPT SRC="../Scripts/JScripts/CreateSubmission.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js" type="text/javascript"> </SCRIPT>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/datatable/assets/skins/sam/datatable.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/paginator/assets/skins/sam/paginator.css">     


<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/paginator/paginator-min.js"></script>

<script type="text/javascript" src="../Scripts/prototype.js"></script>




<style type="text/css">
#demo {
    width: 525px;
}
#pag {
    display: inline;
    float: left;
    width: 250px;
    margin-top: 0;
}
#pag a {
    color: #0000de;
}
#pag label {
    display: block;
    margin: 1ex 0;
}
#pag p {
    margin: .25ex 0;
}
.yui-skin-sam #pag .yui-pg-pages {
    display: block;
}
.yui-skin-sam #pag .yui-pg-page {
    display: block;
    background: transparent;
    border: none;
    padding: .5ex 0;
    white-space: normal;
}
.yui-skin-sam #pag .yui-pg-current-page {
    padding: .5ex 0;
    background-color: #ffe;
    font-style: italic;
}
.yui-skin-sam #pag .yui-pg-current {
    margin: 0;
    white-space: normal;
    font-weight: bold;
    font-size: 113%;
}
.yui-skin-sam #demo .yui-dt caption {
    margin: 0.2em 0 0;
    color: #e76300;
    font-weight: bold;
}
</style>


<html:form action="/LinkAgencytoInsuredSubEILAction3.0.do">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="agencyId" property="answer(Agency::AgencyId)" scope="session" name="AddCustomer"/>
<html:hidden  property="answer(Agency::AgencyId)" value="<%=agencyId+"" %>" styleId="agencyId"/>

<div class="formpage01">
			
		<div class="formhead"><h2 class="left">Agency Information</h2></div>
			<h3>Select Agency and Agent</h3>
		<div id="agencyInfo">
		<dmshtml:get_agency_detail nameInSession="agencyDetail" agencyId="<%=agencyId+""%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<logic:present name="agencyDetail" scope="request">
				<bean:define id="agdetail" name="agencyDetail" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
				<div class="LeftMargin"><bean:write name="agdetail" property="businessName"/><br></div>
				<bean:define id="agencyName" name="agdetail" property="businessName"/>
				<html:hidden  property="answer(Object::Agency::BusinessName1)" value="<%=agencyName+"" %>" styleId="agencyName"/>
					
				<bean:define id="addressMap" name="agdetail" property="addresses" type="java.util.HashMap" />
				<bean:define id="addressDetail" name="addressMap" property="BUSINESS" type="com.dms.ejb.address.AddressDetail" />
			
				<div class="LeftMargin"><bean:write name="addressDetail" property="address1" /><br></div>
				<div class="LeftMargin"><bean:write name="addressDetail" property="address2" /><br></div>
				<div class="LeftMargin"><bean:write name="addressDetail" property="city" />
				<bean:write name="addressDetail" property="state" />
				<bean:write name="addressDetail" property="zip" /></div>
		</logic:present>		
		</div>		
		<div class="formcontentLeftAlign" title="<bean:message key='ToolTip.AgencyInfo.Change'/>">
		<input type="button" class="covsmallbutton" value="Change" onclick="editAgency();" style="width:90px;">	
		</div>
		
		
		<div class="formcontentRightAlign"  title="<bean:message key='ToolTip.AgencyInfo.Continue'/>">
		<logic:present name="AgentStatus">
			<input type="button" class="covsmallbutton" value="Continue" onclick="submitAgent();" style="width:90px;">	
		</logic:present>
		<logic:notPresent name="AgentStatus">
			<input type="button" class="covsmallbutton" value="Select" onclick="submitAgent();" style="width:90px;"  title="<bean:message key='ToolTip.AgencyInfo.Select'/>">	
		</logic:notPresent>
		</div>
		

		<div class="formhead"><h2 class="left">Agent Information</h2></div>		
		<div id="AGENT_LIST">
		</div>
</div>
		<bean:define id="forwardKey" property="answer(forwardKey)" name="AddCustomer" />
		<bean:define id="PageType" property="answer(PageType)" name="AddCustomer" />

		<html:hidden property="answer(forwardKey)" value="<%=forwardKey.toString()%>" />
		<html:hidden property="answer(PageType)" value="<%=PageType.toString()%>" />
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
		
		
		<html:hidden property="answer(Object::Agency::StartDate)" value=""   styleId="contractStartDate"/>
		<html:hidden property="answer(Object::Agency::EndDate)" value=""   styleId="contractEndDate"/>
		<html:hidden property="answer(AgentId)" value="<%=""%>"  styleId="agentId"/>

		


<div id="dialog1" style="display:block">


</div>




<script type="text/javascript">

function listagents() {
	   autologout();
 YAHOO.example.Basic = function() {
 
     		var formatRadio = function(elCell, oRecord, oColumn, sData) {	   		
	   		var html = "<input type='radio' name='answer(Select)' id='Select'>"
	   		elCell.innerHTML = html;
	   }
        var myColumnDefs = [
            {key:"AgentFirstName",label:"Agent First Name", sortable:true, resizeable:true},
            {key:"AgentLastName",label:"Agent Last Name", sortable:true, resizeable:true},
            {key:"Select",formatter:formatRadio, sortable:true, resizeable:true}            
        ];


        var myDataSource = new YAHOO.util.DataSource(YAHOO.example.Data.AgentList);
        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
        myDataSource.responseSchema = {
            fields: ["AgentFirstName","AgentLastName","Select","AgentId"]
        };

        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

        var myDataTable = new YAHOO.widget.DataTable("AGENT_LIST",
                myColumnDefs, myDataSource);
                
            myDataTable.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTable.getRecord(target);
	    	agentId = record.getData("AgentId");
			document.getElementById('agentId').value=agentId;

	   });        
                
        return {
            oDS: myDataSource,
            oDT: myDataTable
        };
    }();
}


</script>


<script>
YAHOO.namespace("example.container");

function editAgency() {
document.getElementById("dialog1").innerHTML="";
loadPopupAgencyDetail();
	document.getElementById("dialog1").style.display = "block";
		// Instantiate the Dialog
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("dialog1", 
							{ width : "80em",
							  fixedcenter : true,
							  visible : false, underlay:"shadow",
							  constraintoviewport : true
							});

	YAHOO.example.container.dialog1.render();
	YAHOO.example.container.dialog1.show();


}

function closeContainer(){
YAHOO.example.container.dialog1.cancel();
document.getElementById("dialog1").style.display = "none";  
}
</script>


</html:form>

<logic:present name="results" scope="request">
<bean:define id="htmlPage" name="results"	type="java.lang.StringBuffer" />
<%out.println(htmlPage.toString());%>

<script type="text/javascript">
listagents(); 
</script>
</logic:present>