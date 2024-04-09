	function init(text,header) {

		var Event = YAHOO.util.Event,
			Dom = YAHOO.util.Dom;

			var handleOK = function() {
				this.cancel();
				return false;
			};
			oPanel3 = new YAHOO.widget.SimpleDialog("panel-3", {

				modal: true,
				//icon: YAHOO.widget.SimpleDialog.ICON_INFO,
				visible: false,
				fixedcenter: true,
				constraintoviewport: true,
				width: "300px",
				role: "alertdialog",
				buttons: [ { text:"OK", handler:handleOK, isDefault:true } ],
				text: text

			});

			oPanel3.setHeader(header);
			oPanel3.render(document.body);

	}
//YAHOO.util.Event.onDOMReady(init);