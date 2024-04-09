<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<logic:present name='searchresultnewDisplay'>
<%System.out.println("Inside......."); %>
<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" >
<bean:write name="searchresultnewDisplay" property="Object::AGENCY::Code" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::BUSINESSNAME" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::BRANCHNAME" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::ExternalSystemCode" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::Address1" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::Address2" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::City" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::AddressState" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::Zip" /><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::Status" /><%="____~____*"%><%="____~____*"%><bean:write name="searchresultnewDisplay" property="Object::AGENCY::AGENCYID" /><%="\n" %>
</logic:iterate>
</logic:present>
