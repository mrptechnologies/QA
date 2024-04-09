<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type=text/javascript>

function changeDateFormat(){
   
	var formElement=document.forms[0];
	
	var uCrebeginMM=formElement.sentStartMonth.value;
	var uCrebeginDD=formElement.sentStartDate.value;
	var uCrebeginYY=formElement.sentStartYear.value;
	
	var uCreendMM=formElement.sentEndMonth.value;
	var uCreendDD=formElement.sentEndDate.value;
	var uCreendYY=formElement.sentEndYear.value;


	if((uCrebeginMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
		formElement.inpCreatedDateBegin.value=uCrebeginYY+"-"+uCrebeginMM+"-"+uCrebeginDD;
	}

	if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
		formElement.inpCreatedDateEnd.value=uCreendYY+"-"+uCreendMM+"-"+uCreendDD;
	}	

	return true;
}

</script>



<html:form action="/FindPaymentList.do" onsubmit="return changeDateFormat(this)" method="post" >


<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

   <table width="98%" border = 0 cellspacing = 2 cellpadding = 0>
   
   <tr>
   <td>
   &nbsp;&nbsp;
   </td>
   </tr>
<tr><td class="NewSectionHead" colspan="4" align="center">FIND PAYMENT</td></tr>
<tr>
   <td>
   &nbsp;&nbsp;
   </td>
   </tr>
   <tr>
   <td>
   &nbsp;&nbsp;
   </td>
   
   <tr>
   <td>
   &nbsp;&nbsp;
   </td>
   </tr>
    <tr>
                    <td width="40%" align="right" class="FormLabels">
						Quote Number
					</td> 
					<td class="links" align="left" >
						<html:text  property="answer(Object::Payment::ObjectId)" size="30" styleClass="txtbox" />
				    </td>
    </tr>
    <tr>
                    <td width="40%" align="right" class="FormLabels">
						Transaction State
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Payment::TransactionState)" styleClass="txtbox">
						    <html:option value="">Select</html:option>
							<html:option value="Processed">Processed</html:option>
							<html:option value="Not Processed">Not Processed</html:option>	
										
						</html:select>
				    </td>
    </tr>
   <tr>
                    <td width="40%" align="right" class="FormLabels">
						Transaction Method
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Payment::PaymentMethod)" styleClass="txtbox">
						    <html:option value="">Select</html:option>
							<html:option value="ACH">ACH</html:option>
							<html:option value="Credit Card">Credit Card</html:option>						
						</html:select></td>

    </tr>
    </tr>
    <tr>
					<td width="40%" class="FormLabels" align="right" >
						Payment Start-Date
					</td>
					<td class="links">
						<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].sentStartDate.focus()}" styleId="sentStartMonth" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].sentStartYear.focus()}" styleId="sentStartDate" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" onkeyup="if(this.value.length==4) {document.forms[0].sentEndMonth.focus()}" styleId="sentStartYear" />&nbsp;(MM/DD/YYYY)
					</td>
	</tr>
    <tr>
                    <td width="40%" align="right" class="FormLabels">
						Payment End-Date
					</td> 
					<td align="left" ><html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].sentEndDate.focus()}" styleId="sentEndMonth" />&nbsp;
						<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].sentEndYear.focus()}" styleId="sentEndDate" />&nbsp;
						<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox"  styleId="sentEndYear" />&nbsp;(MM/DD/YYYY)
					</td>

   </tr>
   <tr><td>&nbsp;</td></tr>
   <html:hidden property="answer(Object::Payment::StartDate)" value="" styleId="inpCreatedDateBegin"/>
   <html:hidden property="answer(Object::Payment::EndDate)" value="" styleId="inpCreatedDateEnd"/>
   <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
   <html:hidden property="answer(Object::Payment::PageNum)" value="0" styleId="pageNum"/>
			<tr>
				<td colspan="2" align="center" >
					<html:submit value="Find" property="Search" styleClass="sbttn"/>
					&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
			</tr>
</table>

</html:form>

