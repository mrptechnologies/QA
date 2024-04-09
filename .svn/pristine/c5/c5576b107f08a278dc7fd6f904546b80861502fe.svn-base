<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
</script>


<bean:parameter id="productId" name="ProductId" />
<bean:parameter id="productVerId" name="ProductVerId" />
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
					<td align="left"><b class="title">PRODUCT SUMMARY</b></td>												
				</tr>
			</table>
		</div>
	
	
	  <div id="policyheader" class="innercontent3">
	  
     <table width="100%" align="center" border="0" bgcolor="#C6DEEA">
     	<tr>
     		<td>
     			<dmshtml:getProductHeaderDetail nameInSession="productHeader" productId="<%=""+productId %>" productVerId="<%=""+productVerId%>" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
     				<logic:present name="productHeader" >
     				
     				<%
     				  com.dms.ejb.product.PRDProductDetail prdProductDetail = (com.dms.ejb.product.PRDProductDetail)request.getAttribute("productHeader");
     				%>  
     				<tr>
						<td align="left" class="FormLabels"  colspan="1" width="25%">
							Product Id					
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="35%">
							<%=""+productId%>
						</td>
						<td  class="FormLabels" align="left"  colspan="1" width="20%">
							Product VersionId 
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="25%">
							<%=""+productVerId%>
						</td>
						
					</tr>
     				
     				<tr>
						<td align="left" class="FormLabels"  colspan="1" width="25%">
							Family					
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="35%">
							<%=""+prdProductDetail.getProductFamilyName() %>   
						</td>
						<td  class="FormLabels" align="left"  colspan="1" width="20%">
							Product Version No
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="25%">
							<%=""+prdProductDetail.getMProductVerNumber() %>
						</td>
						
					</tr>
					
					<tr>
						<td align="left" class="FormLabels"  colspan="1" width="25%">
							Product Status					
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="35%">
							<%=""+prdProductDetail.getMProductVerStatus() %>
						</td>
						<td  class="FormLabels" align="left"  colspan="1" width="20%">
							Active
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="25%">
							<%=""+prdProductDetail.getMVerActive() %>
						</td>
						
					</tr>
					
					<tr>
						<td align="left" class="FormLabels"  colspan="1" width="25%">
							Product Name					
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="35%">
							<%=""+prdProductDetail.getMProductVerName() %>
						</td>
						<td  class="FormLabels" align="left"  colspan="1" width="20%">
							Description
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="25%">
							<%=""+prdProductDetail.getMProductVerDesc() %>
						</td>
						
					</tr>
					
					
					
					<tr>
						<td align="left" class="FormLabels"  colspan="1" width="25%">
							Program NO					
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="35%">
							<%=""+prdProductDetail.getMProductNum() %>
						</td>
						<td  class="FormLabels" align="left"  colspan="1" width="20%">
							Released Date
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="25%">
							<%=""+prdProductDetail.getMProductVerRelaseDate()%>
						</td>
						
					</tr>
					
					<tr>
						<td align="left" class="FormLabels"  colspan="1" width="25%">
							Start Date					
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="35%">
							<%=""+prdProductDetail.getMProductVerStartDate()%>
						</td>
						<td  class="FormLabels" align="left"  colspan="1" width="20%">
							End Date
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="25%">
							<%=""+prdProductDetail.getMProductVerEndDate()%>
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
