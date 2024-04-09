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

            YAHOO.util.Event.onContentReady("submission_tab_menu", function () {

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

                var oMenuBar = new YAHOO.widget.MenuBar("submission_tab_menu", {
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
//
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
			var divObj = $('Submission_Panel');
//			alert(url);
			try {
				new Ajax.Updater(
					"Submission_Panel",
					url,
					{
						method: "get",
						onComplete: function(){
						if(document.getElementById("Submission_Panel") != null && document.getElementById("Submission_Panel") != undefined) {
							forwardToLoginPageIfInvalidSession(document.getElementById("Submission_Panel").innerHTML);
						}
								//Do something
							}
					}
				);

			}
			catch (oException) {
				alert("error");
			}
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
	   <div id="submission_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				<%if(insType.equals("PC")) {%>
					<!-- Submission Management Menu building -->  <!-- submission home page add= AddSubmission.do -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../CheckClearanceAction.do?TabPanelName=Submission_Panel&clear=yes">Create Submission</a></li> 
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindSubmissionNBF.do?TabPanelName=Submission_Panel&clear=yes">Find Submission</a></li>
					</dmshtml:dms_static_with_connector>
					
				 <%}else if(insType.equals("Health")){%>
				 
				 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddCustomers.do?TabPanelName=Insured_Panel&clear=yes">Add Employer Group</a></li>
					</dmshtml:dms_static_with_connector>
					
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_ADD_APPLICATION"}%>' connector='or' negated="true">
							<li class="yuimenuitem"><a href="../AddCustomersApplication.do?TabPanelName=Insured_Panel&clear=yes">Add Employer Group</a></li>
					</dmshtml:dms_static_with_connector>

					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindCustomers.do?TabPanelName=Insured_Panel&clear=yes">Find Employer Group</a></li>
					</dmshtml:dms_static_with_connector>
					
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="true">
					 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../GetCustomerAction.do?TabPanelName=Insured_Panel">Employer Detail</a></li>
					</dmshtml:dms_static_with_connector>
					
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CENSUS"}%>' connector='or' negated="true">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="false">
					 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../GetEmployerHome.do?TabPanelName=Insured_Panel">Employee Detail</a></li>
					 </dmshtml:dms_static_with_connector>
					</dmshtml:dms_static_with_connector>										
					
				 	 <%} else if(insType.equals("Professional Liability")) {%>
					<!-- Insured Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER_DETAILS"}%>' connector='or' negated="true">
					<li class="yuimenuitem"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=strPrimObjId%>" >Insured Details
					</a></li>
					</dmshtml:dms_static_with_connector>
					
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../AddInsured.do?TabPanelName=Insured_Panel&clear=yes">Add Insured</a></li>
					</dmshtml:dms_static_with_connector>

					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../FindInsured.do?TabPanelName=Insured_Panel&clear=yes">Find Insured</a></li>
					</dmshtml:dms_static_with_connector>
					<!-- static documents Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenubaritem"><a class="yuimenubaritemlabel" href="../documents/Documents.jsp?TabPanelName=Insured_Panel">Documents</a>
							<div id="insured_tab_staticdocuments" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../documents/AdminForms.jsp?TabPanelName=Insured_Panel">Administrative Forms</a></li>
											<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../documents/BenefitAndContact.jsp?TabPanelName=Insured_Panel">Benefit Summary & Contact Info</a></li>
											<%if(strDomainName.indexOf("mica")>=0)
											{%>
												<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../documents/MicaCommissionDocuments.jsp?TabPanelName=Insured_Panel">Commission Documents</a></li>
											<%}%>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<%} %>
				 
				 <!-- Change Password Menu building  -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_CUSTOMER_PASSWORD"}%>' connector='or' negated="true">						
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../ChangePassword.do?TabPanelName=Insured_Panel&entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>">Change Password</a>
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
