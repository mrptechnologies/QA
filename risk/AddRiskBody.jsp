<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT SRC="../Scripts/JScripts/AddRisk.js"  type="text/javascript"> </SCRIPT>

<form action="../risk/AddNewRisk.jsp">

<bean:define id="customerId" name="chooseRisk" property="answer(Object::Customer::CustomerId)"></bean:define>
<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	
	<tr>
		<td>
			<table WIDTH="1200px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td  class="FormLabels" align="left" colspan="4">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="4" align="center">
						ADD RISK Information
					</td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">
						&nbsp; 
					</td>
				</tr>
				<tr>
					<td class="links">
						<a href= "/GetList.do?TabPanelName=Insured_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>"> Risks </a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="center" class="sectionhead">
									SELECT RISK TYPE
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="TextMatter1"  >
						<table>
							<tr>
								<td width="30%" class="FormLabels" align="left">Risk Type*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::RiskType)" styleId="RiskType" styleClass="txtbox" value="type">
										<html:option value="Residential Property">Residential Property</html:option>
										<html:option value="Personal Auto">Personal Auto</html:option>
										<html:option value="Watercraft">Watercraft</html:option>
										<html:option value="Aviation">Aviation</html:option>
										<html:option value="Collections">Collections</html:option>
										<html:option value="Workers Compensation">Workers Compensation</html:option>
										<html:option value="Contents in Storage">Contents in Storage</html:option>													
									</html:select>
								</td>
								<td>
									<html:hidden property="answer(Object::Risk::ResProperty::CustomerId)" value="<%=customerId.toString() %>" />
									<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString() %>" />
									<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center">
						<html:submit value="Next" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" onclick="return validate(this.form)"/>
					</td>
					<td align="left">
						<html:submit value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"  onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>