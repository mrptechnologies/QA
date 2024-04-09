<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<bean:define id="objectType" name="ChangeUser"  property="answer(Object::UserDetail::PrimaryObjectType)" />
<bean:define id="primaryObjectId" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" />
	<bean:define id="primaryObjectType" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" />
<%
		long entityId1 = 0;
		String attachmentType1 = "";	
		
		if(request.getParameter("entityId")!=null){
			entityId1 = Long.parseLong(""+request.getParameter("entityId"));			
		}else{
			entityId1 =Long.parseLong(""+primaryObjectId);
		}
		if(request.getParameter("objectType")!=null){
			attachmentType1 = ""+request.getParameter("objectType");			
		}else{		
			attachmentType1 = ""+primaryObjectType;
		}
	%>	
	<%String path=""; %>
	<%String attachmentURL = "";%>
	<%String attachmentID = "";%>	
	<%String fileName = "";%>	
	<dmshtml:GetAttachedList DBName='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' nameInSession="arrOfFile" objectId='<%=Long.parseLong(""+entityId1) %>' objectType='<%=attachmentType1%>' ownerId='<%=Long.parseLong(""+ownerId) %>' />
		<logic:present name="arrOfFile">
			<%
				java.util.ArrayList arrOfAttachement = (java.util.ArrayList)request.getAttribute("arrOfFile");
				com.dms.ejb.data.QuestionHashMap attachementMap = null ;
								
				attachementMap = (com.dms.ejb.data.QuestionHashMap)arrOfAttachement.get(0);
				attachmentURL = attachementMap.getString("Object::Attachment::AttachmentUrl");	
				attachmentID=attachementMap.getString("Object::Attachment::AttachmentId");
				fileName=attachementMap.getString("Object::Attachment::FileyName");
			%>
		</logic:present>
		
	 <dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="DOC_ROOT_URL" />
           
           <logic:present name="paramValue">
               <logic:equal value="/Liberty" name="paramValue">
               <bean:define id="imgPath" name="paramValue" type="java.lang.String" />
               
             <% path=imgPath;%>
               </logic:equal>
           </logic:present>
   
	
	
	    
		<IMG SRC="<%=".."+path+attachmentURL+"" %>"  ALT="Upload Signature Image Here"  width="212px" height="66px" align="left">

<% String AttachStatus = (String)request.getAttribute("AttachStatus"); %>
<% String ExtensionStatus = (String)request.getAttribute("ExtensionStatus"); %>

<script type="text/javascript">
	function attachmentStatus() {
	
		var attachstatus = "<%=AttachStatus%>";
		var extstatus = "<%=ExtensionStatus%>";
		
		if(extstatus == "true" && attachstatus == "null")
			alert("The File type is Restricted to attach! Try a valid Document file"); 
	}
</script>
</head>
<body onload="attachmentStatus()">

</body>