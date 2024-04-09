<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>



<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>


<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>


<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />


<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=custId+""%>' styleId="custId" />

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerId" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::userName)" value='<%=userName+""%>' styleId="userName" />
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
	
	
	<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="100%" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/SubmissionInsuredAgencyLinksPage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
						
						<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="0" >
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
			
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
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


<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveSubmissionLocationApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
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
