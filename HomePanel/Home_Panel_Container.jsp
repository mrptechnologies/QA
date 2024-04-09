<link rel="stylesheet" type="text/css" href="../ui3.0/i/menu.css" />
<script type="text/javascript" src="../ui3.0/i/menu.js"></script> 
<link rel="stylesheet" type="text/css" href="../ui3.0/i/style.css" />
<link rel="stylesheet" type="text/css" href="../styles/HomePanelStyles.css" />
 <script type="text/javascript" src="../Scripts/JScripts/HomePanel.js"></script> 
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>

<script type="text/javascript">

var value = '';
	function ChangeContent(){
		if(value=="BindRequest"){
			loadBindReq();			
		}
		else if(value=="ClearanceRequest"){
			loadClearanceReq();			
		}
		else if(value=="UnderwritingReferal"){
			loadUnderwriterRef();			
		}
		else if(value=="PreBindSubjectivity"){
			loadOpenPreBindSubj();
		}
		else if(value=="PostBindSubjectivity"){
			loadOpenPostBoundSubj();
			
		}
		else if(value=="Notification"){
			loadNotifications();
		}
		else if(value=="Renewal"){
			loadRenewal();
		}
	}
	
	function onRefCheckClick(formName) {
	
		//Null Implementation for Fixing Bug Id 7916
	}

function loadClearanceReq(){
	value ="ClearanceRequest";
    YAHOO.example.XHR_Text = function() {
    	
    	// var myConfigs = { paginator : new YAHOO.widget.Paginator({rowsPerPage : 10  })	};   
    	var formatUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = oRecord.getData("URL"); 
        };
    	                
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
       
       var moreColumnDefsCl = [
            {key:"Assignee", resizable:"true",width:70},
            {key:"Date", resizable:"true",width:60},
            {key:"Submission #",formatter:formatUrl ,  resizable:"true",width:100},
            {key:"Insured Name", resizable:"true",width:110},
            {key:"State", resizable:"true",width:50},            
            {key:"Broker", resizable:"true",width:150},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:60},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
            
        ];
         
        var period = document.getElementById("Period").value;        
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);
        var parameters ="SearchStartDate="+searchStartDate+"&answer(Object::Alert::AlertName)=clearance&SearchEndDate="+searchEndDate;              
        var anotherDataSourceCL = new YAHOO.util.DataSource("../GetClearanceAlertAction.do");
        anotherDataSourceCL.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSourceCL.connMethodPost = true;
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
        		 initialRequest: parameters, // Initial request for first page of data 
     	        generateRequest: parameters ,
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
     
       var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefsCl,anotherDataSourceCL,myConfigs);
       
       myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Clearance Request action "'+ submissionNum +'"?')) {
		        	YAHOO.util.Connect.asyncRequest('POST', '../DeleteHomeAlertAction.do?',                
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
	              	},'answer(Object::Alert::AlertId)=' + record.getData('AlertId')
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


function loadUnderwriterRef(){
	value = "UnderwritingReferal";
    YAHOO.example.XHR_Text = function() {  
    
         var formatObjectUrl = function(elCell, oRecord, oColumn, sData) {
        	 elCell.innerHTML = oRecord.getData("Object Url");       
        };
        
        var formatInsuredUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = oRecord.getData("Insured Url"); 
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../Images/Priority.jpeg">'; 
        };
        
       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:70},
            {key:"Date",resizable:"true",width:60},
            {key:"Quote/Submission #",formatter:formatObjectUrl ,resizable:"true",width:100},
            {key:"Insured Name",formatter:formatInsuredUrl , resizable:"true",width:110},
            {key:"State", resizable:"true",width:50},
            {key:"Broker", resizable:"true",width:150},
            {key:"Priority",formatter:formatPriorityUrl, resizable:"true",width:60},
            {key:"Delete",formatter:formatDeleteUrl, resizable:"true",width:50}
            
        ];
        
        var period = document.getElementById("Period").value;                
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);   
        var parameters ="SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+"&AlertName=Referred";
        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/UnderwritingReferalResult.jsp");
        var anotherDataSourceRefUW = new YAHOO.util.DataSource("../GetReferralAlertAction.do?");
        anotherDataSourceRefUW.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSourceRefUW.connMethodPost = true; 
        anotherDataSourceRefUW.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Quote/Submission #","Insured Name","State","Broker","Priority","Delete","Object Url","Insured Url","CustomerId","ObjectId","AgencyId","UserId","Quote PanelName","Insured PanelName","Submission PanelName","OwnerId","AlertId","ObjectType","ObjectVerId","PolicyId","PolicyVerId","PolicyNumber","QuoteSubNum"]
        };

        anotherDataSourceRefUW.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSourceRefUW.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };
        
        // Configuration for Pagination
        var myConfigs = {   
        		initialRequest: parameters,
        		generateRequest: parameters,
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
        	
        var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefs,anotherDataSourceRefUW, myConfigs);
        
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var objectNum = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Referral Request action "'+ objectNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('POST',
	                '../DeleteHomeAlertAction.do',                
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
	              	},'answer(Object::Alert::AlertId)=' + record.getData('AlertId')
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var objectNum = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });        
         
        return {
            oDS2: anotherDataSourceRefUW,
            oDTY: myDataTableY
        };
    }();
}


