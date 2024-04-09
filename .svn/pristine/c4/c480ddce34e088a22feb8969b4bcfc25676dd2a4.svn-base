<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="transactionDetailId" property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions"/>
<bean:define id="ownerId" property="answer(Object::Transaction::Equals::OwnerId)" name="FindOutBoundTransactions" />						

 <dmshtml:get_INF_Location_Detail nameInSession="INFlocationList" transactionDetailId="<%=Long.parseLong(""+transactionDetailId)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
   <logic:present name="INFlocationList">
     	<table width="100%" align="center">
			<tr><td colspan="15"><h3>Location Details</h3></td></tr>
			<tr>
			     <td>S.No</td>
				 <td>Unit Action</td>
				 <td>Unit Address Identifier</td>
				 <td>Unit Type</td>
				 <td>Unit Code</td>
			</tr>
			<%long iterator = 1; 
			%>
	   <bean:define id="INFlocationList" name="INFlocationList" type="java.util.ArrayList"/> 
       <logic:iterate name="INFlocationList" id="locationDetail" type="com.dms.ejb.webservice.liu.dataloader.INFLocationDetail">
           <bean:define id="locationDetailId1" name="locationDetail" property="locationDetailId"/>		
 		    
	    <tr>  
            <td><a href="javascript:void(0);" onClick="return editAjaxINFLocationDetails(<%=""+locationDetailId1 %>);" ><%= iterator%></a></td>
	        <td><bean:write  name="locationDetail" property="unitAction"/></td>
	        <td><bean:write  name="locationDetail" property="unitAddressIdentifier"/></td>
	        <td><bean:write  name="locationDetail" property="unitType"/></td>
	        <td><bean:write  name="locationDetail" property="productUnitCode"/></td>
	     </tr>
	     
	   </logic:iterate>
	  </table>
   </logic:present>