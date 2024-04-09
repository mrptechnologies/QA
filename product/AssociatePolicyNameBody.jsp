<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="productId" property="answer(Object::Product::ProductId)" name="ListPolicyNumber" />
<bean:define id="productVerId" property="answer(Object::ProductVer::ProductVerId)" name="ListPolicyNumber" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<script type="text/javascript">
	function associateConfirm(){
			var ans = window.confirm("Are you sure you need to Associate");
			
			if(ans){
			     return true;
			 }else{
			 	 return false;
			 }	 	    
			
	}
</script>

<html:form action="/AssociatePolicyNumber.do" onsubmit="return associateConfirm()" >

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	
		 
		 
    	    <tr><td>&nbsp;</td></tr> 

		  <tr>
		  		<td class="NewSectionHead" align="center" colspan="9">ASSOCIATE POLICY NUMBER</td>
    	  </tr>
    	  
    	  <tr><td>&nbsp;</td></tr> 
    	  <tr>
		  <td class="Error" colspan="3">
		 	&nbsp;
		 	<logic:present name="message">
				<%=""+request.getAttribute("message") %> 
			</logic:present>
			
			<logic:present name="AddedMessage">
				<%=""+request.getAttribute("AddedMessage") %> 
			</logic:present>
		  </td>
		 </tr>
		 
    	   
    	    <tr><td>&nbsp;</td></tr> 
    	   <tr>
		  <td class="links" colspan="3" >
		  	
    	  	<a href="../product/savePolicyNumber.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>">Create New Policy Number </a>
    	  </td>
    	  </tr>
    	   
    	  <tr><td>&nbsp;</td></tr> 
    	      	  
    	  <tr>
    	    <td class="sectionheadLink" align="left" width="3%">SNo</td>
    	    <td class="sectionheadLink" align="center" width="12%" >Policy Number Prefix</td>
    	  	<td class="sectionheadLink" align="left" width="10%">Policy Number Suffix</td>
    	  	<td class="sectionheadLink" align="left" width="10%">Policy Beginning Number</td>
       	  	<td class="sectionheadLink" align="left" width="10%">Policy End Number</td>
       	  	<td class="sectionheadLink" align="left" width="9%">Last Number Used</td>
       	  	<td class="sectionheadLink" align="left" width="1%">Active</td>
       	  	<td class="sectionheadLink" align="center" width="10%">Name</td>
       	  	<td class="sectionheadLink" align="center" width="10%">Description</td>
       	  	<td class="sectionheadLink" align="right" width="5%">Select</td>
       	  </tr>	
       	  
       	  <tr><td>&nbsp;</td></tr>
       	  
       	  <%int count = 0; %>
       	  
		 <logic:present name="PolicyNumberDetailList" scope="request">
		 
		  	 <logic:iterate id="PolicyNumberDetailList" name="PolicyNumberDetailList">
		  		 <%++count; %>
		  		 
		  		 <% 		
					String styleClass="";
					if(count%2==0){
						styleClass = "altdisply";
					}
					else{
						styleClass = "SearchResult";	
					}
				%>
		  		 
		  		 <tr>
	 				 <td width="3%" align="center" class=<%= styleClass %> ><%=""+count%></td>
	           		<td width="12%" align="left" class=<%= styleClass %> ><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumPreFix"/></td>   
	           		<td width="10%" align="left" class=<%= styleClass %> ><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumSuffix"/></td>   
	           	    <td width="10%" align="right" class=<%= styleClass %> ><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyBegNum"/></td> 
	           	    <td width="10%" align="right" class=<%= styleClass %> ><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyEndNum"/></td>     
					<td width="9%" align="right" class=<%= styleClass %> ><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumLastUsed"/></td>   
					<td width="1%" align="center" class=<%= styleClass %> >
					<bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumActive" />
					<bean:define id="policyNumActive" name="PolicyNumberDetailList" property="Object::Product::PolicyNumActive" /></td>
					
					<td class="<%= styleClass %>" align="right" width="10%"><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumName"/></td>
					
					<td width="9%" align="right" class=<%= styleClass %> ><bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumDesp"/></td>   
					
				
					<td width="5%" align="center" class=<%= styleClass %> >
					 <% String isActive = ""+policyNumActive; 
					    if(isActive.equals("Y")){%>
							<input type="radio" name="answer(Object::Product::PolicyNumMasterIds)" value='<bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumMasterId"/>' />	
					 <%}else{ %>	
					 		<input type="radio" name="answer(Object::Product::PolicyNumMasterIds)"  value='<bean:write name="PolicyNumberDetailList" property="Object::Product::PolicyNumMasterId"/>' disabled="disabled" />	
					 <%} %>			
						
						
					</td>
				</tr>	    
		 	</logic:iterate>
						
 	 	</logic:present>
 	 	</table>
 	 	
 	 	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	 	<tr><td>&nbsp;</td></tr>
 	 	<tr>
 	 	<td align="right">
 	 	
 	 		<html:submit property="answer(Associate)" value="Associate"  styleId="sbttn"/>
 	 		
 	 	</td>
 	 	</tr>
 	 	</table>
  
  	<html:hidden property="answer(Object::Product::ProductId)" value="<%=""+productId %>"/>												
	<html:hidden property="answer(Object::ProductVer::ProductVerId)" value="<%=""+productVerId %>"/>
	<html:hidden property="answer(Object::Product::userName)" value="<%=""+userId %>"/>
	<html:hidden property="answer(Object::Product::ownerId)" value="<%=""+ownerId %>"/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
	
			 	

