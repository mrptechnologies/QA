<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="transactionDetailId1" property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	
<dmshtml:get_INFCoverages_List nameInSession="arrCoverageDetails"  transactionDetailId="<%=Long.parseLong(""+transactionDetailId1)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	 <logic:present name="arrCoverageDetails">
   		<table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">
   			<tr><td colspan="6"><h3>Section Coverage Details</h3></td></tr>
 			  <tr>
			     <td>S.No</td>
			<!-- <td>Section Type Code</td>
			     <td>Sub Section Type Code</td>
			     <td>Section Data Updateable Action</td> -->
			     <td>Class Code 01</td>
			     <td>Class Code 04</td>
			 </tr>
   			<tr><td>&nbsp;</td></tr>
		   <%long iterator = 1; 
		   %>
			<bean:define id="arrCoveragesList" name="arrCoverageDetails" type="java.util.ArrayList"/> 
 			<logic:iterate name="arrCoveragesList" id="sectionCoverageDetail" type="com.dms.ejb.webservice.liu.dataloader.SectionCoverageDetail">
				<bean:define id="coverageDetailId" name="sectionCoverageDetail" property="sectionCoverageDetailId" />
				 <tr>  
			      <td><a href="javascript:void(0);" onClick="return editAjaxSubmissionSectionCoverageDetails(<%=""+coverageDetailId %>,<%=transactionDetailId1+"" %>);" ><%= iterator%></a></td>
			 <!-- <td align="center"><bean:write name ="sectionCoverageDetail" property="sectionTypeCode" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="subSectionTypeCode" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="sectionDataUpdatableAction" /></td> -->
			      <td align="left"><bean:write name ="sectionCoverageDetail" property="sectionDTLClassCode01" /></td>
			      <td align="left"><bean:write name ="sectionCoverageDetail" property="sectionDTLClassCode04" /></td>
			     </tr>
	     		<%iterator=iterator+1; %>     
		   </logic:iterate> 
  		 </table> 
	</logic:present>