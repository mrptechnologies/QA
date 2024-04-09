
<% String AttachStatus = (String)request.getAttribute("AttachStatus"); %>
<% String ExtensionStatus = (String)request.getAttribute("ExtensionStatus"); %>

<script type="text/javascript">
	function attachmentStatus() {
	
		var attachstatus = "<%=AttachStatus%>";
		var extstatus = "<%=ExtensionStatus%>";
		
		if(extstatus == "false" && attachstatus == "null")
			alert("The File type is Restricted to attach! Try a valid Document file"); 
	}
</script>
</head>
<body onload="attachmentStatus()">

uploaded successfull	

</body>