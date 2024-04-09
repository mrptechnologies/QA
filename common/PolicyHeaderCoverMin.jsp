<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%	String parentPolicyId = "";
	if(request.getParameter("parentPolicyId") != null) {
		parentPolicyId = request.getParameter("parentPolicyId"); 
	}
	String currentVerId = "";
	if(request.getParameter("currentVerId") != null) {
		currentVerId = request.getParameter("currentVerId"); 
	}
	String policyHeaderId = "";
	if(request.getParameter("policyHeaderId") != null) {
		policyHeaderId = request.getParameter("policyHeaderId"); 
	}
	String policyHeaderVerId = "";
	if(request.getParameter("policyHeaderVerId") != null) {
		policyHeaderVerId = request.getParameter("policyHeaderVerId"); 
	}
	String isRenewal = "";
	if(request.getParameter("isRenewal") != null) {
		isRenewal = request.getParameter("isRenewal"); 
	}
	String renewalPolicyVerId = "";
	if(request.getParameter("renewalPolicyVerId") != null) {
		renewalPolicyVerId = request.getParameter("renewalPolicyVerId"); 
	}
	String renewalPolicyId = "";
	if(request.getParameter("renewalPolicyId") != null) {
		renewalPolicyId = request.getParameter("renewalPolicyId"); 
	}
	String isRenewalFlag = "";
	if(request.getParameter("isRenewalFlag") != null) {
		isRenewalFlag = request.getParameter("isRenewalFlag"); 
	}
	String primaryParentQuoteId = "";
	if(request.getParameter("primaryParentQuoteId") != null) {
		primaryParentQuoteId = request.getParameter("primaryParentQuoteId"); 
	}
	String primarySubQuoteId = "";
	if(request.getParameter("primarySubQuoteId") != null) {
		primarySubQuoteId = request.getParameter("primarySubQuoteId"); 
	}
	String primaryParentQuoteVerId = "";
	if(request.getParameter("primaryParentQuoteVerId") != null) {
		primaryParentQuoteVerId = request.getParameter("primaryParentQuoteVerId"); 
	}
	String primarySubQuoteVerId = "";
	if(request.getParameter("primarySubQuoteVerId") != null) {
		primarySubQuoteVerId = request.getParameter("primarySubQuoteVerId"); 
	}
	String parentPolicyVerId = "";
	if(request.getParameter("parentPolicyVerId") != null) {
		parentPolicyVerId = request.getParameter("parentPolicyVerId"); 
	}
%>
<bean:parameter id="policyId" name="policyId" />
<bean:parameter id="policyVerId" name="policyVerId" />
<bean:parameter id="policyNumber" name="policyNumber" />
<bean:parameter id="title" name="title" />
<bean:parameter id="parentQuoteId" name="parentQuoteId" />
<bean:parameter id="parentQuoteVerId" name="parentQuoteVerId" />


<jsp:include page="../common/PolicyHeaderMin.jsp">
	<jsp:param name="policyId" value="<%=policyId.toString()%>" />
	<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
	<jsp:param name="parentPolicyId" value="<%=parentPolicyId.toString()%>" />
	<jsp:param name="currentVerId" value="<%=currentVerId.toString()%>" />
	<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
	<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
	<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
    <jsp:param name="parentQuoteVerId" value="<%=""+parentQuoteVerId%>" />
    <jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
    <jsp:param name="renewalPolicyVerId" value="<%=""+renewalPolicyVerId%>" />
    <jsp:param name="renewalPolicyId" value="<%=""+renewalPolicyId%>" />
    <jsp:param name="isRenewalFlag" value="<%=""+isRenewalFlag%>" />
    <jsp:param name="primaryParentQuoteId" value="<%=""+primaryParentQuoteId%>" />
    <jsp:param name="primarySubQuoteId" value="<%=""+primarySubQuoteId%>" />
    <jsp:param name="primaryParentQuoteVerId" value="<%=""+primaryParentQuoteVerId%>" />
    <jsp:param name="primarySubQuoteVerId" value="<%=""+primarySubQuoteVerId%>" />
    <jsp:param name="parentPolicyVerId" value="<%=""+parentPolicyVerId%>" />
</jsp:include>