<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/policyNumberValidate.js" >
 </script>



<html:form action="/SaveProductPolicyNum.do">
<bean:parameter id="productId" name="answer(Object::Product::ProductId)"/>
<bean:parameter id="productVerId" name="answer(Object::ProductVer::ProductVerId)"/>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	

	<tr>
		<td>
		   <html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
		</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				
	    	</table>
	    </td>
	</tr>			
	<tr>
		<td height="5"></td>
	</tr>

	<tr>
		<td class="NewSectionHead" align="center">PRODUCT POLICY NUMBER</td>
	</tr>

	<tr>
		<td>&nbsp;</td>
	</tr>
	 <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	 <bean:define id="userName"	property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

	<tr>
		<td>
		<hr size="1" noshade>
		</td>
	</tr>
				
	<tr>
		<td align="center">

			<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr>
					<td align="center" class="sectionhead" colspan="2">&nbsp;ADD NEW PRODUCT NUMBER</td>
				</tr>
							
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left" >Policy Number Prefix</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyNumPreFix)" size="15" maxlength="20" styleClass="txtbox"  />
					</td>
				</tr>
							
				<tr>
					<td class="FormLabels" align="left">Policy Number Suffix</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyNumSuffix)" size="15" maxlength="20" styleClass="txtbox"   />
					</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">Policy Beginning Number</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyBegNum)" size="15" maxlength="30" styleClass="txtbox"  styleId="PolicyBegNum" onblur="isInteger(this)" />	
					</td>	
				</tr>						
						
				<tr>
					<td class="FormLabels" align="left">Policy End Number</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyEndNum)" size="15" styleClass="txtbox" styleId="PolicyEndNum" onblur="isInteger(this)" />
					</td>
				</tr>

			
				<tr>
					<td class="FormLabels" align="left">Last Number Used</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyNumLastUsed)" size="15"	maxlength="30" styleClass="txtbox" styleId="PolicyNumLastUsed" onblur="isInteger(this)"  />	
					</td>	
				</tr>
				
				<tr>
					<td class="FormLabels" align="left">Name</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyNumName)" size="15"	maxlength="30" styleClass="txtbox" styleId="PolicyNumLastUsed" />	
					</td>	
				</tr>
				<tr>
					<td class="FormLabels" align="left">Description</td>
					<td class="TextMatter" align="left">
					<html:text property="answer(Object::Product::PolicyNumDesp)" size="15"	maxlength="30" styleClass="txtbox" styleId="PolicyNumLastUsed" />	
					</td>	
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>

					<td colspan="2" align="center">
						<html:submit value="Save" property="answer(submit)"	styleClass="sbttn"  />
					</td>					
				</tr>

								
			</table>
		</td>
	</tr>
</table> 	
	<html:hidden property="answer(Object::Product::ProductId)" value="<%=""+productId %>"/>												
	<html:hidden property="answer(Object::ProductVer::ProductVerId)" value="<%=""+productVerId %>"/>
	<html:hidden property="answer(Object::Product::userName)" value="<%=""+userName %>"/>
	<html:hidden property="answer(Object::Product::ownerId)" value="<%=""+ownerId %>"/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>	