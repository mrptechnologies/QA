<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<logic:present name='arrCustomerDetail'>
<%System.out.println("Inside AjaxInsuredList......."); %>
<logic:iterate id="arrCustomerDetail" name="arrCustomerDetail" >
<bean:write name="arrCustomerDetail" property="Object::Policy::OneSourceKey" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::CustomerName" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::Address1" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::Address2" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::City" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::State" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::Zip" /><%="|"%><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::CustomerId" /><%="|"%><bean:write name="arrCustomerDetail" property="Object::Customer::Address::Country" /><%="\n" %>
</logic:iterate>
</logic:present>