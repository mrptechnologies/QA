var tree1;
function locationTree() {
	var treeInit = function() {
		tree1 = new YAHOO.widget.TreeView("LOCATION_LIST_TREE");
		tree1.render();

	};

	//Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(treeInit);
}