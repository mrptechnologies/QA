<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="intPageNum" property="answer(Object::Notification::Email::PageNum)" name="PrefilledEmailAction" />
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../ListOfEmail1.do?answer(ownerId)=<%=""+ownerId %>&answer(Object::Notification::Email::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>



<html:form action="/ListOfEmail.do" >

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" colspan ="10" >Find Email-Results</td></tr>
	<tr>	

	<tr>
		<td height="5px"></td>
	</tr>
	<logic:present name='EmailListSize' scope="request">
		<bean:define id="EmailListSize1" name="EmailListSize" />
		<tr><td><html:hidden property="answer(Object::Notification::Email::TotalRec)" value="<%= EmailListSize1.toString()%>" /></td></tr>
		<tr><td class="FormLabels">No of Emails Found:&nbsp;<%=EmailListSize1.toString()%></td></tr>
		<tr><td>&nbsp;</td></tr>
	</logic:present>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				<logic:present name ='searchresultEmailDisplay' scope="request">
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
						<td class="sectionhead" width="15%">Employer Group Name</td>
						<td class="sectionhead" width="10%">Group Number</td>
						<td class="sectionhead" width="20%">To Address</td>
						<td class="sectionhead" width="25%">Subject</td>
						<!-- td class="sectionhead" width="10%">Quote #</td -->
						<!-- td class="sectionhead" width="10%">Quote Type</td -->
						<td class="sectionhead" width="10%">Send Status</td>
						<td class="sectionhead" width="20%">Sent Date</td>
					</tr>	
	
							<!-- logic:present name='searchresultEmailDisplay' scope="request" -->
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
												
						<logic:iterate id="searchResultQMap"  name='searchresultEmailDisplay' type="com.dms.ejb.data.QuestionHashMap">
						<dmshtml:GetCustomerIdByQuoteId  nameInSession='CustomerId' quoteId='<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectId")%>' quoteVerId='<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectVerId")%>' ownerId='<%=""+ownerId %>'  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<% String customerId=""+request.getAttribute("customerId");%>

						<tr>
						 	<td class="SearchResult">
						 		<%count++; %>
						 		<%=count%>   				
						 	</td>			 			  	   
	
						    <td class="SearchResult" width="10%" id="CustomerName">
						    	<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=""+searchResultQMap.getString("Object::Notification::Email::CustomerId")%>" >
						   			<%=searchResultQMap.getString("Object::Notification::Email::CustomerName")%> 
						   		</a>	
						    </td>
						    
						    <td class="SearchResult" width="10%" id="CustomerNum">
						    	<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=""+searchResultQMap.getString("Object::Notification::Email::CustomerId")%>" >
						   			<%=searchResultQMap.getString("Object::Notification::Email::CustomerNumber")%> 
						   		</a>	
						    </td>
						    
						    <td class="SearchResult" style='width:200;text-wrap;word-wrap: break-word;' width="20%" id="ToAddress">
						   			<%=searchResultQMap.getString("Object::Notification::Email::ToAddress")%> 
						    </td>
						    
						   	<td class="SearchResult" width="25%" id="Subject">
						   		<a href="../EmailReSendEmployerNew.do?answer(Object::Notification::Email::FromAddress)=<%=""+searchResultQMap.getString("Object::Notification::Email::FromAddress")%>
										&answer(Object::Notification::Email::ToAddress)=<%=""+searchResultQMap.getString("Object::Notification::Email::ToAddress")%>
    									&answer(Object::Notification::Email::ObjectId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectId")%>
										&answer(Object::Notification::Email::ObjectVerId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectVerId")%>
										&answer(Object::Notification::Email::ObjectType)=<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectType")%>  
										&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>
										&answer(Object::Notification::Email::NotificationId)=<%=""+searchResultQMap.getString("Object::Notification::Email::NotificationId")%>
										&answer(Object::Notification::Email::QuoteNumber)=<%=""+searchResultQMap.getString("Object::Notification::Email::QuoteNum")%>
										&answer(Object::Notification::Email::QuoteSubNumber)=<%=""+searchResultQMap.getString("Object::Notification::Email::QuoteSubNum")%>
										&answer(Object::Notification::Email::PolicyNumber)=<%=""+searchResultQMap.getString("Object::Notification::Email::PolicyNumber")%>
										&answer(Object::Notification::Email::QuoteStatus)=<%=""+searchResultQMap.getString("Object::Notification::Email::QuoteStatus")%>
										&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>" title="Re-Send" onClick="return EmailPopup(this, 'Email');" />
										<%=searchResultQMap.getString("Object::Notification::Email::EmailSubject")%> </a>  
						   	</td>
						   <%=""+searchResultQMap.getString("Object::Notification::Email::ParentPolicyVerId")%>
						   	<%--td class="SearchResult" width="10%" id="ObjectId">
						   		<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectId")%>&answer(parentQuoteId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectId")%>&answer(Object::Quote::QuoteVerId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ObjectVerId")%>&answer(policyNumber)=<%=""+searchResultQMap.getString("Object::Notification::Email::PolicyNumber")%>&answer(Object::Policy::ParentPolicyId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ParentPolicyId")%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+searchResultQMap.getString("Object::Notification::Email::ParentPolicyVerId")%>">
								
					   	 		<%String quoteNum = searchResultQMap.getString("Object::Notification::Email::QuoteNum"); %>
		   		  				<%try{
				   			 		 if(Integer.parseInt(""+searchResultQMap.getString("Object::Notification::Email::QuoteSubNum"))>=1){
		   							     quoteNum = quoteNum + "-" + searchResultQMap.getString("Object::Notification::Email::QuoteSubNum");			   			  
	                			  		  }
		   		 		 	 		}catch(NumberFormatException nfe){}
						  		%>
						 	    <%=""+quoteNum %>
						     </a>
						   	</td--%>

						   	<%--td class="SearchResult" width="10%" id="ObjectType">
						   		<%=searchResultQMap.getString("Object::Notification::Email::ObjectType")%>   
						   	</td--%>
						   	
						   	
						   	<td class="SearchResult" width="10%" id="SendStatus">
						   		<%=searchResultQMap.getString("Object::Notification::Email::SendStatus")%>   
						   	</td>

						   	<td class="SearchResult" width="20%" >
						   		<%=searchResultQMap.getString("Object::Notification::Email::SentDateEnd")%>   
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
						 	
			<logic:notPresent name ='searchresultEmailDisplay'>	
				<tr> 
					<td class="Error" colspan="3">
						No Email(s) Found
 					</td> 						
	 			</tr>	
			</logic:notPresent>
	
	<tr>
		<td height="8px"></td>
	</tr>
	<tr>
		<td>
			<bean:define id="FromAddress" name="PrefilledEmailAction" property="answer(Object::Notification::Email::FromAddress)" /> 
			<bean:define id="ToAddress" name="PrefilledEmailAction" property="answer(Object::Notification::Email::ToAddress)" /> 
			<bean:define id="CcAddress" name="PrefilledEmailAction" property="answer(Object::Notification::Email::CcAddress)" /> 				
			<bean:define id="BccAddress" name="PrefilledEmailAction" property="answer(Object::Notification::Email::BccAddress)" /> 
			<bean:define id="Subject" name="PrefilledEmailAction" property="answer(Object::Notification::Email::EmailSubject)" /> 
			<bean:define id="Message" name="PrefilledEmailAction" property="answer(Object::Notification::Email::EmailMessage)" /> 
			<bean:define id="SendStatus" name="PrefilledEmailAction" property="answer(Object::Notification::Email::SendStatus)" /> 
			<bean:define id="SendStartDate" name="PrefilledEmailAction" property="answer(Object::Notification::Email::SentDateBegin)" /> 
			<bean:define id="SendEndDate" name="PrefilledEmailAction" property="answer(Object::Notification::Email::SentDateEnd)" /> 
					
			<html:hidden property="answer(Object::Notification::Email::FromAddress)" value="<%=""+FromAddress %>" /> 
			<html:hidden property="answer(Object::Notification::Email::ToAddress)" value="<%=""+ToAddress %>"/> 
			<html:hidden property="answer(Object::Notification::Email::CcAddress)" value="<%=""+CcAddress %>"/> 				
			<html:hidden property="answer(Object::Notification::Email::BccAddress)" value="<%=""+BccAddress %>"/> 
			<html:hidden property="answer(Object::Notification::Email::EmailSubject)" value="<%=""+Subject %>"/> 
			<html:hidden property="answer(Object::Notification::Email::EmailMessage)" value="<%=""+Message %>"/> 
			<html:hidden property="answer(Object::Notification::Email::SendStatus)" value="<%=""+SendStatus %>"/> 
			<html:hidden property="answer(Object::Notification::Email::SentDateBegin)" value="<%=""+SendStartDate %>"/> 
			<html:hidden property="answer(Object::Notification::Email::SentDateEnd)" value="<%=""+SendEndDate %>"/> 
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
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




