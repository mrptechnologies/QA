<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<jsp:include page="../policy/AddPolicyNonBTABody.jsp">
	<jsp:param name="answer(Object::UserDetail::ownerId)" value="<%=ownerId+""%>" />
</jsp:include>

<SCRIPT SRC="../Scripts/JScripts/CreateSubmission.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js" type="text/javascript"> </SCRIPT>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/datatable/assets/skins/sam/datatable.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/paginator/assets/skins/sam/paginator.css">     

<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datatable/datatable-min.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/paginator/paginator-min.js"></script>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>

<script type="text/javascript" src="../Scripts/prototype.js"></script>
<% Date  myDate = Calendar.getInstance().getTime();
		   DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		   String today = formatter.format(myDate);%>

<%long selectedAgentId =0;%>



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


<html:form action="/FindAgencyNonBTA.do" name="agentResultFrm" type="com.dms.web.data.DataForm">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="agencyId1" property="answer(Agency::AgencyId)" name="AddCustomer"/>
<bean:define id="customerID" property="answer(Object::Customer::CustomerId)" scope="session" name="AddCustomer"/>
<bean:define id="state" property="answer(Object::Customer::State)" scope="session" name="AddCustomer"/>
<html:hidden  property="answer(Agency::AgencyId)" value="<%=agencyId1+"" %>" styleId="agencyId2"/>
<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=customerID+""%>" styleId="customerID"/>
<html:hidden  property="answer(Object::Customer::State)" value="<%=state+""%>" styleId="state"/>

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden  property="answer(Object::UserDetail::userName)" value="<%=userId+""%>" styleId="userId"/>
<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session" />
<html:hidden  property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=ObjectId+""%>" styleId="ObjectId"/>
<html:hidden  property="todayDate" value="<%=today+""%>" styleId="today"/>
<html:hidden  property="ownerId" value="<%=ownerId+""%>" styleId="ownerId1"/>

<div class="formpage01">
			
		<div class="formhead"><h2 class="left">Agency Information</h2></div>
		<div id="agencyInfo">
		<dmshtml:get_agency_detail nameInSession="agencyDetail" agencyId="<%=agencyId1+""%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<logic:present name="agencyDetail" scope="request">
			<bean:define id="agdetail" name="agencyDetail" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
			<bean:define id="agencyName" name="agdetail" property="businessName"/>
			<html:hidden  property="answer(Object::Agency::BusinessName1)" value="<%=agencyName+"" %>" styleId="agencyName"/>			
			
			

				<div class="LeftMargin"><bean:write name="agdetail" property="businessName"/><br></div>					
				<bean:define id="addressMap" name="agdetail" property="addresses" type="java.util.HashMap" />
				<bean:define id="addressDetail" name="addressMap" property="BUSINESS" type="com.dms.ejb.address.AddressDetail" />			
				<div class="LeftMargin"><bean:write name="addressDetail" property="address1" /><br></div>
				<div class="LeftMargin"><bean:write name="addressDetail" property="address2" /><br></div>
				<div class="LeftMargin"><bean:write name="addressDetail" property="city" />
				<bean:write name="addressDetail" property="state" />
				<bean:write name="addressDetail" property="zip" /></div>
		</logic:present>		
		</div>						
		<br>
		<div class="formhead"><h2 class="left">Agent Information</h2></div>
		<br>
		<div id="AGENT_LIST">
		</div>
		
		<br>
		<div class="formhead"><h2 class="left">Insured Information</h2></div>
		<br>
		<div id="INSURED_LIST">
		</div>
		<br>
	<table align="center" width="98%" border="0">
		<tr>
			<td align="right"><a href="../AddInsuredNonBTA.do?clear=yes&answer(Agency::AgencyId)=<%=agencyId1.toString()%>" id="Add_Insured">
				<html:button styleClass="covsmallbutton" style="font-size:13px;width:100px;" property="answer(AddInsured)" value="Add Insured" 
				onclick="window.location=document.getElementById('Add_Insured') + '&answer(AgentId)=' + document.getElementById('agentId').value + '&answer(AgentFirstName)=' + document.getElementById('agentFirstName').value + '&answer(AgentLastName)=' + document.getElementById('agentLastName').value" />
				</a>
			</td>
		</tr>
	</table>

	</div>
		<bean:define id="forwardKey" property="answer(forwardKey)" name="AddCustomer" />
		<bean:define id="PageType" property="answer(PageType)" name="AddCustomer" />

		<html:hidden property="answer(forwardKey)" value="<%=forwardKey.toString()%>" />
		<html:hidden property="answer(PageType)" value="<%=PageType.toString()%>" />
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
		
		
		<html:hidden property="answer(Object::Agency::StartDate)" value=""   styleId="contractStartDate"/>
		<html:hidden property="answer(Object::Agency::EndDate)" value=""   styleId="contractEndDate"/>
		
		<html:hidden property="answer(Agency::NotEquals::ParentAgencyId)" value="-1" styleId="ParentAgencyId"/>
		<html:hidden property="LimitSearch" value="yes" styleId="LimitSearch"/>
		<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
		<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
		<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>" styleId="OwnerId"/>
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' styleId="dbname"/>	

		<html:hidden property="formName" value="form::SEARCHAGENT" />
		<html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="AGENCY" />   
		<html:hidden property="entityType" value="AGENT" />
		<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=""+ownerId %>' />	
		<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
		<html:hidden property="answer(Object::Entity::PageNum)" value="0"/> 
		
		<html:hidden property="answer(AgentId)" value="<%="-1"%>"  styleId="agentId"/>
		<html:hidden property="answer(AgentFirstName)" value="<%=""%>"  styleId="agentFirstName"/>		
		<html:hidden property="answer(AgentLastName)" value="<%=""%>"  styleId="agentLastName"/>	