function loadBindReq(){
	value = "BindRequest";
    YAHOO.example.XHR_Text = function() {
    	    	   
    	// var myConfigs = { paginator : new YAHOO.widget.Paginator({rowsPerPage : 10  })	};     	    	 	 
    	    	
         var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {
		
              elCell.innerHTML = oRecord.getData("Quote Url");
        };
        
        var formatInsuredUrl = function(elCell, oRecord, oColumn, sData) {        
             elCell.innerHTML = oRecord.getData("Insured Url");
        }; 
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:70},
            {key:"Date", resizable:"true",width:60},
            {key:"Quote #", formatter:formatQuoteUrl, resizable:"true",width:100},
            {key:"Insured Name", formatter:formatInsuredUrl, resizable:"true",width:110},
            {key:"State", resizable:"true",width:50},
            {key:"Broker", resizable:"true",width:150},
            {key:"Priority",formatter:formatPriorityUrl , resizable:"true",width:60},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
            
        ];
        
        var period = document.getElementById("Period").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);  
        var parameters ="SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+"&AlertName=BindRequest";
        var anotherDataSource = new YAHOO.util.DataSource("../GetBindRequestAlertAction.do");
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Quote #","Insured Name","State","Broker","Priority","Delete","Quote Url","Insured Url","CustomerId","QuoteId","AgencyId","UserId","Quote PanelName","Insured PanelName","OwnerId","AlertId","PolicyId","PolicyVerId","PolicyNumber","QuoteSubNum"]
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
        		initialRequest: parameters,
        		generateRequest: parameters,
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
              
        var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefs,anotherDataSource,myConfigs); 
                
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var quoteNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this BindRequest action "'+ quoteNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('POST',
	                '../DeleteHomeAlertAction.do?',                
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
	              	}, 'answer(Object::Alert::AlertId)=' + record.getData('AlertId')
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


function loadOpenPreBindSubj(){
	value = "PreBindSubjectivity";
    YAHOO.example.XHR_Text = function() {
    
        var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {
		       
           elCell.innerHTML = oRecord.getData("Quote Url");           																																																																																																																								
        };
        
        var formatSubjUrl = function(elCell, oRecord, oColumn, sData) {          
        	elCell.innerHTML = oRecord.getData("Subj Url");
           																										 					
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:60},
            {key:"Date", resizable:"true",width:60},
            {key:"Quote #", formatter:formatQuoteUrl,resizable:"true",width:50},
            {key:"Subjectivity", formatter:formatSubjUrl, resizable:"true",width:120},
            {key:"Insured Name", resizable:"true",width:110},
            {key:"Broker", resizable:"true",width:150},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:50},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
        ];
        
        var period = document.getElementById("Period").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 
        var parameters ="SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate;
        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/OpenPreBindResult.jsp");
        var anotherDataSource = new YAHOO.util.DataSource("../GetPreBindSubjectivityAlertAction.do");
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Quote #","Subjectivity","Insured Name","Broker","Priority","Delete","Quote Url","Subj Url","SubjId","productId","productVerId","QuoteId","QuoteVerId","SubQuoteId","SubQuoteVerId","QuoteStatus","QuoteType","PolicyId","PolicyVerId","PolicyNum","CustomerId","AgencyId","UserId","Quote PanelName","OwnerId","AlertId","QuoteSubNum"]
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
    	    initialRequest: parameters,
            generateRequest: parameters,
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

		var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefs,anotherDataSource,myConfigs);  		
		
		myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var quoteNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this OpenPreBindSubjectivity Request "'+ quoteNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('POST',
	                '../DeleteHomeAlertAction.do',                
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
	              	},'?answer(Object::Alert::AlertId)=' + record.getData('AlertId')
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


