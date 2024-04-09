<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>

<logic:present name="infLocationMap">

   <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>		
   <bean:define id="transactionDetail1" name="infLocationMap" property="Object::INFLocation::TransactionDetail" type="com.dms.ejb.webservice.liu.dataloader.TransactionDetail"/>	
   <bean:define id="transactionDetailId1" name="transactionDetail1" property="masterTransactionDetailId"/>
   <bean:define id="locationDetailId1" name="infLocationMap" property="Object::INFLocation::LocationDetailId"/>		
   <bean:define id="assuredAction1" name="infLocationMap" property="Object::INFLocation::AssuredAction"/>
   <bean:define id="legalName2Id" name="infLocationMap" property="Object::INFLocation::LegalName2"/>
   <bean:define id="constructedLocationKey1" name="infLocationMap" property="Object::INFLocation::ConstructedLocationKey"/>
   <bean:define id="assuredType1" name="infLocationMap" property="Object::INFLocation::AssuredType"/>
   <bean:define id="assuredAddressIdentifier1" name="infLocationMap" property="Object::INFLocation::AssuredAddressIdentifier"/>
   <bean:define id="legalName1" name="infLocationMap" property="Object::INFLocation::LegalName"/>
   <bean:define id="addressLine1Id" name="infLocationMap" property="Object::INFLocation::AddressLine1"/>
   <bean:define id="addressLine2Id" name="infLocationMap" property="Object::INFLocation::AddressLine2"/>
   <bean:define id="addressLine3Id" name="infLocationMap" property="Object::INFLocation::AddressLine3"/>
   <bean:define id="addressLine4Id" name="infLocationMap" property="Object::INFLocation::AddressLine4"/>
   <bean:define id="addressLine5Id" name="infLocationMap" property="Object::INFLocation::AddressLine5"/>
   <bean:define id="postalCode1" name="infLocationMap" property="Object::INFLocation::PostalCode"/>
   <bean:define id="city1" name="infLocationMap" property="Object::INFLocation::City"/>
   <bean:define id="state1" name="infLocationMap" property="Object::INFLocation::State"/>
   <bean:define id="country1" name="infLocationMap" property="Object::INFLocation::Country"/>
   <bean:define id="classCode01Id" name="infLocationMap" property="Object::INFLocation::ClassCode01"/>
   <bean:define id="classCode04Id" name="infLocationMap" property="Object::INFLocation::ClassCode04"/>
   <bean:define id="unitAction1" name="infLocationMap" property="Object::INFLocation::UnitAction"/>
   <bean:define id="unitAddressIdentifier1" name="infLocationMap" property="Object::INFLocation::UnitAddressIdentifier"/>
   <bean:define id="unitType1" name="infLocationMap" property="Object::INFLocation::UnitType"/>
   <bean:define id="productUnitCode1" name="infLocationMap" property="Object::INFLocation::ProductUnitCode"/>
   <bean:define id="vendorAddressRef1" name="infLocationMap" property="Object::INFLocation::VendorAdddressRef"/>
   <bean:define id="addressTypeFlag1" name="infLocationMap" property="Object::INFLocation::AddressTypeFlag"/>
   <bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
   <div class="content"> 
	<div class="formpage01">
	  <html:form action="/UpdateINFLocationtDetails"  styleId="infLocationDetailsForm">
		<div class="formheadnew"><h2 class="left"> Location Details</h2></div>
		  <div>&nbsp;</div>
			<table width= "100%">
				 	<tr>
						<td class="field" width="30%" align = "right">Unit Action :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						    <html:text property="answer(Object::INFLocation::UnitAction)" value = "<%=""+unitAction1 %>" />
						</td>
					</tr>
					<tr>
						<td class="field" width="30%" align = "right">Unit Address Identifier :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						    <html:text property="answer(Object::INFLocation::UnitAddressIdentifier)" value = "<%=""+unitAddressIdentifier1 %>" />
						</td>
					</tr>
					<tr>
						<td class="field" width="30%" align = "right">Unit Type :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						     <html:text property="answer(Object::INFLocation::UnitType)" value = "<%=""+unitType1 %>" />
						</td>
					</tr>
					<tr>
						<td class="field" width="30%" align = "right">Product Unit Code :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						     <html:text property="answer(Object::INFLocation::ProductUnitCode)" value = "<%=""+productUnitCode1 %>" />
						</td>
					</tr>
		   <html:hidden property="answer(Object::INFLocation::AddressLine1)" value = "<%=""+addressLine1Id %>" />
		   <html:hidden property="answer(Object::INFLocation::AddressLine2)" value = "<%=""+addressLine2Id %>" />
		   <html:hidden property="answer(Object::INFLocation::AddressLine3)" value = "<%=""+addressLine3Id %>" />
		   <html:hidden property="answer(Object::INFLocation::AddressLine4)" value = "<%=""+addressLine4Id %>" />
		   <html:hidden property="answer(Object::INFLocation::AddressLine5)" value = "<%=""+addressLine5Id %>" />
		   <html:hidden property="answer(Object::INFLocation::PostalCode)" value = "<%=""+postalCode1 %>" />
		   <html:hidden property="answer(Object::INFLocation::City)" value = "<%=""+city1 %>" />
		   <html:hidden property="answer(Object::INFLocation::State)" value = "<%=""+state1 %>" />
		    <html:hidden property="answer(Object::INFLocation::Country)" value = "<%=""+country1 %>" />
		    <html:hidden property="answer(Object::INFLocation::AddressTypeFlag)" value = "<%=""+addressTypeFlag1 %>" />
		   <html:hidden property="answer(Object::INFLocation::LocationDetailId)" value = "<%=""+locationDetailId1 %>" />
	       <html:hidden property="answer(Object::INFLocation::AssuredAction)" value = "<%=""+assuredAction1 %>" />
	       <html:hidden property="answer(Object::INFLocation::LegalName2)" value = "<%=""+legalName2Id %>" />
	       <html:hidden property="answer(Object::INFLocation::ConstructedLocationKey)" value = "<%=""+constructedLocationKey1 %>" />
	       <html:hidden property="answer(Object::INFLocation::AssuredType)" value = "<%=""+assuredType1 %>" />
	       <html:hidden property="answer(Object::INFLocation::AssuredAddressIdentifier)" value = "<%=""+assuredAddressIdentifier1 %>" />
	       <html:hidden property="answer(Object::INFLocation::LegalName)" value = "<%=""+legalName1 %>" />
	       <html:hidden property="answer(Object::INFLocation::ClassCode01)" value = "<%=""+classCode01Id %>" />
	       <html:hidden property="answer(Object::INFLocation::ClassCode04)" value = "<%=""+classCode04Id %>" />
	      <html:hidden property="answer(Object::INFLocation::VendorAdddressRef)" value = "<%=""+vendorAddressRef1 %>" />
	      <html:hidden property="answer(Object::Transaction::TransactionDetailId)" value="<%=""+transactionDetailId1%>"/>
	     </table>  
	     <table width="100%">
	        <tr><td colspan="2">&nbsp;</td></tr>
	         <tr>
	         <td width="25%">
	          <td width="75%" align="left">
	           <html:button styleClass="covbutton" value="Save" property="save" onclick="submitINFLocationDetails()" />
	            
	          </td>
	         </tr>
         </table> 
       </html:form>
      </div>
     </div>
    </logic:present>
   
      
	
				  