<script type="text/javascript">
function listagents() {
	   autologout();
 YAHOO.example.Basic = function() {
 
     	 var formatRadio = function(elCell, oRecord, oColumn, sData) {	   		
	   		agentId = oRecord.getData("AgentId");		
	   		var onclickscript = "listInsureds("+agentId+")";	  
	   		var html = "<input type='radio' id='agentId' onclick="+onclickscript+" name='Select' >"
	   		elCell.innerHTML = html;
	   }  	
        var myColumnDefs = [
            {key:"AgentFirstName",label:"Agent First Name", sortable:true, resizeable:true, width:300},
            {key:"AgentLastName",label:"Agent Last Name", sortable:true, resizeable:true, width:300},
            {key:"Select",formatter:formatRadio, sortable:true, resizeable:true, width:298}
        ];

        var myDataSource = new YAHOO.util.DataSource(YAHOO.example.Data.AgentList);
        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
        myDataSource.responseSchema = {
            fields: ["AgentFirstName","AgentLastName","Select","AgentId"]
        };

        var myDataTable = new YAHOO.widget.DataTable("AGENT_LIST",
                myColumnDefs, myDataSource);
                
            myDataTable.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTable.getRecord(target);
	    	agentId = record.getData("AgentId");
	    	agentFirstName = record.getData("AgentFirstName");
	    	agentLastName = record.getData("AgentLastName");
			document.getElementById('agentId').value=agentId;
			document.getElementById('agentFirstName').value=agentFirstName;
			document.getElementById('agentLastName').value=agentLastName;
			selectedAgentId = document.getElementById('agentId').value;	

	   });        
             
        return {
            oDS: myDataSource,
            oDT: myDataTable
        };
    }();
   }

//To load the Available agencies in the yahoo data table 

