<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<DIV class="body_Home" id=bodyNotification  style="display: block;">        
	<table class="new_table_NF">
		<TBODY>
			<TR>
				<TD class="rowicon_Home">
					<table>
						<tr>
							<td width="5%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%">&nbsp;</SPAN></td>
							<td  width="3%"></td>
							<td width="10%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%">&nbsp;</SPAN></td>
							<td width="3%"></td>
							<td width="10%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%">&nbsp;</SPAN></td>
							<td width="3%"></td>
							<td width="20%"><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="notificationPeriod">
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
								<BR>					
								<div class="locformbox1 yui-skin-sam "  id="notificationassigned" style="display:inline;"></div>
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
				
<DIV class=clear_Home></DIV>

			
<script type="text/javascript" >
loadNotifications();
YAHOO.util.Event.addListener(notificationPeriod, "change", function() {
loadNotifications();
});


function loadNotifications(){
    YAHOO.example.XHR_Text = function() {
    
        var formatUrl = function(elCell, oRecord, oColumn, sData) {        	
        	if(oRecord.getData("ObjectType")=="Quote") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("ObjectId")+"&answer(parentQuoteId)="+oRecord.getData("ObjectId")+"&answer(ownerId)="+oRecord.getData("OwnerId")+"&answer(Object::Agency::AgencyId)="+oRecord.getData("AgencyId")+"&answer(userId)="+oRecord.getData("UserId")+"'>"+sData+"</a>";        		 
        	}
        	
        	if(oRecord.getData("ObjectType")=="Submission") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("Submission Url")+"?TabPanelName="+oRecord.getData("Submission PanelName")+"&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("ObjectVerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("ObjectId")+"&answer(TabPanelName)="+oRecord.getData("Submission PanelName")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&customerId="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(requestForm)=Submission"+"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION"+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"'>"+sData+"</a>";             
        		
        	}            
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [            
            {key:"Date", resizable:"true",width:70},
            {key:"Quote/Submission #", formatter:formatUrl, resizable:"true",width:105},
            {key:"Message", resizable:"true",width:120},
            {key:"Insured Name", resizable:"true",width:185},
            {key:"Status", resizable:"true",width:170},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:50},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
        ];
        
        var period = document.getElementById("notificationPeriod").value;                
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 
        
        var anotherDataSource = new YAHOO.util.DataSource("../GetNotificationAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Date","Quote/Submission #","Message","Insured Name","Status","Priority","Delete","Quote Url","Submission Url","CustomerId","ObjectId","AgencyId","UserId","Quote PanelName","Submission PanelName","OwnerId","AlertId","ObjectType","ObjectVerId"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSource.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
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
        
        var myDataTableY = new YAHOO.widget.DataTable("notificationassigned", moreColumnDefs,anotherDataSource,myConfigs);  
        
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var num = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Notification Request action "'+ num +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('GET',
	                '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert(o.statusText);
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });
        

        return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
}

</script>