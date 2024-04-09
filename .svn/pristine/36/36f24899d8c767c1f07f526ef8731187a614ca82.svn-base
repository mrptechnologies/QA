<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css">

<% //<IMG class="arrowup_Home" id="arrowupBind" onclick="switchContent('arrowdownBind', 'inline', 'arrowupBind', 'none', 'bodyBind', 'inline');"
	//		src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show Bind Requests">	
//<IMG class="arrowdown_Home" id="arrowdownBind" onclick="switchContent('arrowdownBind', 'none', 'arrowupBind', 'inline', 'bodyBind', 'none');"			
	//		src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Bind Requests">  class="head_Home"%>
<DIV  id="headBind">
 <%	//<SPAN class="subFirst_Home">Bind Requests/</SPAN>
	//<SPAN class=subFirst_Home>Binders Produced</SPAN>	   			 %>
</DIV>

<DIV  class="body_Home" id="bodyBind" style="display:block;">
	<table class="new_table_BR">
		<TBODY>
			<TR>
				<TD class=rowicon_Home>
					<table>
						<tr>
							<td width="12%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk1" name="asdf" onclick="onBindReqCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="3%"></td>
							<td width="12%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clchk2" name="asdf" onclick="onBindReqCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="3%"></td>
							<td width="15%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk3" name="asdf" onclick="onBindReqCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="3%"></td>
							<td width="20%"><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="bindRequestPeriod">
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
								<div class="locformbox1 yui-skin-sam " id="bindReqAssigned" style="display:inline;"></div>
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

<script type="text/javascript">
loadBindReq();
YAHOO.util.Event.addListener(bindRequestPeriod, "change", function() {
loadBindReq();
});
<%// YAHOO.util.Event.addListener(arrowupBind, "click", function() {
//loadBindReq();
//});%>

function loadBindReq(){
    YAHOO.example.XHR_Text = function() {
    	    	   
    	// var myConfigs = { paginator : new YAHOO.widget.Paginator({rowsPerPage : 10  })	};     	    	 	 
    	    	
        var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {

              elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("QuoteId")+"&answer(parentQuoteId)="+oRecord.getData("QuoteId")+"&answer(ownerId)="+oRecord.getData("OwnerId")+"&answer(Object::Agency::AgencyId)="+oRecord.getData("AgencyId")+"&answer(userId)="+oRecord.getData("UserId")+"'>"+sData+"</a>";
        };
        
        var formatInsuredUrl = function(elCell, oRecord, oColumn, sData) {        
             elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("Insured Url")+"?TabPanelName="+oRecord.getData("Insured PanelName")+"&customerId="+oRecord.getData("CustomerId")+"'>"+sData+"</a>";
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:70},
            {key:"Date", resizable:"true",width:70},
            {key:"Quote #", formatter:formatQuoteUrl, resizable:"true",width:100},
            {key:"Insured Name", formatter:formatInsuredUrl, resizable:"true",width:170},
            {key:"State", resizable:"true",width:50},
            {key:"Broker", resizable:"true",width:150},
            {key:"Priority",formatter:formatPriorityUrl , resizable:"true",width:70},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:70}
            
        ];
        
        var period = document.getElementById("bindRequestPeriod").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);  
        
        var anotherDataSource = new YAHOO.util.DataSource("../GetBindRequestAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Quote #","Insured Name","State","Broker","Priority","Delete","Quote Url","Insured Url","CustomerId","QuoteId","AgencyId","UserId","Quote PanelName","Insured PanelName","OwnerId","AlertId"]
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
        
        YAHOO.widget.DataTable._bStylesheetFallback = !!YAHOO.env.ua.ie;    
        
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
              
        var myDataTableY = new YAHOO.widget.DataTable("bindReqAssigned", moreColumnDefs,anotherDataSource,myConfigs); 
                
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var quoteNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this BindRequest action "'+ quoteNum +'" ?')) {
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
	    	var submissionNum = record.getData("Quote #");
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