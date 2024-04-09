<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>

<logic:present name='nameInvolvementDisplay'>
  <div class="content"> 
	<div class="formpage01">
	  <html:form action="/UpdateNameInvolvementDetails"  styleId="nameInvolvementForm">
		<div class="formheadnew"><h2 class="left"> Name Involvement Details</h2></div>
		  <div>&nbsp;</div>
			<table width= "100%">
				 <tr>
					 <td class="field" width="30%" align="right">Name Involvement Action :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="nameInvolvementActionId" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::Action"/>
					     &nbsp;&nbsp;&nbsp;&nbsp;<bean:write  name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::Action"/>
				  		 <html:hidden property="answer(Object::Transaction::NameInvolvement::Action)" name="nameInvolvementDisplay" value = "<%=""+nameInvolvementActionId%>" />
				 	 </td>
			 	 </tr>
				 <tr>
					 <td class="field" width="30%" align="right">Name Type :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
						 <bean:define id="nameTypeId" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::NameType"/>
						 &nbsp;&nbsp;&nbsp;&nbsp;<bean:write  name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::NameType"/>
				  		 <html:hidden property="answer(Object::Transaction::NameInvolvement::NameType)" name="nameInvolvementDisplay" value = "<%=""+nameTypeId%>" />
				 	 </td>
			 	 </tr>
			 	 <tr>
					 <td class="field" width="30%" align="right">LegalName :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					 	 <bean:define id="legalNameId" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::LegalName"/>
				  		 <html:text property="answer(Object::Transaction::NameInvolvement::LegalName)" name="nameInvolvementDisplay" value = "<%=""+legalNameId%>" />
				 	 </td>
			 	 </tr>
			 	 <tr>
					 <td class="field" width="30%" align="right">LegalName2 :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					 	 <bean:define id="legalName2Id" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::LegalName2"/>
				  		 <html:text property="answer(Object::Transaction::NameInvolvement::LegalName2)" name="nameInvolvementDisplay" value = "<%=""+legalName2Id%>" />
				 	 </td>
			 	 </tr>
			 	 <tr>
					 <td class="field" width="30%" align="right">Name Usage Type Code :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					 	  <bean:define id="nameUsageTypeCodeId" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::NameUsageTypeCode"/>
				  		 <html:text property="answer(Object::Transaction::NameInvolvement::NameUsageTypeCode)" name="nameInvolvementDisplay" value = "<%=""+nameUsageTypeCodeId%>" />
				 	 </td>
			 	 </tr>
			 	 <tr>
					 <td class="field" width="30%" align="right">Name Involvement Type :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
						  <bean:define id="nameInvolvementTypeId" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::NameInvolvementType"/>
				  		 <html:text property="answer(Object::Transaction::NameInvolvement::NameInvolvementType)" name="nameInvolvementDisplay" value = "<%=""+nameInvolvementTypeId%>"  />
				 	 </td>
			 	 </tr>
			 	 <tr><td colspan="3">&nbsp;</td></tr>
			 	 <tr>
			 	     <td>&nbsp;</td>
			 	     <td colspan="2" align="left">
			 	        <html:button styleClass="covbutton" value="Save" property="save" onclick="submitNameInvolvementDetails()" />
			 	     </td>
			 	 </tr>
			 	</table>
			 	<bean:define id="additionalInsuredId1" name="nameInvolvementDisplay" property="Object::Transaction::NameInvolvement::AdditionalInsuredId"/>
			 	<html:hidden property="answer(Object::Transaction::NameInvolvement::AdditionalInsuredId)" value="<%=""+additionalInsuredId1%>" styleId="nameInvolvementId"  />
			 	<bean:define id="transactionDetailId1" name="nameInvolvementDisplay" property="Object::Transaction::TransactionDetailId"/>
			 	<html:hidden property="answer(Object::Transaction::TransactionDetailId)" value="<%=""+transactionDetailId1%>" styleId="transactionDetailId"  />
			 </html:form>	
		 </div>
  	  </div>
</logic:present>
			 	
  	 	 