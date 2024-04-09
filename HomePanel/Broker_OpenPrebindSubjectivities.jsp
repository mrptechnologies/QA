<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<DIV class=body_Home id=bodyPreBind  style="display: block;">
	<table class="new_table_PREB">
		<TBODY>
			<TR>
				<TD class="rowicon_Home">
					<table>
						<tr>
							<td width="5%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%">&nbsp;</SPAN></td>
							<td width="3%"></td>
							<td width="10%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%">&nbsp;</SPAN></td>
							<td width="3%"></td>
							<td width="10%"><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%">&nbsp;</SPAN></td>
							<td width="3%"></td>
							<td width="20%"><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="prebindPeriod">
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
							<div class="locformbox1 yui-skin-sam "  id="prebindAssigned" style="display:inline;"></div>
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
loadOpenPreBindSubj();
YAHOO.util.Event.addListener(prebindPeriod, "change", function() {
loadOpenPreBindSubj();
});
<% //YAHOO.util.Event.addListener(arrowupPreBind, "click", function() {
//loadOpenPreBindSubj();
//}); %>

function loadOpenPreBindSubj(){
    YAHOO.example.XHR_Text = function() {
    
        var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {
           elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("QuoteId")+"&answer(parentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::QuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(Object::Policy::ParentPolicyId)="+oRecord.getData("PolicyId")+"&answer(Object::Policy::ParentPolicyVerId)="+oRecord.getData("PolicyVerId")+"'>"+sData+"</a>";           																																																																																																																								
        };
        
        var formatSubjUrl = function(elCell, oRecord, oColumn, sData) {           
           if(oRecord.getData("QuoteType")=="NEW_BUSINESS") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjId")+"&answer(Object::Quote::ParentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::ProductVerId)="+oRecord.getData("productVerId")+"&answer(Object::Quote::ParentQuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(Object::Quote::SubQuoteId)="+oRecord.getData("SubQuoteId")+"&answer(Object::Quote::SuQuoteVerId)="+oRecord.getData("SubQuoteVerId")+"&answer(Object::Quote::ProductId)="+oRecord.getData("productId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Quote::QuoteStatus)="+oRecord.getData("QuoteStatus")+"'>"+sData+"</a>";
        	}
        	
        	if(oRecord.getData("QuoteType")=="ENDORSEMENT") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjId")+"&answer(parentPolicyId)="+oRecord.getData("PolicyId")+"&answer(policyVerId)="+oRecord.getData("PolicyVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(Object::Quote::ParentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::ProductVerId)="+oRecord.getData("productVerId")+"&answer(Object::Quote::ParentQuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(Object::Quote::SubQuoteId)="+oRecord.getData("SubQuoteId")+"&answer(Object::Quote::SuQuoteVerId)="+oRecord.getData("SubQuoteVerId")+"&answer(Object::Quote::ProductId)="+oRecord.getData("productId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Quote::QuoteStatus)="+oRecord.getData("QuoteStatus")+"'>"+sData+"</a>";
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
            {key:"Quote #", formatter:formatQuoteUrl,resizable:"true",width:50},
            {key:"Subjectivity", formatter:formatSubjUrl, resizable:"true",width:185},
            {key:"Insured Name", resizable:"true",width:165},
            {key:"Status", resizable:"true",width:180},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:50},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
        ];
        
        var period = document.getElementById("prebindPeriod").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 

        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/OpenPreBindResult.jsp");
        var anotherDataSource = new YAHOO.util.DataSource("../GetPreBindSubjectivityAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Date","Quote #","Subjectivity","Insured Name","Status","Priority","Delete","Quote Url","Subj Url","SubjId","productId","productVerId","QuoteId","QuoteVerId","SubQuoteId","SubQuoteVerId","QuoteStatus","QuoteType","PolicyId","PolicyVerId","PolicyNum","CustomerId","AgencyId","UserId","Quote PanelName","OwnerId","AlertId"]
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

		var myDataTableY = new YAHOO.widget.DataTable("prebindAssigned", moreColumnDefs,anotherDataSource,myConfigs);  		
		
		myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var quoteNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this OpenPreBindSubjectivity Request "'+ quoteNum +'" ?')) {
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