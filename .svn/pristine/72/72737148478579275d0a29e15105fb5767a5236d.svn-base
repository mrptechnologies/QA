<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<template:insert template='/template/GeneralTemplate.jsp'> 
<template:put name='image1' content='/common/image1.jsp' />
<template:put name='image2' content='/common/image2.jsp' />
<template:put name='LeftMenuAdmin' content='/common/Admin_Menu.jsp' /> 

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_PROGRESSBAR"}%>' connector='or' negated="true">
<template:put name='ProgressBar' content='/common/ProgressBarInsuredBTA.jsp'/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_PROGRESSBAR"}%>' connector='or' negated="false">	
<template:put name='ProgressBar' content='/common/ProgressBarInsured.jsp'/>
</dmshtml:dms_static_with_connector>

<template:put name='Header1' content='/submission/AddInsuredHeader3.0.jsp' />
<template:put name='GeneralBody' content='/submissioninsured/AddOrEditSubmissionBody3.0.jsp' /> 
<template:put name='rightImage' content='/common/rightImage.jsp' /> 
</template:insert>
