
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>


<template:insert template='/template/GeneralTemplate.jsp'>
<template:put name='image1' content='/common/image1.jsp' />
<template:put name='image2' content='/common/image2.jsp' />



<template:put name='Header1' content='/submission/SubmissionHeaderBody.jsp' />

<template:put name='GeneralBody' content='/clearance/CheckClearanceBody.jsp' />
<template:put name='rightImage' content='/common/rightImage.jsp' />
</template:insert>
