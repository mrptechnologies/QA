function listInvoice() { 
 	   autologout();
		updateCount();
    YAHOO.example.XHR_Text = function() {
    
    		var formatRadio = function(elCell, oRecord, oColumn, sData) {	    	  		
	   		var html = "<input type='radio' name='LoginPage' id='Select' class='chk1' style='width:18px;'>"
	   		elCell.innerHTML = html;
	  	 }
    

      	    var moreColumnDefs = [
            {key:"Select", formatter:formatRadio,resizeable:false},
            {key:"DocumentNo", label:"Document&nbsp;&nbsp;#", resizable:"false",width:90},
            {key:"DocumentType",label:"Document&nbsp;&nbsp;Type", resizable:"false",width:100},
            {key:"Transaction", resizable:"false",width:85},
            {key:"TransactionEffectiveDate", label: "Transaction&nbsp;&nbsp;Effective&nbsp;&nbsp;Date", resizable:"false",width:150},
            {key:"DueDate", label:"Due Date", resizable:"false",width:60},
            {key:"Amount", resizable:"false",width:65},
            {key:"AmountDue",label:"Amount Due", resizable:"false",width:80},
            {key:"Status",resizable:"false",width:30}]; 
                       
           YAHOO.example.Data = { 
	    listofInvoice: [ 
	        {DocumentNo:1,DocumentType:"Invoice", Transaction:null,TransactionEffectiveDate:"12/05/2010",DueDate:"12/05/2011",Amount:"$25000",AmountDue:"$25000",Status:"Open"},
	        {DocumentNo:2,DocumentType:"Debit Note", Transaction:null,TransactionEffectiveDate:"01/03/2009",DueDate:"01/03/2011",Amount:"$15000",AmountDue:"$10000",Status:"Due"}
	    ] 
	} 
		
		document.getElementById('divSelectButton').style.display='block';
		document.getElementById('deleteInvoiceButton').style.display='block';
		document.getElementById('voidInvoiceButton').style.display='block';

        var anotherDataSource =new YAHOO.util.DataSource(YAHOO.example.Data.listofInvoice); 
        anotherDataSource.responseType =  YAHOO.util.DataSource.TYPE_JSARRAY; 
        anotherDataSource.responseSchema = {
            fields: ["Select","DocumentNo","DocumentType","Transaction","TransactionEffectiveDate","DueDate","Amount","AmountDue","Status"]
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
        
        
        
            myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	agencyId = record.getData("AgencyID");
			document.getElementById('agencId').value=agencyId

	   });
  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();

 }
 
 
 function listPayment() { 
 	   autologout();
		updateCount();
    YAHOO.example.XHR_Text = function() {
    
    		var formatRadio = function(elCell, oRecord, oColumn, sData) {	    	  		
	   		var html = "<input type='radio' name='LoginPage' id='Select' class='chk1' style='width:18px;'>"
	   		elCell.innerHTML = html;
	  	 }
    

      	    var moreColumnDefs = [
            {key:"Select", formatter:formatRadio,resizeable:false},
            {key:"DocumentNo", label:"Document&nbsp;&nbsp;#", resizable:"false",width:90},
            {key:"DocumentType",label:"Document&nbsp;&nbsp;Type", resizable:"false",width:100},
            {key:"Date", resizable:"false",width:85},
            {key:"Reference#", label: "Reference&nbsp;&nbsp;#", resizable:"false",width:180},
            {key:"Amount", resizable:"false",width:65},
            {key:"Appliestowhichinvoice",label:"Applies&nbsp;&nbsp;to&nbsp;&nbsp;which&nbsp;&nbsp;invoice(s)", resizable:"false",width:180}]; 
                       
           YAHOO.example.Data = { 
	    listofInvoice: [ 
	        {DocumentNo:1,DocumentType:"Payment", Date:"12/05/2010",Amount:"$25000",AmountDue:"$25000",Appliestowhichinvoice:"Invoice1"},
	        {DocumentNo:2,DocumentType:"Credit", Date:"01/03/2010",Amount:"$10000",AmountDue:"$10000",Appliestowhichinvoice:"Invoice2"}
	    ] 
	} 
		
		document.getElementById('addPaymentButton').style.display='block';
		document.getElementById('deletePaymentButton').style.display='block';
		

        var anotherDataSource =new YAHOO.util.DataSource(YAHOO.example.Data.listofInvoice); 
        anotherDataSource.responseType =  YAHOO.util.DataSource.TYPE_JSARRAY; 
        anotherDataSource.responseSchema = {
            fields: ["Select","DocumentNo","DocumentType","Date","Reference#","Amount","Appliestowhichinvoice"]
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
 	
        
      var myDataTableY = new YAHOO.widget.ScrollingDataTable("Payment_List", moreColumnDefs,anotherDataSource,myConfigs,{height:"10em"});  
        
        
        
            myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	agencyId = record.getData("AgencyID");
			document.getElementById('agencId').value=agencyId

	   });
  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();

 }