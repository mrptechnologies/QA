<%@ taglib uri="/WEB-INF/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css">



<% // <IMG class="arrowup_Home" id="arrowupClearance" onclick="switchContent('arrowdownClearance', 'inline', 'arrowupClearance', 'none', 'bodyClearance', 'inline');"
		//	src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show Clearance Requests">
//<IMG class="arrowdown_Home" id="arrowdownClearance" onclick="switchContent('arrowdownClearance', 'none', 'arrowupClearance', 'inline', 'bodyClearance', 'none');"			
		//	src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Clearance Requests">  className:'priority-image'%>
<DIV  id="headClearance">
	<% // <SPAN class="subFirst_Home">clearance requests</SPAN> %>
	
</DIV>
<DIV class="body_Home" id="bodyClearance" style="display:block;">
	 <table class="new_table_CL">
		<TBODY>
			<TR>
				<TD class=rowicon_Home>
					<table>
						<tr>
							<td width="12%"><SPAN  style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clAssignedChk" name="asdf" onclick="onRefCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="3%"></td>
							<td width="12%"><SPAN  style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clUnassignedChk" name="asdf" onclick="onRefCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="3%"></td>
							<td width="15%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clOtherChk" name="asdf" onclick="onRefCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="3%"></td>
							<td width="20%"><SPAN  >&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="clearancePeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="8" width="100%" align="left">
								<DIV class=divider_Home></DIV>
								<br>
								<DIV id="classigned" style="display:inline;" class="locformbox1 yui-skin-sam "></DIV>
								<br>
							</td>
							
						</tr>		
					</table>
					
			 	</TD>
			</TR>
		</TBODY>
	</table>					
</DIV>
<DIV class=divider_Home></DIV>
<DIV class=clear_Home></DIV>

<script type="text/javascript" >
loadClearanceReq();

YAHOO.util.Event.addListener(clearancePeriod, "change", function() {
loadClearanceReq();
});

function loadClearanceReq(){
    YAHOO.example.XHR_Text = function() {
    	
    	// var myConfigs = { paginator : new YAHOO.widget.Paginator({rowsPerPage : 10  })	};   
    	    
         var formatUrl = function(elCell, oRecord, oColumn, sData) {        
             elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("URL")+"?TabPanelName="+oRecord.getData("PanelName")+"&answer(TabPanelName)="+oRecord.getData("PanelName")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&customerId="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(requestForm)=Submission"+"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION"+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("SubmissionId")+"&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("SubmissionVerId")+"'>"+sData+"</a>";                          
        };
                        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
       
       var moreColumnDefsCl = [
            {key:"Assignee", resizable:"true",width:70},
            {key:"Date", resizable:"true",width:70},
            {key:"Submission #", formatter:formatUrl, resizable:"true",width:100},
            {key:"Insured Name", resizable:"true",width:170},
            {key:"State", resizable:"true",width:50},            
            {key:"Broker", resizable:"true",width:150},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:70},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:70}
            
        ];
         
        var period = document.getElementById("clearancePeriod").value;        
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);              
             	
	    var anotherDataSourceCL = new YAHOO.util.DataSource("../GetClearanceAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSourceCL.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSourceCL.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Submission #","Insured Name","State","SubmissionId","SubmissionVerId","Broker","Priority","Delete","URL","CustomerId","PanelName","AlertId"]
        };
        
        anotherDataSourceCL.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
        
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSourceCL.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };	        
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}   Show   {RowsPerPageDropdown} per page",   
               
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};    
     
       var myDataTableY = new YAHOO.widget.DataTable("classigned", moreColumnDefsCl,anotherDataSourceCL,myConfigs);
       
       myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Clearance Request action "'+ submissionNum +'"?')) {
		        	YAHOO.util.Connect.asyncRequest('GET', '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        			if (o.responseText == 'failure') {       	
		            			alert("Error in Deletion Operation!!");            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert("Error in Deletion Operation!!");
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });  	   
	              
       return {
           oDS2: anotherDataSourceCL,
           oDTY: myDataTableY
       };
    }();
}
</script>