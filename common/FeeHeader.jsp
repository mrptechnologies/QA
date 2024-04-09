<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
</script>

<bean:parameter id="feeName" name="FeeName" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

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
					<td align="left"><b class="title">FEE SUMMARY</b></td>												
				</tr>
			</table>
		</div>
		
		<div id="policyheader" class="innercontent3">
	  
		     <table width="100%" align="center" border="0" bgcolor="#C6DEEA">
		     	<tr>
		     		<td>
		     			<dmshtml:getFeeHeaderDetail nameInSession="feeHeader" feeName="<%=feeName%>" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
		     				<logic:present name="feeHeader" >
		     				
		     					<% com.dms.ejb.feedefinition.FeeDefinitionDetail feeDefinitionDetail = (com.dms.ejb.feedefinition.FeeDefinitionDetail)request.getAttribute("feeHeader");	%>  
			     				<tr>
									<td align="left" class="FormLabels"  colspan="1" width="25%">
										FEE NAME
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="35%">
										<%=feeName%>
									</td>
									<td  class="FormLabels" align="left"  colspan="1" width="20%">
										FEE CATEGORY
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="25%">
										<%=feeDefinitionDetail.getFeeCategory()  %>
									</td>
								</tr>
								
									
			     				<tr>
									<td align="left" class="FormLabels"  colspan="1" width="25%">
										FEE DESCRIPTION
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="35%">
										<%=feeDefinitionDetail.getFeeDescription() %>   
									</td>
									<td align="left" class="FormLabels"  colspan="1" width="25%">
										ACTIVE
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="35%">
										<%=""+feeDefinitionDetail.getActive() %>
									</td>
								</tr>
								
								<tr>
									<td  class="FormLabels" align="left"  colspan="1" width="20%">
										OWNER ID
									</td>
									<td align="left" class="sectionhead1"  colspan="1" width="25%">
										<%=""+feeDefinitionDetail.getOwnerId() %>
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
