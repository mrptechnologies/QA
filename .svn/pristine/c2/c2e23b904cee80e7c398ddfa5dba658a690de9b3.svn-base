<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="transactionDetailId" property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions"/>
<bean:define id="ownerId" property="answer(Object::Transaction::Equals::OwnerId)" name="FindOutBoundTransactions" />						
<dmshtml:get_name_involvement_detail nameInSession="nameInvolvementMapList" transactionDetailId="<%=Long.parseLong(""+transactionDetailId)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name='nameInvolvementMapList' scope="request">
		 <table width="100%" align="center">
			<tr><td colspan="7"><h3>Name Involvement</h3></td></tr>
			<tr>
			     <td>S.No</td>
				 <td>Name Involvement Action</td>
				 <td>Vendor Name Reference</td>
				 <td>Name Type</td>
				 <td>Legal Name</td>
				 <td>Name Usage Type Code</td>
				 <td>Name Involvement Type</td>
			</tr>
			<%long iterator = 1; 
			%>
		
			<logic:iterate name="nameInvolvementMapList" id="nameInvolvementMapList">
			<bean:define id="additionalInsuredId1" name="nameInvolvementMapList" property="additionalInsuredId" />
			<%String additionalInsuredId = ""+additionalInsuredId1;
			 %>
				<tr>
	  			  <td><a href="javascript:void(0);"  onClick="return editAjaxNameInvolvementDetails(<%=""+additionalInsuredId %>);" ><%= iterator%></a></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameInvolvementAction" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="vendorRef" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameType" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="legalName" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameUsageTypeCode" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameInvolvementType" /></td>
				 </tr>
				 <%iterator=iterator+1; %>
			</logic:iterate>	
		  </table>	
	    </logic:present>