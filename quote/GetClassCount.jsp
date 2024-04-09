<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<% String classListSize = "0";%>
<% if(request.getAttribute("ClassListSize") != null){ %>
<%=""+request.getAttribute("ClassListSize")%> 
<%}%>
