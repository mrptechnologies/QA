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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<bean:define id="intPageNum" property="answer(Object::Payment::PageNum)" name="payment" scope="request"/>
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindPaymentList.do?answer(ownerId)=<%=""+ownerId %>&answer(Object::Payment::PageNum)="+nextOrPre;
	     document.forms[0].method="post";
	    document.forms[0].submit();
	}
</SCRIPT>

<html:form action="/FindPaymentList.do" onsubmit="return navigate('<%intPageNum%>')"  method="post" >
<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" colspan ="10" >Payment Search Results</td></tr>
	<tr>	
    
	<tr>
		<td height="5px"></td>
	</tr>
	<logic:present name='PaymentListSize' scope="request">
		<bean:define id="PaymentListSize1" name="PaymentListSize" />
          <tr><td><html:hidden property="answer(Object::Payment::TotalRec)" value="<%= PaymentListSize1.toString()%>" /></td></tr>
		<tr><td class="FormLabels">No of Payment Found:&nbsp;<%=PaymentListSize1.toString()%></td></tr>
		<tr><td>&nbsp;</td></tr>
	</logic:present>
	
     <tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				<logic:present name ='paymentList' scope="request">
				
				
                
                
 					<tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
							
						<td align="right" class="links" colspan="4">
							<logic:present name="nextDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
							<td class="FormLabels" colspan="9"></td>
					</tr>
					<tr>
						<td class="sectionhead" width="1%" align="center">S.No</td>
						<td class="sectionhead" width="7%" align="center">Quote #</td>
						<td class="sectionhead" width="10%" align="center">Policy #</td>
						<td class="sectionhead" width="10%" align="center">Payment Type</td>
						<td class="sectionhead" width="16%" align="center">Transaction Message </td>
						<td class="sectionhead" width="12%" align="center">Approval Code </td>
						<td class="sectionhead" width="7%" align="center">Amount</td>
						<td class="sectionhead" width="7%" align="center">Payed By</td>
						<td class="sectionhead" width="20%" align="center">Date</td>
						
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
                
                	<logic:iterate  id='paymentList' name='paymentList'>
                	<bean:define id="quoteNum" property="Object::Payment::QuoteNum" name="paymentList" /> 
				<bean:define id="quoteSubNum" property="Object::Payment::QuoteSubNum" name="paymentList" /> 
				<bean:define id="QuoteId" property="Object::Payment::QuoteId" name="paymentList" /> 
                <bean:define id="QuoteVerId" property="Object::Payment::QuoteVerId" name="paymentList" />
                <%String quoteId1 = ""+QuoteId;
                  String quoteVerId1 = ""+QuoteVerId;
                %>
                <dmshtml:GetCustomerIdByQuoteId  nameInSession='CustomerId' quoteId='<%=""+quoteId1%>' quoteVerId='<%=""+quoteVerId1%>' ownerId='<%=""+ownerId %>'  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<% String customerId=""+request.getAttribute("customerId");%> 
                		<tr>
						 	<td class="SearchResult" width="1%" align="right">
						 		<%count++; %>
						 		<%=count%>   				
						 	</td>	
						 <td class="SearchResult" width="7%" align="right">
						 <a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Quote::QuoteVerId)=<%=""+quoteVerId1%>&answer(QuoteId)=<%=""+quoteId1%>
							   	&answer(parentQuoteId)=<%=""+quoteId1%>">
							   	
						   	 		<%String quoteNum1 = ""+quoteNum ;%>
			   		  				<%try{
					   			 		 if(Integer.parseInt(""+quoteSubNum)>=1){
			   							     quoteNum1 = quoteNum1 + "-" + quoteSubNum;			   			  
	                 			  		  }
			   		 		 	 		}catch(NumberFormatException nfe){}
							  		%>
							 	    <%=""+quoteNum1 %>
							     </a>
							     
						 </td>	
						 <td class="SearchResult" width="8%" align="left">
						 <bean:define id="policyNumber" property="Object::Payment::PolicyNum" name="paymentList" />
						 
						 <a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">
						<%=""+policyNumber %>
						</a>
						 </td>
						 <td class="SearchResult" width="14%" align="left" >
						 <bean:write name='paymentList' property='Object::Payment::PaymentMethod'/>
						 </td>	
                		 <td class="SearchResult" width="24%" align="left">
                		 
						 <bean:define id="ResponseMessage" name='paymentList' property='Object::Payment::PaymentResponseMessage'/>
						 <%String resMessage = ""+ResponseMessage;
						   int index =  resMessage.indexOf(")")+1;
						   
						   
						 %>
						 <%if(index!=-1){
							 String resMessage1 = resMessage.substring(index);%>
							<%=""+resMessage1%>
						<% }%>
						 
						 </td>	
						 	 
						 <td class="SearchResult" width="10%" align="left">
						 <bean:define id="appCode" name='paymentList' property='Object::Payment::ApprovalCode'/>	
						 <%=""+appCode%>
						 
						 </td>
                         <td class="SearchResult" width="7%" align="right">
						 $<bean:write name='paymentList' property='Object::Payment::Amount'/>
						 </td>
						 <td class="SearchResult" width="7%" align="center">
						 <bean:write name='paymentList' property='Object::Payment::CreatedBy'/>
						 </td>
						 <td class="SearchResult" width="20%" align="left">
						 <bean:write name='paymentList' property='Object::Payment::TransactionTime'/>
						 </td>
                </logic:iterate>
                </logic:present>
                <tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
							
						<td align="right" class="links" colspan="4">
							<logic:present name="nextDocument"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+intPageNum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
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
                 <bean:define id="StartDate" name="payment" property="answer(Object::Payment::StartDate)" scope ="request"/>
                 <bean:define id="EndDate" name="payment" property="answer(Object::Payment::EndDate)" scope ="request"/>
                 <bean:define id="paymentMethod" name="payment" property="answer(Object::Payment::PaymentMethod)" scope ="request" />
                 <bean:define id="TransactionState" name="payment" property="answer(Object::Payment::TransactionState)" scope ="request" />                
                 <bean:define id="ObjectId" name="payment" property="answer(Object::Payment::ObjectId)" scope ="request" />
                 
                 <html:hidden property="answer(Object::Payment::TransactionState)" value="<%=""+TransactionState.toString()%>" styleId="transactionState" />
                 <html:hidden property="answer(Object::Payment::StartDate)" value="<%=""+StartDate.toString()%>" styleId="inpCreatedDateBegin" />
                 <html:hidden property="answer(Object::Payment::EndDate)" value="<%=""+EndDate.toString()%>" styleId="inpCreatedDateEnd" />                
                 <html:hidden property="answer(Object::Payment::PaymentMethod)" value="<%=""+paymentMethod.toString()%>" styleId="paymentmethod" />
                 <html:hidden property="answer(Object::Payment::ObjectId)" value="<%=""+ObjectId.toString()%>" styleId="paymentmethod" />
                 <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />	
                </table>
                </td>
                </tr>
                </table>
</html:form>
