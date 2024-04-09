<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%
String cId="";
String submissionId="";
if(request.getParameter("answer(Object::Customer::CustomerId)")!=null){
	cId = ""+request.getParameter("answer(Object::Customer::CustomerId)");
}
if(request.getParameter("answer(Object::Submisssion::SubmisssionId)")!=null){
	submissionId=""+request.getParameter("answer(Object::Submisssion::SubmisssionId)");
}
%>
<dmshtml:Get_Submission_Tanks_Details nameInSession="TanksListArray"  submissionInsuredId='<%=cId.toString()%>' submissionId = '<%=""+submissionId %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
<logic:present name="TanksListArray">
<logic:iterate id="TanksListArray" name="TanksListArray" >
<bean:write name="TanksListArray" property="Object::Location::Tanks::RiskNumber" /><%="____~____*"%><bean:write name="TanksListArray" property="Object::Location::Tanks::RiskName" /><%="____~____*"+"UST____~____*"%><bean:write name="TanksListArray" property="Object::Location::Tanks::LocationNumber" /><%="____~____*"%><bean:write name="TanksListArray" property="Object::Location::Tanks::LocationName" /><%="____~____*"%><bean:write name="TanksListArray" property="Object::Location::Tanks::StorageTankId" /><%="____~____*"%><bean:write name="TanksListArray" property="Object::Location::Tanks::LocationId" /><%="\n"%>
</logic:iterate>
</logic:present>
		