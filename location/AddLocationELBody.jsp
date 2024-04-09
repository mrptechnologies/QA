<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>




<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="locationId" name="answer(Object::Location::LocationId)" />

<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=custId+""%>' styleId="custId" />
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locationId+""%>' styleId="locationId" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerId" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerIdfrmjsp" />
							<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
							<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>
<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=custId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
</logic:present>
<html:hidden property="answer(custState)" value='<%=detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />



	<body>
	
	
	<table WIDTH="880px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
						
						<table WIDTH="880px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						
					</td>
				</tr>
			</table>
			
			<table>
							<tr>
								<td align="left">
									&nbsp;
								</td>
							</tr>
			</table>
			
			<table WIDTH="1000px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
								
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">ADD LOCATION </td>
								</tr>
								
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								
								
							</table>
	
<!-- <table>
	<tr>
		
	</tr>
</table> -->

<!-- <table>
	<tr>
		<td class="error">
			<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="Test Error Message Fro Zip Code" styleClass="txtbox" readonly="true" size="60" maxlength="60" />
		</td>
	</tr>
</table> -->


<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveEILRiskApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<logic:notPresent name="Application" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>

<table>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
	 <p>	<span id="messageHoldernew" style="{z-index: 1000; background:red; color:white; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span></p>
		</td>
	</tr>
	
	
</table>


</body>

<script>
	
	isSpecificValidationNeeded = true;
	
	function doSpecificValidation(frm){
		 if(document.Location.Use_of_Facility.value==""){
  
  			alert("Please select Use Of Facility");
			return false;
  
  		}	
	
		if(!document.Location.Owner_Type[0].checked && !document.Location.Owner_Type[1].checked){
			alert('Please select Owned or Leased');
			return false;
		}
		
		if(frm.name!="Location"){		
			if(doValidateTank(frm)){
				return true;
			}else{
				return false;
			}
		}
		return true;
	}

		
</script>

