<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
							<bean:define id='agencyId'  name="AddAgency" property="answer(Object::Agency::AgencyIdTemp)" />
<dmshtml:get_agency_detail nameInSession="agencyDetail" agencyId="<%=agencyId+""%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<logic:present name="agencyDetail" scope="request">
				<bean:define id="agdetail" name="agencyDetail" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
				<div class="LeftMargin"><bean:write name="agdetail" property="businessName"/><br></div>
				<bean:define id="agencyName" name="agdetail" property="businessName"/>
				<html:hidden  property="answer(Object::Agency::BusinessName1)" value="<%=agencyName+"" %>" styleId="agencyName"/>
					
				<bean:define id="addressMap" name="agdetail" property="addresses" type="java.util.HashMap" />
				<bean:define id="addressDetail" name="addressMap" property="BUSINESS" type="com.dms.ejb.address.AddressDetail" />
			
				<div class="LeftMargin"><bean:write name="addressDetail" property="address1" /><br></div>
				<div class="LeftMargin"><bean:write name="addressDetail" property="address2" /><br></div>
				<div class="LeftMargin"><bean:write name="addressDetail" property="city" />
				<bean:write name="addressDetail" property="state" />
				<bean:write name="addressDetail" property="zip" /></div>
		</logic:present>