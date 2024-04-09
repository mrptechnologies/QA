<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="dbname" property="answer(dbname)" name="LoginPage" scope="session"/>

 <bean:define id="transactionDetailId" name="FindGetDataFeedXml" property="answer(Object::TakeUp::TransactionDetailId)"/>	
 <html:hidden property="answer(Object::TakeUp::TransactionDetailId)" value="<%=transactionDetailId+"" %>"/>

<dmshtml:get_INFCoverages_List nameInSession="arrCoverageDetails"  transactionDetailId="<%=Long.parseLong(transactionDetailId+"")%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%= dbname.toString() %>"/>

<logic:present name="arrCoverageDetails">
   <table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">
   <tr><td colspan="10"><h3>Section Coverage Details</h3></td></tr>
   <tr>
     <td>S.No</td>
     <td>Type Code</td>
     <td>Limit Amount</td>
     <td>Deductible1</td>
     <td>Deductible2</td>
     <td>Premium</td>      
     <td>Annualised Premium</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <%long iterator = 1; 
   %>
   
 <bean:define id="arrCoveragesList" name="arrCoverageDetails" type="java.util.ArrayList"/> 
 
 <logic:iterate name="arrCoveragesList" id="sectionCoverageDetail" type="com.dms.ejb.webservice.liu.dataloader.SectionCoverageDetail">
 
<bean:define id="coverageDetailId" name="sectionCoverageDetail" property="sectionCoverageDetailId" />

    <tr>  
        
      <td><a href="javascript:void(0);" onClick="return editCoverageDetails(<%=""+coverageDetailId %>,<%=transactionDetailId+"" %>);" ><%= iterator%></a></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coverageTypeCode" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coverageLimitAmount" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coveargeDeductible01" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coveargeDeductible02" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coveragePremium" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coverageAnnualisedPremium" /></td> 
     </tr>
     <%iterator=iterator+1; %>     
     
   </logic:iterate> 
   </table> 


</logic:present>