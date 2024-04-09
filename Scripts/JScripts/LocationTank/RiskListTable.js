function refereshRiskList() {
	YAHOO.util.Event.addListener(window, "load", function() {
	    YAHOO.example.Basic = function() {
	    
	     var formatInsuredUrl = function(elCell, oRecord, oColumn, sData) {     
	     		var riskId= '"'+oRecord.getData("RiskId")+'","'+oRecord.getData("LocationId")+'"';
	             elCell.innerHTML = "<a id='' rel='' target=''  href='javascript:showRisk("+riskId+")'>"+oRecord.getData("Tank Id")+"</a>";
	        };
	    
	        var myColumnDefs = [
	            {key:"Tank Id",formatter:formatInsuredUrl, sortable:true, resizeable:true},
	            {key:"Tank Name", sortable:true},
	            {key:"Tank Type", sortable:true, resizeable:true},
	            {key:"Locaion Number", sortable:true, resizeable:true},
	            {key:"Location Name", sortable:true, resizeable:true}
	        ];		
	        var myDataSource = new YAHOO.util.DataSource("../locationrisk/RiskListResult.jsp?answer(Object::Customer::CustomerId)="+document.getElementById('customerId').value+"&answer(Object::Submisssion::SubmisssionId)="+document.getElementById('submissionId').value);
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.responseSchema = {
	        	recordDelim: "\n",
	            fieldDelim: "____~____*",
	            fields: ["Tank Id","Tank Name","Tank Type","Locaion Number","Location Name","RiskId","LocationId"]
	        };       
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	
	        var myDataTable = new YAHOO.widget.DataTable("RISK_LIST_TABLE",
	                myColumnDefs, myDataSource, {caption:"Risk List"});
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
	});
}