<% 
/*
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
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript">
function validateDate(val,obj,desc){
	if(obj.value>val) {
		obj.value='';
		obj.focus();
		alert("Please Enter the Valid "+desc);
		return false;
	}	
}
</script>

<html:form action="/SearchSfDownStreamAction.do">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<div class="formpage01">
	<div class="content">
		<div class="formhead"><h2 class="left">Find DownStream</h2></div>
			
			<div class="field" style="width:510px">
				Object Type:
				<select name="answer(ObjectType)" class="txtbox" id="ObjectType">
						<option value="">All</option>
						<option value="Submission">Submission</option>
						<option value="Agency">Agency</option>
						<option value="Agent">Agent</option>
						<option value="Insured">Insured</option>									
	             </select>
			</div>
			<div class="field" style="width:500px">
				Import Type:										
				<select name="answer(ImportType)" class="txtbox" id="ImportType">
						<option value="">All</option>
						<option value="Triggered">Triggered</option>
						<option value="Pulled">Pulled</option>																																				
	             </select>
			</div>
			<div class="field" style="width:840px">
				Imported Date:					
				<span style="width:50px">From :</span>
					<input type="text" name="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].csddd.focus()}" styleId="csdmm" />
					<span style="width:15px">/</span>
							<input type="text" name="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].csdyy.focus()}" styleId="csddd" />
					<span style="width:15px">/</span>			
							<input type="text" name="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear+1,this,'Year');if(this.value.length==4) {document.forms[0].cedmm.focus()}" styleId="csdyy" />								
					<span style="width:50px">To :</span>
							<input type="text" name="answer(Month)"  size="2" maxlength="2" style="width:25px" onkeyup="validateDate(12,this,'Month');if(this.value.length==2) {document.forms[0].ceddd.focus()}" styleId="cedmm" />
					<span style="width:15px">/</span>
							<input type="text" name="answer(Date)"  size="2" maxlength="2" style="width:25px"  onkeyup="validateDate(31,this,'Date');if(this.value.length==2) {document.forms[0].cedyy.focus()}" styleId="ceddd" />
					<span style="width:15px">/</span>
							<input type="text" name="answer(Year)"  size="4" maxlength="4" style="width:40px" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear+1,this,'Year');" styleId="cedyy" />
				    <span style="width:50px">(MM/DD/YYYY)</span>
			</div>	
			<div class="formcontent" style="width:50%" align="center"  title="<bean:message key='ToolTip.FindPolicy.Find'/>">
				<center><input type="button" value="Find >" class="covbutton" onclick="listDownStreamData()" style="width:90px;">	</center>
			</div>			
			<div id="downStreamData"></div>			
	</div>
</div>

<html:hidden property="Object::Policy::PageNum" value="0" />

</html:form>



<script type="text/javascript">
var submissionId = "";
 function listDownStreamData() {  
    YAHOO.example.XHR_Text = function() {
    
		var formatSubmissionIdLink = function(elCell, oRecord, oColumn, sData) {
			submissionId = oRecord.getData("SubmissionId");
			var link1 = "<a href='../GetSubmissionDownStream.do?answer(Object::Submission::DownStream::Id)=";
			var link2 = "'>"+oRecord.getData("SubmissionId") + "</a>";
			var link= link1+submissionId+link2;			
			elCell.innerHTML =link;
		}
    
		var moreColumnDefs = [
            {key:"InsuredName", resizable:"true",width:150,label:"Insured Name"},
            {key:"BrokerName", resizable:"true",width:150,label:"Agency Name"},
            {key:"SubmissionId", resizable:"true",formatter:formatSubmissionIdLink,width:150,label:"Submission ID"},
            {key:"SubmissionName", resizable:"true",width:150,label:"Submission Name"}
            ]; 
                       
		var anotherDataSource = new YAHOO.util.DataSource("../SearchSfDownStreamAction.do?answer(Object::Policy::PageNum)=0");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
        	recordDelim: "\n",
			fieldDelim: "|",
            fields: ["InsuredName",
            		"BrokerName",
            		"SubmissionId",
            		"SubmissionName"]
        };  

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
		
		  // DataTable configuration 
	    var myConfigs = { 
	        initialRequest: "&sort=''&dir=asc&startIndex=0&results=25", // Initial request for first page of data 
	        dynamicData: true, // Enables dynamic server-driven data 
	        sortedBy : {key:"InsuredName", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow 
	        paginator: new YAHOO.widget.Paginator({ rowsPerPage:25,  template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   

	         // use these in the rows-per-page dropdown   
	         rowsPerPageOptions : [10,15,25],   
	   
	         // use custom page link labels   
	         pageLabelBuilder : function (page,paginator) {   
	             var recs = paginator.getPageRecords(page);   
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
	         }   
	     		})
	 		}; 	 
	 		
		var myDataTableY = new YAHOO.widget.DataTable("downStreamData",moreColumnDefs, anotherDataSource, myConfigs);	   
		
		return {
            oDS: anotherDataSource,
          	oDT: myDataTableY          	
        };
    }();
 }
 </script>