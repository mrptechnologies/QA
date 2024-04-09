<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<html:form action="/UpdateClearance.do">
<div class="formpage01">


<!-- Submission Header Ends-->					
<!-- Quote Header Starts here-->		
					
						
<!-- Quote Header Ends-->		
					
<logic:present name="insuredDetail">


													
 <table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">				
  

	
	<tr> 
	  <td  colspan="2"><div class="formhead"><h2 class="left">INSURED MASTER RECORD</h2></div></td>
	</tr>
							
	 <tr>
		<td class="Links" align="left" colspan="2">
			
		</td>																				
	 </tr>		
 	<tr>
	    <td colspan="2">&nbsp;</td>																				
	</tr>								
	<tr>
      <td class="field"  width="40%">Vendor Name Reference</td>
	  <td>
     	&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="insuredDetail" property="vendorNameRef" />
      <td>														
	</tr>

	<tr>
		<td class="field"  width="40%">Assured Name Code</td>
		<td>
 		  &nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="insuredDetail" property="assuredNameCode" />
		<td>														
	</tr>
	<tr>
		<td class="field"  width="40%">Assured Type</td>
		<td>
   		 &nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="insuredDetail" property="externalInsuredType" />
		<td>														
	</tr>
    <tr>					
		<td class="field"  width="40%">Assured Action</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="insuredDetail" property="assuredAction" />
		</td>														
	</tr>
	<tr>							
		<td class="field"  width="40%">Occupation Code</td>
		<td>
 		 &nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="insuredDetail" property="occupationCode" />
		<td>														
	</tr>
	<tr>							
	<td class="field"  width="40%">Legal Name1</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="insuredDetail" property="externalInsuredLegalName1" />
		</td>														
    </tr>
	<tr>							
	  <td class="field"  width="40%">Legal Name2</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredLegalName2" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Address</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredLine1" />
	   <bean:write name="insuredDetail" property="externalInsuredLine2" />
	   <bean:write name="insuredDetail" property="externalInsuredLine3" />			
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">City</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredCity" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">State</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredState" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Zip</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredPostCode" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Country</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredCountry" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Municipal Area Code</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="municipalAreaCode" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">State Province Code</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="stateProvinceCode" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Country Code</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="countryCode" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Address Type Flag</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="addressTypeFlag" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Telephone Number</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="externalInsuredTelNumber" />		
	  </td>														
	</tr>
	
	<tr>							
	  <td class="field"  width="40%">Active</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="insuredDetail" property="activeFlag" />		
	  </td>														
	</tr>				
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>							
	  <td class="field"  width="40%"><html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>	
		
</table>
</logic:present>
</div>
</html:form>
