
<% String AttachStatus = (String)request.getAttribute("AttachStatus"); %>
<% String ExtensionStatus = (String)request.getAttribute("ExtensionStatus"); %>
<% String AttachmentID = (String)request.getAttribute("AttachmentID"); %>
<% String ImportID = (String)request.getAttribute("ImportID"); %>

<% String failureReason = (String)request.getAttribute("FailureReason"); %>
<% String validationStatus = (String)request.getAttribute("ValidationStatus"); %>

<% String OverrideNeeded = (String)request.getAttribute("OverrideNeeded"); %>
<% String IsValidationPresent = ""; %>
<%java.util.ArrayList validationlist = (java.util.ArrayList)request.getAttribute("ImportValidation");%>

<% String message = "";%>
<%
if(validationlist!=null && validationlist.size()>0) {
	int validationlength = validationlist.size(); 
		IsValidationPresent = "true";
		message = "<table WIDTH='80%' ALIGN='center' BORDER='0' CELLSPACING='0' CELLPADDING='2' ><tr><td class='sectionhead'>No</td><td class='sectionhead'>Location Number</td><td class='sectionhead'>Validation Message</td></tr>";
		for(int i=0;i<validationlength;i++){
			 String validationlistvalue = "" ;
			 validationlistvalue = (String)validationlist.get(i);
			 String [] validationlistvalue1 = validationlistvalue.split("-");
			 message = message +"<tr> <td class='SearchResult'> "+ (i+1) +"</td><td class='SearchResult'>" +validationlistvalue1[0] + "</td><td class='SearchResult'>" + validationlistvalue1[1] + "</td></tr>";
		}
		 message = message + "</table><table WIDTH='80%' ALIGN='center' BORDER='0' CELLSPACING='0' CELLPADDING='2' ><tr><td>Please do make the changes to the fields displayed above, in the Import file and Upload again!!!</td></tr></table>" ;
		
		
	}else{
		IsValidationPresent = "false";
	}
	%>
<%java.util.ArrayList overrideLocationList = (java.util.ArrayList)request.getAttribute("overrideLocationList");%>
<% String locations = "";%>
<%
if(overrideLocationList!=null && overrideLocationList.size()>0) {
	int numberOfLocations = overrideLocationList.size(); 
		
		locations = "<table WIDTH='95%' ALIGN='center' BORDER='0' CELLSPACING='0' CELLPADDING='2' ><tr><td class='sectionhead'>Location Numbers</td><td class='sectionhead'>Location Name</td></tr>";
		for(int i=0;i<numberOfLocations;i++){
			 String overrideLocationListValue = "" ;
			 overrideLocationListValue = (String)overrideLocationList.get(i);
			  String [] overrideLocationListValue1 = overrideLocationListValue.split("-");
			   locations = locations +"</td><td class='SearchResult'>" +overrideLocationListValue1[0] + "</td><td class='SearchResult'>" + overrideLocationListValue1[1] + "</td></tr>";
		}
		 locations = locations + "</table>" ;
		
		
	}
	%>
	
<script type="text/JavaScript" SRC="../Scripts/JScripts/ImportLocationRisk.js" ></script>
<form name="Succespage" id="SuccessFormID"><head>
</head>
<body onload="importAttachmentStatus('<%=""+AttachmentID %>','<%=validationlist%>','<%=""+AttachStatus %>','<%=""+ExtensionStatus%>')">
<input type="text" name="answer(Object::Attachment::ImportAttachmentID)" id="importAttachmentidvaluehidden" value="<%=""+AttachmentID%>">
<input type="text" name="answer(Object::Import::ImportID)" id="attachmentImportId" value="<%=""+ImportID%>">
<input type="text" name="answer(Object::Attachment::Validation)" id="validationimport" value="<%=message%>">
<input type="text" name="answer(Object::Import::IsValidationPresent)" id="IsValidationPresent" value="<%=""+IsValidationPresent%>">
<input type="text" name="answer(Object::Import::FailureReason)" id="FailureReason" value="<%=""+failureReason%>">
<input type="text" name="answer(Object::Import::ValidationStatus)" id="ValidationStatus" value="<%=""+validationStatus%>">
<input type="text" name="answer(Object::Import::OverrideNeeded)" id="OverrideNeeded" value="<%=""+OverrideNeeded%>">
<input type="text" name="answer(Object::Import::OverrideLocation)" id="OverrideLocationList" value="<%=locations%>">

uploaded successfull	
</body>
</form>