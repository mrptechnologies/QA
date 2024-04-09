<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>

<script type="text/javascript">
        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("s_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("s_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);

			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Search_Panel');
			new Ajax.Updater(
				"Search_Panel",
				url,
				{
				method: "get",
				onComplete: function(){
					if(document.getElementById("Search_Panel") != null && document.getElementById("Search_Panel") != undefined) {
						forwardToLoginPageIfInvalidSession(document.getElementById("Search_Panel").innerHTML);
					}
					//Do something
				}
				}
			);
		}


                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            });


</script>


<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

		<table>
		<tr>
		<td class="yui-skin-sam" id="yahoo-com">

		<!-- MENU start here -->
	   <div id="s_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				
				 <%if(insType.equals("PC")) {%>
				
					<!-- General Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem first-of-type"><a class="yuimenubaritemlabel" href="../FindGenaralAgencyAction.do?TabPanelName=Search_Panel&clear=yes">Find General Agency</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindAgencyAction.do?TabPanelName=Search_Panel&clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindAgent.do?TabPanelName=Search_Panel&clear=yes">Find Agent</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindSalesManager.do?TabPanelName=Search_Panel&clear=yes">Find Sales Manager</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Insured Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindInsured.do?TabPanelName=Search_Panel&clear=yes">Find Insured</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Quote Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../quote/FindQuote.jsp?TabPanelName=Search_Panel">Find Quote</a> </li>
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../quote/FindQuote.jsp?TabPanelName=Search_Panel">Find Quote</a> </li>
					</dmshtml:dms_static_with_connector>
					<!-- Policy Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="/SearchPolicyDisplayAction.do?TabPanelName=Search_Panel">Find Policy</a></li>
					</dmshtml:dms_static_with_connector>
					
					<!-- *******************************************Search Email************************************************ -->
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../email/FindEmail.jsp?TabPanelName=Search_Panel">Find E-Mail</a></li>
							
						</dmshtml:dms_static_with_connector>
              		<!-- ************************************************************************************************************** -->
					
					<!-- *******************************************Search Submission & Billing************************************************ -->
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../webservice/FindSubmission.jsp?TabPanelName=Search_Panel">Find Submission</a></li>
							
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../webservice/FindBilling.jsp?TabPanelName=Search_Panel">Find Billing</a></li>
							
						</dmshtml:dms_static_with_connector>
              		<!-- ************************************************************************************************************** -->
					
					<!-- Clearance Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SEARCH_CLEARANCE_DATABASE"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindClearance.do?TabPanelName=Search_Panel&clear=yes">Search in Clearance Database</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Submission Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSubmissionNBF.do?TabPanelName=Submission_Panel&clear=yes">Find Submission</a></li>
					</dmshtml:dms_static_with_connector>
					
					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/ProductsSubMenu.jsp?TabPanelName=Search_Panel">Product Management</a>
							<div id="search_tab_product" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindOptions.do?TabPanelName=Search_Panel">Find Options</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Search_Panel&clear=yes">Find Factors</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Application Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../application/ApplicationSubMenu.jsp?TabPanelName=Search_Panel">Applications</a>
											<div id="search_tab_applications" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAttribute.do?TabPanelName=Search_Panel&clear=yes">Find Attributes</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSubApplication.do?TabPanelName=Search_Panel&clear=yes">Find Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindApplication.do?TabPanelName=Search_Panel&clear=yes">Find Applications</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Documents/Forms Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindDocumentDefinitionAction.do?TabPanelName=Search_Panel&clear=yes">Find Document</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Products Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.do?TabPanelName=Search_Panel&clear=yes">Find Products</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindProductGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Product Groups</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Rule Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindRuleGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Rule Groups</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Formula Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindFormulaGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Formula Groups</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Billing and Payment Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/BillingAndPaymentSubMenu.jsp?TabPanelName=Manage_Panel">Billing And Payment</a>
												<div id="installmentType" class="yuimenu">
													<div class="bd">
														<ul class="first-of-type">
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/FindBillingType.jsp?TabPanelName=Manage_Panel">Find Billing Type</a></li>
															</dmshtml:dms_static_with_connector>
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/FindPaymentMethod.jsp?TabPanelName=Manage_Panel">Find Payment Method</a></li>
															</dmshtml:dms_static_with_connector>
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/FindInstallmentType.jsp?TabPanelName=Manage_Panel">Find Installment Type</a></li>
															</dmshtml:dms_static_with_connector>
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/FindBillingCurrency.jsp?TabPanelName=Manage_Panel">Find Billing Currency</a></li>
															</dmshtml:dms_static_with_connector>
														</ul>
													</div>
												</div>
											</li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
		 <%}else if(insType.equals("Health")){%>
		 
		 	<!-- General Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem first-of-type"><a class="yuimenubaritemlabel" href="../FindGenaralAgencyAction.do?TabPanelName=Search_Panel&clear=yes">Find General Agency</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindAgencyAction.do?TabPanelName=Search_Panel&clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindAgent.do?TabPanelName=Search_Panel&clear=yes">Find Agent</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindSalesManager.do?TabPanelName=Search_Panel&clear=yes">Find Sales Manager</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Insured Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindCustomers.do?TabPanelName=Search_Panel&clear=yes">Find Employer Group</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Quote Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../quote/FindQuote.jsp?TabPanelName=Search_Panel">Find Quote</a> </li>
					</dmshtml:dms_static_with_connector>	
					
					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/ProductsSubMenu.jsp?TabPanelName=Search_Panel">Product Management</a>
							<div id="search_tab_product" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindOptions.do?TabPanelName=Search_Panel">Find Options</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Search_Panel&clear=yes">Find Factors</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Products Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.do?TabPanelName=Search_Panel&clear=yes">Find Products</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindProductGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Product Groups</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindDocumentDefinitionAction.do?TabPanelName=Search_Panel&clear=yes">Find Document</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>

		 	
		 <%}else if(insType.equals("Professional Liability")) {%>
				
					<!-- General Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem first-of-type"><a class="yuimenubaritemlabel" href="../FindGenaralAgencyAction.do?TabPanelName=Search_Panel&clear=yes">Find General Agency</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindAgencyAction.do?TabPanelName=Search_Panel&clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindAgent.do?TabPanelName=Search_Panel&clear=yes">Find Agent</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindSalesManager.do?TabPanelName=Search_Panel&clear=yes">Find Sales Manager</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Insured Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../FindInsured.do?TabPanelName=Search_Panel&clear=yes">Find Insured</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- Quote Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_SUB_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../quote/FindQuote.jsp?TabPanelName=Search_Panel">Find Quote</a> </li>
					</dmshtml:dms_static_with_connector>
					<!-- Policy Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="/SearchPolicyDisplayAction.do?TabPanelName=Search_Panel">Find Policy</a></li>
					</dmshtml:dms_static_with_connector>
					
					<!-- *******************************************Search Email************************************************ -->
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../email/FindEmail.jsp?TabPanelName=Search_Panel">Find E-Mail</a></li>
							
						</dmshtml:dms_static_with_connector>
              		<!-- ************************************************************************************************************** -->
					
					<!-- *******************************************Search Submission & Billing************************************************ -->
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../webservice/FindSubmission.jsp?TabPanelName=Search_Panel">Find Submission</a></li>
							
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../webservice/FindBilling.jsp?TabPanelName=Search_Panel">Find Billing</a></li>
							
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PAYMENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../payment/SearchPayment.jsp?TabPanelName=Search_Panel">Find Payment</a></li>
							
						</dmshtml:dms_static_with_connector>
						
              		<!-- ************************************************************************************************************** -->
					
					
					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/ProductsSubMenu.jsp?TabPanelName=Search_Panel">Product Management</a>
							<div id="search_tab_product" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindOptions.do?TabPanelName=Search_Panel">Find Options</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Search_Panel&clear=yes">Find Factors</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Application Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../application/ApplicationSubMenu.jsp?TabPanelName=Search_Panel">Applications</a>
											<div id="search_tab_applications" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAttribute.do?TabPanelName=Search_Panel&clear=yes">Find Attributes</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSubApplication.do?TabPanelName=Search_Panel&clear=yes">Find Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindApplication.do?TabPanelName=Search_Panel&clear=yes">Find Applications</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Documents/Forms Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindDocumentDefinitionAction.do?TabPanelName=Search_Panel&clear=yes">Find Document</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Products Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.do?TabPanelName=Search_Panel&clear=yes">Find Products</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindProductGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Product Groups</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Rule Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindRuleGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Rule Groups</a></li>
										</dmshtml:dms_static_with_connector>
										<!-- Formula Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindFormulaGroup.jsp?TabPanelName=Search_Panel&clear=yes">Find Formula Groups</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<%} %>	
					<!-- User Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindUsers.do?TabPanelName=Search_Panel&clear=yes">Find User Accounts</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../LoginOutAction.do"><bean:message key="AdminMenu.LogOff"/></a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.LogOff"/> -->
				</ul>
			</div>
		</div>
<!-- end of menu -->

</td>
</tr>
</table>
