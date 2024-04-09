<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
</script>

<bean:parameter id="productStateTaxId" name="ProductStateTaxId" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<% long ProductStateTaxId = Long.parseLong(productStateTaxId); %>

<table align="center" border="0" width="100%">
	<tr>
		<td>
	<div id="policyheadercontainer">
		<div id="policyheadernav">	
			<table align="center" border="0" width="100%">
				<tr>
					<td align="left" width="45%">						
						<a rel="policyheader" onclick="showHidePolicyHeader('policyheadernav');"><img src="../Images/minus.gif" name="policyHeaderImg" height="12" width="12" align="left"></img>&nbsp;<span id="Policy:TxtChange">Click to hide the detail</span></a>						
					</td>	
					<td align="left"><b class="title">STATE TAX SUMMARY</b></td>												
				</tr>
			</table>
		</div>
		
		<div id="policyheader" class="innercontent3">
	  
		     <table width="100%" align="center" border="0" bgcolor="#C6DEEA">
		     	<tr>
		     		<td>
		     			<dmshtml:getStateTaxHeaderDetail nameInSession="stateTaxHeader" productStateTaxId="<%=ProductStateTaxId%>" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
		     				<logic:present name="stateTaxHeader" >
		     				
		     					<% com.dms.ejb.taxdefinition.TaxDefinitionDetail taxDefinitionDetail = (com.dms.ejb.taxdefinition.TaxDefinitionDetail)request.getAttribute("stateTaxHeader");	%>  
			     				<tr>
									<td align="left" class="FormLabels"  colspan="1" width="25%">
										STATE TAX ID
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="35%">
										<%=productStateTaxId%>
									</td>
									<td  class="FormLabels" align="left"  colspan="1" width="20%">
										STATE CODE
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="25%">
										<%=taxDefinitionDetail.getStateCode() %>
									</td>
								</tr>
				
			     				<tr>
									<td align="left" class="FormLabels"  colspan="1" width="25%">
										TERRITORY
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="35%">
										<%=taxDefinitionDetail.getTerritory() %>   
									</td>
									<td align="left" class="FormLabels"  colspan="1" width="25%">
										COUNTY CODE
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="35%">
										<%=""+taxDefinitionDetail.getCountyCode() %>
									</td>
								</tr>
								
								<tr>
									<td  class="FormLabels" align="left"  colspan="1" width="20%">
  									    TAX CODE
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="25%">
										<%=""+taxDefinitionDetail.getTaxCode() %>
									</td>
									<td  class="FormLabels" align="left"  colspan="1" width="20%">
									USER EDITABLE
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="25%">
										<%=""+taxDefinitionDetail.getUsrEditable() %>
									</td>
								</tr>
																
		     				</logic:present>
		     			</td>
		     		</tr>
		   	</table>
		</div> 

    </div>	
     </td>
   </tr>
 </table>	