function loadOpenPostBoundSubj(){
	value = "PostBindSubjectivity";
    YAHOO.example.XHR_Text = function() {
    
        var formatQuotePolicyUrl = function(elCell, oRecord, oColumn, sData) {
		   elCell.innerHTML = oRecord.getData("Quote Url");
        };
        
        var formatSubjUrl = function(elCell, oRecord, oColumn, sData) {
        	elCell.innerHTML = oRecord.getData("Subj Url");															 					
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:60},
            {key:"Date", resizable:"true",width:60},
            {key:"Quote/Policy #", formatter:formatQuotePolicyUrl, resizable:"true",width:90},
            {key:"Subjectivity", formatter:formatSubjUrl, resizable:"true",width:120},
            {key:"Insured Name", resizable:"true",width:120},
            {key:"Broker", resizable:"true",width:100},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:50},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
        ];
        
        var period = document.getElementById("Period").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);  
        var parameters ="SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate;
        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/OpenPostBoundResult.jsp");
        var anotherDataSource = new YAHOO.util.DataSource("../GetPostBindSubjectivityAlertAction.do");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Quote/Policy #","Subjectivity","Insured Name","Broker","Priority","Delete","Quote Url","Subj Url","SubjId","productId","productVerId","QuoteId","QuoteVerId","SubQuoteId","SubQuoteVerId","QuoteStatus","QuoteType","PolicyId","PolicyVerId","PolicyNum","CustomerId","AgencyId","UserId","Quote PanelName","Policy PanelName","OwnerId","AlertId","QuoteSubNum"]
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
        		initialRequest: parameters,
        		generateRequest: parameters,
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
        
        var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefs,anotherDataSource,myConfigs);  
         
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var policyNum = record.getData("Quote/Policy #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this OpenPostBoundSubjectivity Request "'+ policyNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('POST',
	                '../DeleteHomeAlertAction.do',                
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
	              	},'answer(Object::Alert::AlertId)=' + record.getData('AlertId')
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Policy #");
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


function loadNotifications(){
	value = "Notification";
    YAHOO.example.XHR_Text = function() {
    
        var formatUrl = function(elCell, oRecord, oColumn, sData) {        	
        	elCell.innerHTML = oRecord.getData("Object Url");
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:70},
            {key:"Date", resizable:"true",width:60},
            {key:"Quote/Submission #", formatter:formatUrl, resizable:"true",width:100},
            {key:"Message", resizable:"true",width:100},
            {key:"Insured Name", resizable:"true",width:120},
            {key:"Broker", resizable:"true",width:100},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:50},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:50}
        ];
        
        var period = document.getElementById("Period").value;                
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 
        var parameters ="SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+"&AlertName=Notification";
        var anotherDataSource = new YAHOO.util.DataSource("../GetNotificationAlertAction.do");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Quote/Submission #","Message","Insured Name","Broker","Priority","Delete","Object Url","CustomerId","ObjectId","AgencyId","UserId","Quote PanelName","Submission PanelName","OwnerId","AlertId","ObjectType","ObjectVerId","PolicyId","PolicyVerId","PolicyNumber","QuoteSubNum"]
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
        		initialRequest: parameters,
        		generateRequest: parameters,
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
        
        var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefs,anotherDataSource,myConfigs);  
        
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var num = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Notification Request action "'+ num +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('POST',
	                '../DeleteHomeAlertAction.do',                
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
	              	},'answer(Object::Alert::AlertId)=' + record.getData('AlertId')
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

