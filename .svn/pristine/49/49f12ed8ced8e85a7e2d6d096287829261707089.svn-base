<%/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>  
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

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

<html:form action="/FindAgencyNonBTA.do">
	
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	<bean:define id="agencyId" property="answer(Agency::AgencyId)" scope="session" name="AddCustomer"/>
	
	<div class="formpage01">
	<div class="content">
	<div class="formhead">
	<h2 class="left">Add Policy - Find Agency Result</h2>
	</div>
	<div>&nbsp;</div>
	<table align="center" width="70%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td>Select Agency/Broker:</td>
			<td><input type="text" class="txtbox" id="AgencyId" name="AgencyName"
				size="50" /></td>
			<td><input type="submit" value="Find Agency" class="covsmallbutton" style="width:90px;"></td>		
		</tr>
		</table>
		
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
		
		<div id="AgencyCount"></div>
		<div id="AGENCY_LIST" class="yui-skin-sam"></div>
		
		<table align="center" width="70%">
		<tr>
			<td><a href="../AddInsuredNonBTA.do?clear=yes" class="button2"
				style="width:100px">Add Insured</a></td>
		</tr>
	</table>
	</div>
	</div>
	
<html:hidden property="answer(Agency::NotEquals::ParentAgencyId)" value="-1" styleId="ParentAgencyId"/>
<html:hidden property="LimitSearch" value="yes" styleId="LimitSearch"/>
<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>" styleId="OwnerId"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" styleId="TabPanelName"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' styleId="dbname"/>	


<html:hidden property="formName" value="form::SEARCHAGENT" />
<html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="AGENCY" />   
<html:hidden property="entityType" value="AGENT" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=""+ownerId %>' />	
<html:hidden property="LimitSearch" value="yes" />
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
<html:hidden property="answer(Object::Entity::PageNum)" value="0"/> 
<html:hidden property="answer(forwardKey)" value="<%="SubmissionAgencySuccess"%>" />
<html:hidden property="answer(PageType)" value="<%="SubmissionAgency"%>" />
<html:hidden property="answer(Agency::AgencyId)" value="<%=""%>"  styleId="agencyId"/>
<html:hidden property="answer(AgentId)" value="<%="-1"%>"  styleId="agentId"/>
	
	<script type="text/javascript">
	
function updateCount(){
 	var dbname=document.getElementById("dbname").value;	
	var ParentAgencyId=document.getElementById("ParentAgencyId").value;
	var LimitSearch=document.getElementById("LimitSearch").value;
	var inpPageNum=document.getElementById("inpPageNum").value;
	var orderby=document.getElementById("orderby").value;
	var OwnerId=document.getElementById("OwnerId").value;
	
	document.getElementById('divSelectButton').style.display='block';
	
	var url = "../ListOfAgenciesCount.do?answer(TabPanelName)=Submission_Panel&answer(dbname)="+dbname+"&answer(Agency::NotEquals::ParentAgencyId)="+ParentAgencyId+"&LimitSearch="+LimitSearch+"&answer(Object::Agency::PageNum)="+inpPageNum+"&answer(orderby)="+orderby+"&answer(Agency::Equals::OwnerId)="+OwnerId;
 	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("AgencyCount").innerHTML = "Number of Agencies Found: "+transport.responseText;
 		}});
 }
 
	 //To load the Available agencies in the yahoo data table 
var agencyId=0; 


 function listAgency() { 
 	   autologout();
 	   updateCount();
    YAHOO.example.XHR_Text = function() {
    alert("XHR_Text");
    
    		var formatRadio = function(elCell, oRecord, oColumn, sData) {	    	  		
	   		var html = "<input type='radio' name='LoginPage' id='Select' class='chk1' style='width:18px;'>"
	   		elCell.innerHTML = html;
	   }
	   	 var formatCity = function(elCell, oRecord, oColumn, sData) {	
			var link= "<div style='word-wrap: break-word'>" + oRecord.getData("City") + "</div>";
			
			 elCell.innerHTML =link;		 
		   }

       var moreColumnDefs = [
            {key:"Code", resizable:"false",width:55},
            {key:"Agency Name", resizable:"false",width:150},
            {key:"Branch Name", resizable:"false",width:65},
            {key:"List Name", resizable:"false",width:85},
            {key:"Address Line 1",  resizable:"false",width:90},
            {key:"Address Line 2", resizable:"false",width:90},
            {key:"City", resizable:"false",formatter:formatCity,width:65},
            {key:"State",  resizable:"false",width:20},
            {key:"Zip",  resizable:"false",width:30},
            {key:"Status",  resizable:"false",width:25},
            {key:"Select",formatter:formatRadio,resizeable:false}]; 
                       
		var dbname=document.getElementById("dbname").value;	
		var ParentAgencyId=document.getElementById("ParentAgencyId").value;
		var LimitSearch=document.getElementById("LimitSearch").value;
		var inpPageNum=document.getElementById("inpPageNum").value;
		var orderby=document.getElementById("orderby").value;
		var OwnerId=document.getElementById("OwnerId").value;
		/*var AgencyCode=document.getElementById("AgencyCode").value;
		alert("AgencyCode :"+AgencyCode);
		var AgencyCode=escape(document.getElementById("BusinessName").value);
		alert("AgencyCode :"+AgencyCode);
		var State=document.getElementById("State").value;
		alert("State :"+State);*/
		
		document.getElementById('divSelectButton').style.display='block';


        //var anotherDataSource = new YAHOO.util.DataSource("../ListOfAgencies.do?answer(TabPanelName)=Submission_Panel&answer(dbname)="+dbname+"&answer(Agency::NotEquals::ParentAgencyId)="+ParentAgencyId+"&LimitSearch="+LimitSearch+"&answer(Object::Agency::PageNum)="+inpPageNum+"&answer(orderby)="+orderby+"&answer(Agency::Equals::OwnerId)="+OwnerId+"&answer(Agency::Like::AgencyCode)="+AgencyCode+"&answer(Agency::Like::BusinessName)="+BusinessName+"&answer(Address::Equals::State)="+State+"&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME ASC");
		var anotherDataSource = new YAHOO.util.DataSource("../ListOfAgencies.do?answer(TabPanelName)=Submission_Panel&answer(dbname)="+dbname+"&answer(Agency::NotEquals::ParentAgencyId)="+ParentAgencyId+"&LimitSearch="+LimitSearch+"&answer(Object::Agency::PageNum)="+inpPageNum+"&answer(orderby)="+orderby+"&answer(Agency::Equals::OwnerId)="+OwnerId+"&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME ASC");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Code","Agency Name","Branch Name","List Name","Address Line 1","Address Line 2","City","State","Zip","Status","Select","AgencyID"]
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
        
      var myDataTableY = new YAHOO.widget.ScrollingDataTable("AGENCY_LIST", moreColumnDefs,anotherDataSource,myConfigs,{height:"10em"});        
		alert("1");
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
    alert("2");
 }
	</script>
	
	<script type="text/javascript">
	listAgency();
	</script>
</html:form>