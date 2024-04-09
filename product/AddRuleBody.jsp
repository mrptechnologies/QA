<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<script type="text/javascript">

</SCRIPT>


<html:form action="/AddRuleGroup" >
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />



<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr><td>&nbsp;</td></tr>
	<tr>
	
		<td valign="top" align="left">

			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">


				<tr><td colspan="3">


					

					<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">


						<tr>
							<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT RULE GROUP</td>
						</tr>
						<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
						
					</table>

				</td>
			</tr>
			
			

		


			<tr>
				<td align="left" colspan="2">
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

						<tr>
						<td colspan="2" align="center" class="sectionhead">RULE DETAILS</td>
					
						</tr>

						<tr><td colspan="2">&nbsp;</td></tr>
						
						<tr>
							<td width="30%" class="FormLabels" align="left">Attribute</td>
							<td width="30%" class="FormLabels" align="left">Relational Operator</td>
							<td width="30%" class="FormLabels" align="left">Value</td>
							<td class="FormLabels" align="left">Value Type</td>
							<td class="FormLabels" align="left">Combiming Operator</td>
						</tr>
						<tr>
							<td class="links"><html:text  name='AssociatedDocumentVersionList' property ="answer(Object::ProductGroup::GroupName)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupName" /></td>
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::ProductGroup::GroupStatus)" name="AssociatedDocumentVersionList" styleClass="TextMatter" styleId="prdGroupStatus" >
									<html:option value ="DEVELOPMENT"><</html:option>
									<html:option value ="RELEASED"><=</html:option>
									<html:option value ="RELEASED">></html:option>
									<html:option value ="RELEASED">>=</html:option>
									<html:option value ="RELEASED">==</html:option>
								
								</html:select>
							</td>
							<td class="links"><html:text  name='AssociatedDocumentVersionList' property ="answer(Object::ProductGroup::GroupDesc)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupDesc" /></td>
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::ProductGroup::GroupStatus)" name="AssociatedDocumentVersionList" styleClass="TextMatter" styleId="prdGroupStatus" >
									<html:option value ="DEVELOPMENT">Static</html:option>
									<html:option value ="RELEASED">Attribute</html:option>
								
								</html:select>
							</td>
					
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::ProductGroup::GroupStatus)" name="AssociatedDocumentVersionList" styleClass="TextMatter" styleId="prdGroupStatus" >
									<html:option value ="DEVELOPMENT">AND</html:option>
									<html:option value ="RELEASED">OR</html:option>
									<html:option value ="RELEASED">XOR</html:option>
									<html:option value ="RELEASED">NOR</html:option>
									<html:option value ="RELEASED">NAND</html:option>
								
								</html:select>
							</td>
						</tr>

						
						



						<tr>
							<td class="FormLabels" align="left" colspan="2">
							&nbsp;	
							</td>
							
						</tr>

						<tr>
							<td align="center" colspan="2">
								<html:submit value="ADD" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>



			<tr>
				<td align="left" colspan="2">
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

						<tr>
						<td colspan="2" align="center" class="sectionhead">RULE ACTION DETAILS</td>
					
						</tr>

						<tr><td colspan="2">&nbsp;</td></tr>
						
						<tr>
							<td width="30%" class="FormLabels" align="left">Attribute</td>
							<td width="30%" class="FormLabels" align="left">Success Action</td>
							<td width="30%" class="FormLabels" align="left">Failure Action</td>
							<td class="FormLabels" align="left">Attribute List Id</td>
							<td class="FormLabels" align="left">Formaula GroupId</td>
						</tr>
						<tr>
							<td class="links"><html:text  name='AssociatedDocumentVersionList' property ="answer(Object::ProductGroup::GroupName)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupName" /></td>
							<td class="links"><html:text  name='AssociatedDocumentVersionList' property ="answer(Object::ProductGroup::GroupDesc)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupDesc" /></td>
							<td class="links"><html:text  name='AssociatedDocumentVersionList' property ="answer(Object::ProductGroup::GroupDesc)"  size="30" maxlength="30" styleClass="txtbox" styleId="GroupDesc" /></td>
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::ProductGroup::GroupStatus)" name="AssociatedDocumentVersionList" styleClass="TextMatter" styleId="prdGroupStatus" >
									<html:option value ="DEVELOPMENT">Static</html:option>
									<html:option value ="RELEASED">Attribute</html:option>
								
								</html:select>
							</td>
					
							<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::ProductGroup::GroupStatus)" name="AssociatedDocumentVersionList" styleClass="TextMatter" styleId="prdGroupStatus" >
									<html:option value ="DEVELOPMENT">AND</html:option>
									<html:option value ="RELEASED">OR</html:option>
									<html:option value ="RELEASED">XOR</html:option>
									<html:option value ="RELEASED">NOR</html:option>
									<html:option value ="RELEASED">NAND</html:option>
								
								</html:select>
							</td>
						</tr>

						
						



						<tr>
							<td class="FormLabels" align="left" colspan="2">
							&nbsp;	
							</td>
							
						</tr>

						<tr>
							<td align="center" colspan="2">
								<html:submit value="ADD" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>


</html:form>
