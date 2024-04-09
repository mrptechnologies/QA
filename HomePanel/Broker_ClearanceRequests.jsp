<%@ taglib uri="/WEB-INF/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<DIV class="body_Home" id="bodyClearance" style="display:block;">
	 <table class="new_table_CL">
		<TBODY>
			<TR>
				<TD class=rowicon_Home>
					<table>
						<tr>
							<td width="5%"><SPAN  style="FONT-WEIGHT: normal; WIDTH: 99.9%"></SPAN></td>
							<td width="3%"></td>
							<td width="10%"><SPAN  style="FONT-WEIGHT: normal; WIDTH: 99.9%"></SPAN></td>
							<td width="3%"></td>
							<td width="10%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"></SPAN></td>
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
						<tr>
							<td colspan="8" width="100%" align="left">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>							
							</td>
						</tr>	
						<tr>
							<td colspan="8" width="100%" align="left">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<DIV class=divider_Home></DIV>							
							</td>
						</tr>			
					</table>
					
			 	</TD>
			</TR>
		</TBODY>
	</table>					
</DIV>
<!-- <DIV class=divider_Home></DIV>-->
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
            {key:"Date", resizable:"true",width:70},
            {key:"Submission #", formatter:formatUrl, resizable:"true",width:100},
            {key:"Insured Name", resizable:"true",width:200},
            {key:"State", resizable:"true",width:50},            
            {key:"Status", resizable:"true",width:190},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:70},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:70}
            
        ];
         
        var period = document.getElementById("clearancePeriod").value;        
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);              
        var alertName = "Clearance";       	
	    var anotherDataSourceCL = new YAHOO.util.DataSource("../GetClearanceAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+"&alertName="+alertName+" ");
        anotherDataSourceCL.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSourceCL.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Date","Submission #","Insured Name","State","SubmissionId","SubmissionVerId","Status","Priority","Delete","Status","URL","CustomerId","PanelName","AlertId"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
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