function loadRenewal(){
	value = "Renewal";
    YAHOO.example.XHR_Text = function() {
    
        var formatPolicyUrl = function(elCell, oRecord, oColumn, sData) {
            elCell.innerHTML = oRecord.getData("Policy Url");
        };

        var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {
            elCell.innerHTML = oRecord.getData("Quote Url");
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/recycle2.gif">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true",width:50},
            {key:"Date", resizable:"true",width:60},
            {key:"Renewing Policy #", formatter:formatPolicyUrl, resizable:"true",width:100},
            {key:"Renewal Quote #", label:"Renewal<br>Quote #",formatter:formatQuoteUrl, resizable:"true",width:50},            
            {key:"Quote Status", resizable:"true",width:70},
            {key:"Message", resizable:"true",width:90},
            //{key:"Effective Date", resizable:"true",width:100},
            //{key:"Expiration Date", resizable:"true",width:100},
            {key:"Insured Name", resizable:"true",width:80},
            {key:"State", resizable:"true",width:25},
            {key:"Broker", resizable:"true",width:100},
            {key:"Priority", formatter:formatPriorityUrl, resizable:"true",width:40},
            {key:"Delete", formatter:formatDeleteUrl, resizable:"true",width:40}
        ];
        
        var period = document.getElementById("Period").value;                
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 
        var parameters ="SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+"&ObjectType=Renewal";
        var anotherDataSource = new YAHOO.util.DataSource("../GetRenewalAlertAction.do");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.connMethodPost = true; 
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Assignee","Date","Renewing Policy #","Renewal Quote #","Quote Status","Effective Date","Expiration Date","Message","Insured Name","State","Broker","Priority","Delete","Policy Url","Quote Url","CustomerId","ObjectId","AgencyId","UserId","Policy PanelName","Quote PanelName","OwnerId","AlertId","ObjectType","ObjectVerId","PolicyId","PolicyVerId","PolicyNumber","QuoteId"]
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
        		initialRequest: parameters,
        		generateRequest: parameters,
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
        
        var myDataTableY = new YAHOO.widget.DataTable("TabArea", moreColumnDefs,anotherDataSource,myConfigs);  
        
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var num = record.getData("Renewal Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Alert Request action "'+ num +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('POST',
	                '../DeleteHomeAlertAction.do',                
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
	              	},'answer(Object::Alert::AlertId)=' + record.getData('AlertId')
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Renewal Quote #");
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
<script>
	function ChangeStyle(TabName){
		if(TabName=='ClearanceRequest'){
			 document.getElementById('ClearanceRequestStyle').className ="todotab_active";
			 document.getElementById('ReferalStyle').className = "todotab_inactive";
			 document.getElementById('BindRequestStyle').className = "todotab_inactive";
			 document.getElementById('PreBindStyle').className = "todotab_inactive";
			 document.getElementById('PostBindStyle').className = "todotab_inactive";
			 document.getElementById('NotificationStyle').className = "todotab_inactive";
			 document.getElementById('RenewalStyle').className = "todotab_inactive";
		}			 		
		else if(TabName=='UnderwritingReferal'){
			
			 document.getElementById('ReferalStyle').className = "todotab_active";
			 document.getElementById('ClearanceRequestStyle').className ="todotab_inactive";
			 document.getElementById('BindRequestStyle').className = "todotab_inactive";
			 document.getElementById('PreBindStyle').className = "todotab_inactive";
			 document.getElementById('PostBindStyle').className = "todotab_inactive";
			 document.getElementById('NotificationStyle').className = "todotab_inactive";
			 document.getElementById('RenewalStyle').className = "todotab_inactive";
		}
		else if(TabName=='BindRequest'){
			  document.getElementById('BindRequestStyle').className = "todotab_active";
			 document.getElementById('ReferalStyle').className = "todotab_inactive";
			 document.getElementById('ClearanceRequestStyle').className ="todotab_inactive";			
			 document.getElementById('PreBindStyle').className = "todotab_inactive";
			 document.getElementById('PostBindStyle').className = "todotab_inactive";
			 document.getElementById('NotificationStyle').className = "todotab_inactive";
			 document.getElementById('RenewalStyle').className = "todotab_inactive";	
		}
		else if(TabName=='PreBindSubjectivity'){
			 document.getElementById('PreBindStyle').className = "todotab_active";
			  document.getElementById('BindRequestStyle').className = "todotab_inactive";
			 document.getElementById('ReferalStyle').className = "todotab_inactive";
			 document.getElementById('ClearanceRequestStyle').className ="todotab_inactive";			
			 document.getElementById('PostBindStyle').className = "todotab_inactive";
			 document.getElementById('NotificationStyle').className = "todotab_inactive";
			 document.getElementById('RenewalStyle').className = "todotab_inactive";	
		}
		else if(TabName=='PostBindSubjectivity'){
			 document.getElementById('PostBindStyle').className = "todotab_active";
			 document.getElementById('PreBindStyle').className = "todotab_inactive";
			  document.getElementById('BindRequestStyle').className = "todotab_inactive";
			 document.getElementById('ReferalStyle').className = "todotab_inactive";
			 document.getElementById('ClearanceRequestStyle').className ="todotab_inactive";						 
			 document.getElementById('NotificationStyle').className = "todotab_inactive";
			 document.getElementById('RenewalStyle').className = "todotab_inactive";	
		}
		else if(TabName=='Notification'){
			 document.getElementById('NotificationStyle').className = "todotab_active";	
			 document.getElementById('PostBindStyle').className = "todotab_inactive";
			 document.getElementById('PreBindStyle').className = "todotab_inactive";
			  document.getElementById('BindRequestStyle').className = "todotab_inactive";
			 document.getElementById('ReferalStyle').className = "todotab_inactive";
			 document.getElementById('ClearanceRequestStyle').className ="todotab_inactive";						 
			 document.getElementById('RenewalStyle').className = "todotab_inactive";				 
		}
		else if(TabName=='Renewal'){
			document.getElementById('RenewalStyle').className = "todotab_active";
			document.getElementById('NotificationStyle').className = "todotab_inactive";	
			document.getElementById('PostBindStyle').className = "todotab_inactive";
			document.getElementById('PreBindStyle').className = "todotab_inactive";
			document.getElementById('BindRequestStyle').className = "todotab_inactive";
			document.getElementById('ReferalStyle').className = "todotab_inactive";
			document.getElementById('ClearanceRequestStyle').className ="todotab_inactive";		
		}
	}
</script>
<table border="0" width="100%" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
<table border="0" width="100%" cellspacing="0" cellpadding="0" class="TableBg">
	<tr>
		<td>
<% // tab starts %>
<div align="center" id="CR" style="display:block">
<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
   <tr>
     <td width="100%" colspan="1">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25" align="left">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" id="ClearanceRequestStyle" width="110" cellspacing="0" cellpadding="0" height=35 id="table1" >
				<tr>
					<td align="center" onClick="ChangeStyle('ClearanceRequest');loadClearanceReq()"  Style="Cursor:hand">Clearance<br>Requests</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" id="ReferalStyle" width="110" cellspacing="0" cellpadding="0"height=35    >
				<tr>
					<td align="center" onClick="ChangeStyle('UnderwritingReferal');loadUnderwriterRef()"  Style="Cursor:hand">Underwriting 
					Referrals</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" id="BindRequestStyle" width="110" cellspacing="0" cellpadding="0"  height=35 >
				<tr>
					<td align="center" onClick="ChangeStyle('BindRequest');loadBindReq()"  Style="Cursor:hand">Bind Requests</td>
				</tr>
			</table>
         </td>        
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" id="PreBindStyle" width="110" cellspacing="0" cellpadding="0"  height=35>
				<tr>
					<td align="center" onClick="ChangeStyle('PreBindSubjectivity');loadOpenPreBindSubj()"  Style="Cursor:hand">Pre-Bind<br>
					Subjectivities</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" id="PostBindStyle" width="110" cellspacing="0" cellpadding="0"  height=35>
				<tr>
					<td align="center" onClick="ChangeStyle('PostBindSubjectivity');loadOpenPostBoundSubj()"  Style="Cursor:hand">Open Post-Bound Subjectivities</td>
				</tr>
			</table>
         </td>
          <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" id="NotificationStyle" width="110" cellspacing="0" cellpadding="0"  height=35 >
				<tr>
					<td align="center" onClick="ChangeStyle('Notification');loadNotifications()"  Style="Cursor:hand" >Notification</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" id="RenewalStyle" width="110" cellspacing="0" cellpadding="0"  height=35 >
				<tr>
					<td align="center" onClick="ChangeStyle('Renewal');loadRenewal()"  Style="Cursor:hand" >Renewal</td>
				</tr>
			</table>
         </td>
       </tr>
     </table>
     </td>
    <%--  <td width="50%" valign="top" height="25">&nbsp;</td>--%>
   </tr>
   <tr> 
     <td width="100%" colspan="2" align="left">
  		 <table border="0" width="86%" cellspacing="0" cellpadding="0" class="todotab_yellowbox" height="350" >
			<tr>
				<td width="100%" valign="top" align="center"> <br>
					
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
								<select class="txtbox_Home" id="Period" onchange="ChangeContent();">
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
								<DIV id="TabArea" style="display:inline;" class="locformbox1 yui-skin-sam "></DIV>
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

				</td>
			</tr>
		</table>
     </td>
   </tr>
 </table>
</div>
<% // tab ends %>
		</td>
	</tr>
</table >	

		</td>
	</tr>
</table >	


</div>
<script type="text/javascript">
loadClearanceReq();
document.getElementById('ClearanceRequestStyle').className ="todotab_active";
document.getElementById('ReferalStyle').className = "todotab_inactive";
document.getElementById('BindRequestStyle').className = "todotab_inactive";
document.getElementById('PreBindStyle').className = "todotab_inactive";
document.getElementById('PostBindStyle').className = "todotab_inactive";
document.getElementById('NotificationStyle').className = "todotab_inactive";
document.getElementById('RenewalStyle').className = "todotab_inactive";
</script>
</body>
</html>
