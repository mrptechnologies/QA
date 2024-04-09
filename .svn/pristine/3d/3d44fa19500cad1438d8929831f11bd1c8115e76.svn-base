YAHOO.example.ACFlatData = new function(){
    // Define a custom formatter function
    this.fnCustomFormatter = function(oResultItem, sQuery) {
        var sKey = oResultItem[0];
        var nPrice = oResultItem[1];
        var nQuantity = oResultItem[2];
        var nAmount = oResultItem[3];
        var sKeyQuery = sKey.substr(0, sQuery.length);
        var sKeyRemainder = sKey.substr(sQuery.length);
        var aMarkup = ["<div class='sample-result'><div class='sample-quantity'>",
            nQuantity,
            "</div><span class='sample-query'>",
            sKeyQuery,
            "</span>",
            sKeyRemainder,
            "</div>"];
        return (aMarkup.join(""));
    };
    // Instantiate one XHR DataSource and define schema as an array:
    //     ["Record Delimiter",
    //     "Field Delimiter"]
    this.oACDS = new YAHOO.widget.DS_XHR("/common/list.jsp", ["\n", "\t", "\t", "\t"]);
    this.oACDS.responseType = YAHOO.widget.DS_XHR.TYPE_FLAT;
    this.oACDS.maxCacheEntries = 60;
    this.oACDS.queryMatchSubset = true;

    // Instantiate first AutoComplete
    this.oAutoComp0 = new YAHOO.widget.AutoComplete('agencySearch','agencySearchResultList',this.oACDS);
    this.oAutoComp0.delimChar = ";";
    this.oAutoComp0.queryDelay = 0;
    this.oAutoComp0.formatResult = this.fnCustomFormatter;
};


YAHOO.example.ACFlatData = new function(){
    // Define a custom formatter function
    this.fnCustomFormatter = function(oResultItem, sQuery) {
        var sKey = oResultItem[0];
        var nPrice = oResultItem[1];
        var nQuantity = oResultItem[2];
        var nAmount = oResultItem[3];
        var sKeyQuery = sKey.substr(0, sQuery.length);
        var sKeyRemainder = sKey.substr(sQuery.length);
        var aMarkup = ["<div class='sample-result'><div class='sample-quantity'>",
            nQuantity,
            "</div><span class='sample-query'>",
            sKeyQuery,
            "</span>",
            sKeyRemainder,
            "</div>"];
        return (aMarkup.join(""));
    };
    // Instantiate one XHR DataSource and define schema as an array:
    //     ["Record Delimiter",
    //     "Field Delimiter"]
    this.oACDS = new YAHOO.widget.DS_XHR("/SearchZipCode.do", ["\n", "\t", "\t", "\t"]);
    this.oACDS.responseType = YAHOO.widget.DS_XHR.TYPE_FLAT;
    this.oACDS.maxCacheEntries = 60;
    this.oACDS.queryMatchSubset = true;

    // Instantiate first AutoComplete
    this.oAutoComp0 = new YAHOO.widget.AutoComplete('Zip','zipSearchResultList',this.oACDS);
    this.oAutoComp0.delimChar = ";";
    this.oAutoComp0.queryDelay = 0;
    this.oAutoComp0.formatResult = this.fnCustomFormatter;
};

/*******************

YAHOO.example.statesArray = [
    "Alabama",
    "Alaska",
    "California",
    "Wisconsin",
    "Wyoming"
];

YAHOO.example.areacodesArray = [
    ["201", "New Jersey"],
    ["202", "Washington, DC"],
    ["203", "Connecticut"],
    ["975", "Missouri"],
    ["978", "Massachusetts"],

    ["979", "Texas"],
    ["980", "North Carolina"],
    ["984", "North Carolina"],
    ["985", "Louisiana"],
    ["989", "Michigan"]
];




YAHOO.example.ACJSArray = new function() {
    // Instantiate first JS Array DataSource
    this.oACDS = new YAHOO.widget.DS_JSArray(YAHOO.example.statesArray);

    // Instantiate first AutoComplete
    this.oAutoComp = new YAHOO.widget.AutoComplete('statesinput','statescontainer', this.oACDS);
  //  this.oAutoComp.prehighlightClassName = "yui-ac-prehighlight";
    this.oAutoComp0.delimChar = ";";
    this.oAutoComp0.queryDelay = 0;
    this.oAutoComp0.formatResult = this.fnCustomFormatter;

    this.oAutoComp.typeAhead = true;
    this.oAutoComp.useShadow = true;
    this.oAutoComp.minQueryLength = 0;
    this.oAutoComp.textboxFocusEvent.subscribe(function(){
        var sInputValue = YAHOO.util.Dom.get('statesinput').value;
        if(sInputValue.length === 0) {
            var oSelf = this;
            setTimeout(function(){oSelf.sendQuery(sInputValue);},0);
        }
    });

    // Instantiate second JS Array DataSource
    this.oACDS2 = new YAHOO.widget.DS_JSArray(YAHOO.example.areacodesArray);

    // Instantiate second AutoComplete
    this.oAutoComp2 = new YAHOO.widget.AutoComplete('statesinput2','statescontainer2', this.oACDS2);
    this.oAutoComp2.prehighlightClassName = "yui-ac-prehighlight";
    this.oAutoComp2.typeAhead = true;
    this.oAutoComp2.useShadow = true;
    this.oAutoComp2.forceSelection = true;
    this.oAutoComp2.formatResult = function(oResultItem, sQuery) {
        //var sMarkup = oResultItem[0] + " (" + oResultItem[1] + ")";
        var sMarkup = ["<div class='sample-result'><div class='sample-quantity'>",
            oResultItem[0],
            "</div><span class='sample-query'>",
            oResultItem[1],
            "</span>",
            oResultItem[1],
            "</div>"];
        return (sMarkup);
    };
};

***********/
