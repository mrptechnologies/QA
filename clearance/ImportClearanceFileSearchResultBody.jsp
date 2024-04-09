<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindUploadClaimFiles.do?answer(Object::Claims::OwnerId)=<%=""+ownerId %>&answer(Object::Claims::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>


<bean:define id="intPageNum" property="answer(Object::Claims::PageNum)" name="UploadClaims" />

<html:form action="/FindUploadClaimFiles.do" >

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 



<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" colspan ="10" >Find Claim Files-Result</td></tr>
	<tr>	

	<tr>
		<td height="5px"></td>
	</tr>
	<logic:present name='ClaimsListSize' scope="request">
		<bean:define id="ClaimsListSize1" name="ClaimsListSize" />
		<tr><td><html:hidden property="answer(Object::Claims::TotalRec)" value="<%= ClaimsListSize1.toString()%>" /></td></tr>
		<tr><td class="FormLabels">No. of Claim Files Found:&nbsp;<%=ClaimsListSize1.toString()%></td></tr>
		<tr><td>&nbsp;</td></tr>
	</logic:present>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				<logic:present name ='searchresultClaimsDisplay' scope="request">
 					<tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
							
						<td align="right" class="links" colspan="4">
							<logic:present name="moreDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
							<td class="FormLabels" colspan="6"></td>
					</tr>
					<tr>
						<td class="sectionhead" width="5%">S.No</td>
						<td class="sectionhead" width="10%">File Name</td>
						<td class="sectionhead" width="10%">File Status</td>
						<td class="sectionhead" width="10%">Num Of Records Found</td>
						<td class="sectionhead" width="10%">Num Of Processed Records</td>
						<td class="sectionhead" width="10%">Num Of Failed Records</td>
						<td class="sectionhead" width="15%">Process Start Time</td>
						<td class="sectionhead" width="15%">Process End Time</td>
					</tr>	
	
						<% int count=0; %>
						
						<%
							String pageNum = (String)intPageNum.toString();	%>						
						<%							
						try{
								count = Integer.parseInt(pageNum);
								count = count*20;
							}catch(NumberFormatException nfe){
								count=0;
							}

						%>			
												
						<logic:iterate id="searchResultQMap"  name='searchresultClaimsDisplay' type="com.dms.ejb.data.QuestionHashMap">
												
						<tr>
						 	<td class="SearchResult">
						 		<%count++; %>
						 		<%=count%>   				
						 	</td>			 			  	   
						 	
							<td class="SearchResult" width="10%" >
								<a href="../DisplayAttachment.do?attachmentUrl=<%=searchResultQMap.getString("Object::Claims::FileLocation")%>&attachmentType=<%=searchResultQMap.getString("Object::Claims::FileType")%>&fileName=<%=searchResultQMap.getString("Object::Claims::FileName")%>&disposition=inline"  target="_new" >
							   		<%=searchResultQMap.getString("Object::Claims::FileName")%>
							   	</a>	
						   	</td>
						   						   
						   	<td class="SearchResult" width="10%" >
						   		<%=searchResultQMap.getString("Object::Claims::FileStatus")%>
						   	</td>
						   	
						   	<td class="SearchResult" width="10%" >
						   		<%=searchResultQMap.getString("Object::Claims::NoOfRecords")%>
						   	</td>
						   	
						   	<td class="SearchResult" width="10%" >
						   		<%=searchResultQMap.getString("Object::Claims::NoOfProcessedRecords")%>
						   	</td>
						   	
						   	<td class="SearchResult" width="10%" >
						   		<%=searchResultQMap.getString("Object::Claims::NoOfFailedRecords")%>
						   	</td>
						   	
						   	<td class="SearchResult" width="15%" >
						   		<%=searchResultQMap.getString("Object::Claims::ProcessDateBegin")%>
						   	</td>
						   	
						   	<td class="SearchResult" width="15%" >
						   		<%=searchResultQMap.getString("Object::Claims::ProcessDateEnd")%>
						   	</td>
						
						 </tr>					 
					
					</logic:iterate>
					<tr><td>&nbsp;</td></tr>	
					<tr>
						<td align="left" class="links" colspan="3">
							<logic:present name="prevDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
				
						<td align="right" class="links" colspan="4">
							<logic:present name="moreDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>							
				</logic:present>
			</table>
						 	
			<logic:notPresent name ='searchresultClaimsDisplay'>	
				<tr> 
					<td class="Error" colspan="3">
						No Claim File(s) Found
 					</td> 						
	 			</tr>	
			</logic:notPresent>
	
	<tr>
		<td height="8px"></td>
	</tr>
	<tr>
		<td>
			<bean:define id="FileStatus" name="UploadClaims" property="answer(Object::Claims::FileStatus)" /> 
			<bean:define id="ProcessDateBegin" name="UploadClaims" property="answer(Object::Claims::ProcessDateBegin)" /> 
			<bean:define id="ProcessDateEnd" name="UploadClaims" property="answer(Object::Claims::ProcessDateEnd)" /> 
					
			<html:hidden property="answer(Object::Claims::FileStatus)" value="<%=""+FileStatus %>"/> 
			<html:hidden property="answer(Object::Claims::ProcessDateBegin)" value="<%=""+ProcessDateBegin %>"/> 
			<html:hidden property="answer(Object::Claims::ProcessDateEnd)" value="<%=""+ProcessDateEnd %>"/> 
			<html:hidden property="answer(Object::Claims::OwnerId)" value="<%=""+ownerId %>"/> 
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
			<html:hidden property="answer(claimUploadActionType)" value="FindClaimsUploadFile" />
		</td>
	</tr>
	<tr>
			<td>
				<table>
					<tr>
						<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</html:form>




