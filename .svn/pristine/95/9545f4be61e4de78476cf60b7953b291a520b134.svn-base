<% String fileStatus = (String)request.getAttribute("FileRequestStatus"); %>

<script type="text/javascript">
	function fileRequestStatus() {
	
		var fileRequestStatus = "<%=fileStatus%>";
		
		if(fileRequestStatus == "false")
			alert("File has been removed for the following reasons \n\n* Suspected as malicious program \n* Unsupported file format"); 
	}
</script>
<body onload="fileRequestStatus()">

</body>