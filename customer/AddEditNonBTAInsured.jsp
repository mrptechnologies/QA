<% 
/**
 * Copyright 2002-2010 of Solartis Inc, USA .
 * All Rights Reserved.
 * This software is confidential and proprietary information of Solartis,Inc, USA.
 * This should not be used without proper agreement signed with Solartis Inc,USA.
 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>


<template:insert template='/template/GeneralTemplate.jsp'> 
<template:put name='image1' content='/common/image1.jsp' />
<template:put name='image2' content='/common/image2.jsp' />
<template:put name='LeftMenuAdmin' content='/common/Admin_Menu.jsp' /> 
<template:put name='Header1' content='/common/InsuredNonBTAHeader.jsp' />
<template:put name='ProgressBar' content='/cvstarr/ProgressBarAddPolicyInsured.jsp' />
<template:put name='GeneralBody' content='/customer/AddEditNonBTAInsuredBody.jsp' /> 
<template:put name='rightImage' content='/common/rightImage.jsp' /> 
</template:insert>