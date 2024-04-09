<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
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

            YAHOO.util.Event.onContentReady("manage_tab_menu", function () {

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

                var oMenuBar = new YAHOO.widget.MenuBar("manage_tab_menu", {
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
			var divObj = $('Manage_Panel');
			new Ajax.Updater(
				"Manage_Panel",
				url,
				{
				method: "get",
				onComplete: function(){
					if(document.getElementById("Manage_Panel") != null && document.getElementById("Manage_Panel") != undefined) {
						forwardToLoginPageIfInvalidSession(document.getElementById("Manage_Panel").innerHTML);
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
	   <div id="manage_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				<%if(insType.equals("PC")||insType.equals("Professional Liability")) {%>
					<!-- General Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem first-of-type"><a class="yuimenubaritemlabel" href="../Home/GeneralAgencySubMenu.jsp?TabPanelName=Manage_Panel"><bean:message key="AdminMenu.GeneralAgencies" /></a>
						<div id="manage_tab_generalAgency" class="yuimenu">
							<div class="bd">
								<ul>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../GeneralAgencyLink.do?TabPanelName=Manage_Panel&clear=yes">Add General Agency</a></li>
									</dmshtml:dms_static_with_connector>

									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindGenaralAgencyAction.do?TabPanelName=Manage_Panel&clear=yes">Find General Agency</a></li>
									</dmshtml:dms_static_with_connector>
								</ul>
							</div>
						</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/AgencySubMenu.jsp?TabPanelName=Manage_Panel">Agencies</a>
							<div id="manage_tab_agency" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AgencyLink.do?TabPanelName=Manage_Panel&clear=yes">Add Agency</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAgencyAction.do?TabPanelName=Manage_Panel&clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/AgentSubMenu.jsp?TabPanelName=Manage_Panel">Agents</a>
							<div id="manage_tab_agent" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddAgents.do?TabPanelName=Manage_Panel&clear=yes">Add Agent</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAgent.do?TabPanelName=Manage_Panel&clear=yes">Find Agent</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/SalesManagerSubMenu.jsp?TabPanelName=Manage_Panel">Sales Managers</a>
							<div id="manage_tab_salesmanager" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddSalesManager.do?TabPanelName=Manage_Panel&clear=yes">Add Sales Manager</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSalesManager.do?TabPanelName=Manage_Panel&clear=yes">Find Sales Manager</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_ALL_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../SearchSalesManager.do?TabPanelName=Manage_Panel&answer(Entity::Equals::EntityType)=<%=URLEncoder.encode("%SALESMANAGER")%>&objectType=ENTITY&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Show All Sales Managers</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					
					<!-- *******************************************Search Email************************************************ -->
			
			
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_MENU"}%>' connector='or' negated="true">						
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/EmailMenu.jsp?TabPanelName=Manage_Panel">E-Mail</a>
							<div id="manage_tab_Email" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../email/FindEmail.jsp?TabPanelName=Manage_Panel&clear=yes">Find E-Mail</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
			
			
					<!-- ************************************************************************************************************** -->
					
					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/ProductsSubMenu.jsp?TabPanelName=Manage_Panel">Product Management</a>
							<div id="manage_tab_productManagement" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/OptionsSubMenu.jsp?TabPanelName=Manage_Panel">Options</a>
											<div id="options" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddOptions.do?TabPanelName=Manage_Panel">Add Options</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindOptions.do?TabPanelName=Manage_Panel">Find Options</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../SearchOptions.do?TabPanelName=Manage_Panel">Show All Options</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/FactorsSubMenu.jsp?TabPanelName=Manage_Panel">Factors</a>
											<div id="factors" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
		                      							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FACTORS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddFactor.do?TabPanelName=Manage_Panel&clear=yes">Add Factors</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Manage_Panel&clear=yes">Find Factors</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Manage_Panel">Show All Factors</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Application Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../application/ApplicationSubMenu.jsp?TabPanelName=Manage_Panel">Applications</a>
											<div id="applications" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddAttribute.do?TabPanelName=Manage_Panel&clear=yes">Add Attributes</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAttribute.do?TabPanelName=Manage_Panel&clear=yes">Find Attributes</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddSubApplication.do?TabPanelName=Manage_Panel&clear=yes">Add Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSubApplication.do?TabPanelName=Manage_Panel&clear=yes">Find Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddApplication.do?TabPanelName=Manage_Panel&clear=yes">Add Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindApplication.do?TabPanelName=Manage_Panel&clear=yes">Find Applications</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Documents/Forms Management Menu building -->
								   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/DocumentDefinitionSubMenu.jsp?TabPanelName=Manage_Panel">Documents</a>
											<div id="productdocuments" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddDocumentDefinitionAction.do?TabPanelName=Manage_Panel&clear=yes">Add Document</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindDocumentDefinitionAction.do?TabPanelName=Manage_Panel&clear=yes">Find Document</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Products Management Menu building -->
										 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/ProductSubMenu.jsp?TabPanelName=Manage_Panel">Products</a>
											<div id="products" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddProduct.do?TabPanelName=Manage_Panel&clear=yes">Add Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.do?TabPanelName=Manage_Panel&clear=yes">Find Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.go?TabPanelName=Manage_Panel">Show All Products</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
								   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/ProductGroupSubMenu.jsp?TabPanelName=Manage_Panel">Product Groups</a>
											<div id="productGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/AddProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Add Product Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Find Product Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProductGroup.go?TabPanelName=Manage_Panel">Show All Product Groups</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										
										
										<!--  fees Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FEE_MENU"}%>' connector='or' negated="true">           							 
							 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/FeesSubMenu.jsp?TabPanelName=Manage_Panel">Fees</a>
											<div id="fees" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../feedefinition/AddFees.jsp?TabPanelName=Manage_Panel&clear=yes">Add Fee</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFeeDefinitionAction.do?TabPanelName=Manage_Panel&clear=yes">Find Fee</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
								</li>
						</dmshtml:dms_static_with_connector>
						
						<!--  tax Menu building -->
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"TAX_MENU"}%>' connector='or' negated="true">           
							 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/TaxSubMenu.jsp?TabPanelName=Manage_Panel">Taxes</a>
											<div id="tax" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../taxdefinition/AddTaxDefinition.jsp?TabPanelName=Manage_Panel&clear=yes">Add Tax</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../taxdefinition/FindTaxDefinition.jsp?TabPanelName=Manage_Panel&clear=yes">Find Tax</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
								</li>						 
						</dmshtml:dms_static_with_connector>
					
										
										
										
										<!-- Rule Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/ProductGroupSubMenu.jsp?TabPanelName=Manage_Panel">Rule Groups</a>
											<div id="ruleGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/AddRuleGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Add Rule Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindRuleGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Find Rule Groups</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Formula Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/ProductGroupSubMenu.jsp?TabPanelName=Manage_Panel">Formula Groups</a>
											<div id="formulaGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/AddFormulaGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Add Formula Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindFormulaGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Find Formula Groups</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Optons Management Menu building -->
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/BillingAndPaymentSubMenu.jsp?TabPanelName=Manage_Panel">Billing and Payment</a>
											<div id="billingAndPayment" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/BillingTypeSubMenu.jsp?TabPanelName=Manage_Panel">Billing Type</a>
																<div id="billingType" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/AddBillingType.jsp?TabPanelName=Manage_Panel">Add Billing Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/FindBillingType.jsp?TabPanelName=Manage_Panel">Find Billing Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/FindBillingTypeAction.do?TabPanelName=Manage_Panel">Show All Billing Type</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/PaymentMethodSubMenu.jsp?TabPanelName=Manage_Panel">Payment Method</a>
																<div id="paymentMethod" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/AddPaymentMethod.jsp?TabPanelName=Manage_Panel">Add Payment Method</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/FindPaymentMethod.jsp?TabPanelName=Manage_Panel">Find Payment Method</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/FindPaymentMethodAction.do?TabPanelName=Manage_Panel">Show All Payment Method</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/InstallmentTypeSubMenu.jsp?TabPanelName=Manage_Panel">Installment Type</a>
																<div id="installmentType" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/AddInstallmentType.jsp?TabPanelName=Manage_Panel">Add Installment Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/FindInstallmentType.jsp?TabPanelName=Manage_Panel">Find Installment Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/FindInstallmentTypeAction.do?TabPanelName=Manage_Panel">Show All Installment Type</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/BillingCurrencySubMenu.jsp?TabPanelName=Manage_Panel">Billing Currency</a>
																<div id="billingCurrency" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/AddBillingCurrency.jsp?TabPanelName=Manage_Panel">Add Billing Currency</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../billing/FindBillingCurrency.jsp?TabPanelName=Manage_Panel">Find Billing Currency</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/FindBillingCurrencyAction.do?TabPanelName=Manage_Panel">Show All Billing Currency</a></li>
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

									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
							
					<!-- static documents Menu building 
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../documents/Documents.jsp?TabPanelName=Manage_Panel">Documents</a>
							<div id="manage_tab_staticdocuments" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../documents/AdminForms.jsp?TabPanelName=Manage_Panel">Administrative Forms</a></li>
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../documents/BenefitAndContact.jsp?TabPanelName=Manage_Panel">Benefit Summary & Contact Info</a></li>
											<%if(strDomainName.indexOf("mica")>=0)
											{%>
												<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../documents/MicaCommissionDocuments.jsp?TabPanelName=Manage_Panel">Commission Documents</a></li>
											<%}%>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>-->			
					
					
					<!-- User Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/UserAccountSubMenu.jsp?TabPanelName=Manage_Panel">User Accounts</a>
							<div id="manage_tab_user" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddUserAccountLink.do?TabPanelName=Manage_Panel&clear=yes">Add User Accounts</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddUnderwriterEntities.do?TabPanelName=Manage_Panel&clear=yes">Add Underwriter User Accounts</a></li>										
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindUsers.do?TabPanelName=Manage_Panel&clear=yes">Find User Accounts</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					
					<!-- Alert Management Menu building -->									
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">
									<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/AlertMenu.jsp?TabPanelName=Manage_Panel">Alert Management</a>
										<div id="manage_tab_webService" class="yuimenu">
											<div class="bd">
												<ul>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
														<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/AddAlertDefinition.jsp?TabPanelName=Manage_Panel">Alert Definition</a>
															<div id="submission" class="yuimenu">
																<div class="bd">
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/AddAlertDefinition.jsp?TabPanelName=Manage_Panel">Add Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/FindAlertDefinition.jsp?TabPanelName=Manage_Panel">Find Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/DeleteAlertDefinition.jsp?TabPanelName=Manage_Panel">Delete Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/SaveAlertDefinition.jsp?TabPanelName=Manage_Panel">Update Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																</div>
															</div>
														</li>
														<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/AddAlertDefinition.jsp?TabPanelName=Manage_Panel">Alert </a>
															<div id="submission1" class="yuimenu">
																<div class="bd">
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/AddAlert.jsp?TabPanelName=Manage_Panel">Add Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/FindAlert.jsp?TabPanelName=Manage_Panel">Find Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/DeleteAlert.jsp?TabPanelName=Manage_Panel">Delete Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/SaveAlert.jsp?TabPanelName=Manage_Panel">Update Alert</a></li>
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
	
					
					<!-- Logged-in Users Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../NonInvalidatedUserLogs.do?TabPanelName=Manage_Panel&ownerId=5">Logged In Users</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Data Export Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="/Home/DataExportSubMenu.jsp?TabPanelName=Manage_Panel">Data Export</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Data Import Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_IMPORT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="/Home/DataImportSubMenu.jsp?TabPanelName=Manage_Panel">Data Import</a>
							<div id="manage_tab_dataimport" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_UPLOAD_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../dataimport/AgencyImport.jsp?TabPanelName=Manage_Panel">Agency-Upload</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_UPLOAD_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../dataimport/AgentImport.jsp?TabPanelName=Manage_Panel">Agent Upload</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>					
					<!-- Clearance Import Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_IMPORT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="/Home/ImportClearance.jsp?TabPanelName=Manage_Panel">Clearance - Import</a>
							<div id="manage_tab_clearanceimport" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_IMPORT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../clearance/ImportClearance.jsp?TabPanelName=Manage_Panel">Import Clearance File</a></li>
										</dmshtml:dms_static_with_connector>
									
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>					
					
					
			<!-- WebServices Menu building -->		
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/WebServiceSubMenu.jsp?TabPanelName=Manage_Panel">Webservice</a>
							<div id="manage_tab_webService" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../webservice/FindSubmission.jsp?TabPanelName=Manage_Panel">Submission</a>
												<div id="submission" class="yuimenu">
													<div class="bd">
														<ul class="first-of-type">
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../webservice/FindSubmission.jsp?TabPanelName=Manage_Panel">Find Submission</a></li>
															</dmshtml:dms_static_with_connector>
														</ul>
													</div>
												</div>
											</li>
										</dmshtml:dms_static_with_connector>
										
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../webservice/FindBilling.jsp?TabPanelName=Manage_Panel">Billing</a>
												<div id="billing" class="yuimenu">
													<div class="bd">
														<ul class="first-of-type">
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
																<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../webservice/FindBilling.jsp?TabPanelName=Manage_Panel">Find Billing</a></li>
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
	 
	 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem first-of-type"><a class="yuimenubaritemlabel" href="../Home/GeneralAgencySubMenu.jsp?TabPanelName=Manage_Panel"><bean:message key="AdminMenu.GeneralAgencies" /></a>
						<div id="manage_tab_generalAgency" class="yuimenu">
							<div class="bd">
								<ul>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../GeneralAgencyLink.do?TabPanelName=Manage_Panel&clear=yes">Add General Agency</a></li>
									</dmshtml:dms_static_with_connector>

									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindGenaralAgencyAction.do?TabPanelName=Manage_Panel&clear=yes">Find General Agency</a></li>
									</dmshtml:dms_static_with_connector>
								</ul>
							</div>
						</div>
						</li>
		</dmshtml:dms_static_with_connector>
		
	 <!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/AgencySubMenu.jsp?TabPanelName=Manage_Panel">Agencies</a>
							<div id="manage_tab_agency" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AgencyLink.do?TabPanelName=Manage_Panel&clear=yes">Add Agency</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAgencyAction.do?TabPanelName=Manage_Panel&clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/AgentSubMenu.jsp?TabPanelName=Manage_Panel">Agents</a>
							<div id="manage_tab_agent" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddAgents.do?TabPanelName=Manage_Panel&clear=yes">Add Agent</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAgent.do?TabPanelName=Manage_Panel&clear=yes">Find Agent</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/SalesManagerSubMenu.jsp?TabPanelName=Manage_Panel">Sales Managers</a>
							<div id="manage_tab_salesmanager" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddSalesManager.do?TabPanelName=Manage_Panel&clear=yes">Add Sales Manager</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSalesManager.do?TabPanelName=Manage_Panel&clear=yes">Find Sales Manager</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_ALL_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../SearchSalesManager.do?TabPanelName=Manage_Panel&answer(Entity::Equals::EntityType)=<%=URLEncoder.encode("%SALESMANAGER")%>&objectType=ENTITY&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Show All Sales Managers</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					
					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/ProductsSubMenu.jsp?TabPanelName=Manage_Panel">Product Management</a>
							<div id="manage_tab_productManagement" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/OptionsSubMenu.jsp?TabPanelName=Manage_Panel">Options</a>
											<div id="options" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddOptions.do?TabPanelName=Manage_Panel">Add Options</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindOptions.do?TabPanelName=Manage_Panel">Find Options</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../SearchOptions.do?TabPanelName=Manage_Panel">Show All Options</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/FactorsSubMenu.jsp?TabPanelName=Manage_Panel">Factors</a>
											<div id="factors" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
		                      							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FACTORS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddFactor.do?TabPanelName=Manage_Panel&clear=yes">Add Factors</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Manage_Panel&clear=yes">Find Factors</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindFactor.do?TabPanelName=Manage_Panel">Show All Factors</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Application Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../application/ApplicationSubMenu.jsp?TabPanelName=Manage_Panel">Applications</a>
											<div id="applications" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddAttribute.do?TabPanelName=Manage_Panel&clear=yes">Add Attributes</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindAttribute.do?TabPanelName=Manage_Panel&clear=yes">Find Attributes</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddSubApplication.do?TabPanelName=Manage_Panel&clear=yes">Add Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSubApplication.do?TabPanelName=Manage_Panel&clear=yes">Find Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddApplication.do?TabPanelName=Manage_Panel&clear=yes">Add Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindApplication.do?TabPanelName=Manage_Panel&clear=yes">Find Applications</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/ProductSubMenu.jsp?TabPanelName=Manage_Panel">Products</a>
											<div id="products" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddProduct.do?TabPanelName=Manage_Panel&clear=yes">Add Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.do?TabPanelName=Manage_Panel&clear=yes">Find Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProduct.go?TabPanelName=Manage_Panel">Show All Products</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
								   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/ProductGroupSubMenu.jsp?TabPanelName=Manage_Panel">Product Groups</a>
											<div id="productGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/AddProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Add Product Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../product/FindProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes">Find Product Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindProductGroup.go?TabPanelName=Manage_Panel">Show All Product Groups</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/DocumentDefinitionSubMenu.jsp?TabPanelName=Manage_Panel">Documents</a>
											<div id="productdocuments" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddDocumentDefinitionAction.do?TabPanelName=Manage_Panel&clear=yes">Add Document</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindDocumentDefinitionAction.do?TabPanelName=Manage_Panel&clear=yes">Find Document</a></li>
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
					<!-- User Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../Home/UserAccountSubMenu.jsp?TabPanelName=Manage_Panel">User Accounts</a>
							<div id="manage_tab_user" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddUserAccountLink.do?TabPanelName=Manage_Panel&clear=yes">Add User Accounts</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindUsers.do?TabPanelName=Manage_Panel&clear=yes">Find User Accounts</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Logged-in Users Menu building -->
					<!-- Logged-in Users Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../NonInvalidatedUserLogs.do?TabPanelName=Manage_Panel&ownerId=5">Logged In Users</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Data Export Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/Home/DataExportSubMenu.jsp?TabPanelName=Manage_Panel">Data Export</a>
						<div id="productdocuments" class="yuimenu">
							<div class="bd">
								<ul class="first-of-type">
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_RATECARD_MENU"}%>' connector='or' negated="true">
										<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../export/RateCard.jsp?TabPanelName=Manage_Panel">Renewal Rate Card</a></li>
									</dmshtml:dms_static_with_connector>
								</ul>
							</div>
						</div>
						</li>
					</dmshtml:dms_static_with_connector>
					
					
	 
	 <%} %>
	 				
					<!-- Change Password Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_PASSWORD"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../ChangePassword.do?TabPanelName=Manage_Panel&entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>">Change Password</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../LoginOutAction.do"><bean:message key="AdminMenu.LogOff"/></a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.LogOff"/> -->

					</ul>
				</div>
			</div>

</td>
</tr>
</table>