function listInsureds(agentId) { 
	autologout();
    YAHOO.example.XHR_Text = function() {
    
    var cusId = document.getElementById('customerID').value;    
    var agenId = document.getElementById('agencyId2').value;
    var ownId = document.getElementById('ownerId1').value;
    var useId = document.getElementById('userId').value;
    var ObjectId = document.getElementById('ObjectId').value;
   
	var formatButton = function(elCell, oRecord, oColumn, sData) {
		var customerId = oRecord.getData("CustomerID");
		var cusState = oRecord.getData("State");
		var cusCountry = oRecord.getData("Country");
		var onclickscript = "addPolicy("+agenId+","+ownId+",'"+useId+"',"+customerId+",'"+cusCountry+"',"+ObjectId+",'"+cusState+"')";	    	  		
		var html = "<input type='button' value='Add Policy' class='covsmallbutton' id='AddPolicy' style='width:85px;' onclick="+onclickscript+" />"
		elCell.innerHTML = html;
	}	

	var moreColumnDefs = [
		{key:"OneSourceKeyID", resizable:"false",width:95,label:"One Source Key ID"},
		{key:"CustomerName", resizable:"false",width:180,label:"Customer Name"},
		{key:"Address1", resizable:"false",width:150},
		{key:"Address2", resizable:"false",width:100},
		{key:"City", resizable:"false",width:55},
		{key:"State", resizable:"false",width:55},
		{key:"Zip", resizable:"false",width:55},
		{key:"AddPolicy", formatter:formatButton, resizable:"false",label:"Add Policy"}
		];                        
            		
	var agencyID = document.getElementById('agencyId2').value;	
	var anotherDataSource = new YAHOO.util.DataSource("../ListOfInsureds.do?&answer(Agency::AgencyId)="+agencyID+'&answer(AgentId)='+agentId);
	anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	anotherDataSource.responseSchema = {
		recordDelim: "\n",
		fieldDelim: "|",
		fields: ["OneSourceKeyID","CustomerName","Address1","Address2","City","State","Zip","AddPolicy","CustomerID","Country"]
	};        
 	
	// Configuration for Pagination
	var myConfigs = {   
		paginator : new YAHOO.widget.Paginator({   
		rowsPerPage    : 20, // REQUIRED  
               
		// use a custom layout for pagination controls   
		template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
		// use these in the rows-per-page dropdown   
		rowsPerPageOptions : [10,20],   
   
		// use custom page link labels   
		pageLabelBuilder : function (page,paginator) {   
			var recs = paginator.getPageRecords(page);   
			return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
		} 
		})   
 		}; 	
        
		var myDataTableY = new YAHOO.widget.ScrollingDataTable("INSURED_LIST", moreColumnDefs,anotherDataSource,myConfigs,{height:"10em"});  
		
		myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	   });
	   
		return {
			oDS2: anotherDataSource,
			oDT2: myDataTableY
		};
    }();
 }
</script>
</html:form>

<logic:present name="results" scope="request">
<bean:define id="htmlPage" name="results"	type="java.lang.StringBuffer" />
<%out.println(htmlPage.toString());%>
</logic:present>

<script type="text/javascript">
function addPolicy(agenId,ownId,useId,customerId,country,ObjectId,cusState){
var todayDate = document.getElementById('today').value;
document.forms[1].action = "../GetProductGroupsActionNonBTA.do?&customerId="+customerId+"&answer(Object::Customer::CustomerId)="+customerId+"&answer(Object::Agency::AgencyId)="+agenId+"TabPanelName=Quote_Panel&answer(Object::CustomerAdditional::ProgramName)=NON BTA&answer(createQuoteEffectiveDate)=yes"+
						"&answer(Object::Quote::primaryEntityId)="+ObjectId+"&answer(Object::Customer::CustomerId)="+customerId+"&answer(Object::Quote::QuoteStatus)=In Progress"+
						"&answer(Object::Quote::OwnerId)="+ownId+"&answer(Object::Quote::CreatedBy)="+useId+"&formName=form::GETCLQUOTEDETAILS"+
						"&answer(Object::Agency::AgencyId)="+agenId+"&answer(Object::Quote::ProductStatus)=DEVELOPMENT&answer(State)="+cusState+
						"&answer(Object::Risk::RiskId)=15&answer(Object::Quote::QuoteStartDate)="+todayDate+
						"&answer(Object::Quote::NewQuote)=YES&answer(Object::Quote::ProductStatus)=DEVELOPMENT";
document.forms[1].submit();	
}
</script>

<script type="text/javascript">
listagents();
listInsureds(-1);
document.forms[1].agentId[0].checked = true;
</script>