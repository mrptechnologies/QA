﻿/****************************************************************************
Copyright (C) 2005 Macromedia, Inc. All Rights Reserved.
The following is Sample Code and is subject to all restrictions on
such code as contained in the End User License Agreement accompanying
this product.
Class: CheckBoxCell
Description: Example of a class that can be assigned as a cell renderer to a list
type component -- in this case, a cell of a DataGrid.  This cellRenderer class
displays a CheckBox component.
****************************************************************************/

import mx.core.UIComponent
import mx.controls.CheckBox

class CheckBoxDelCurrentPriorDG extends UIComponent
{

	private var chkBoxDelCurPriorDG : MovieClip;
	private var currentPrior_dataGrid : MovieClip; 		// the reference we receive to the list
	private var getCellIndex : Function; 	// the function we receive from the list
	private var	getDataLabel : Function; 	// the function we receive from the list
	
	private static var PREFERRED_HEIGHT = 16; 	// The preferred height of the cell containing the ComboBox.
	private static var PREFERRED_WIDTH = 20; 	// The preferred width of the cell containing the Combobox.

	// Constructor:  Should be empty.
	public function CheckBoxDelCurrentPriorDG()
	{
	}

	/* UIObject expects you to fill in createChildren by instantiating
	all the movie clip assets you might need upon initialization. 
	In this case we are creating one label
	public function createChildren(Void) : Void
	{
		check = createObject("CheckBox", "check", 1, {styleName:this, owner:this});
		check.addEventListener("click", this);
		size();
	}*/

	/* Note: setSize is implemented by UIComponent and calls size(), after setting
	__width and __height.  You can use __width and __height to determine how to size
	the cell contents. */
	public function size(Void) : Void
	{trace("Entered Size");
		chkBoxDelCurPriorDG.setSize(PREFERRED_WIDTH, PREFERRED_WIDTH);
		chkBoxDelCurPriorDG._x = (__width - PREFERRED_WIDTH)/2;
		chkBoxDelCurPriorDG._y = (__height - PREFERRED_HEIGHT)/2;
	}

	// Called by the owner to set the value in the cell.  Inherited method.
	public function setValue(str:String, item:Object, sel:Boolean) : Void
	{trace("Entered setValue");
		/* Note:If item is undefined, nothing should be rendered in the cell, 
		so set the label as invisible. Note: For scrolling List type components
		like a scrolling datagrid, the cells are intended to be empty as they scroll
		just out of sight, and then the cell is reused again and set to a new value 
		producing an animated effect of scrolling.  For this reason, you cannot rely on
		any one cell always having data to show or the same value.*/
		chkBoxDelCurPriorDG._visible = (item!=undefined);
		chkBoxDelCurPriorDG.selected = item[getDataLabel()];
	}

	public function getPreferredHeight(Void) : Number
	{trace("getPreferredHeight entered");
		return PREFERRED_HEIGHT;
	}

	public function getPreferredWidth(Void) : Number
	{trace("getPreferredWidth entered");
		return PREFERRED_WIDTH;
	}

	public function click()
	{trace("Entered click");
		currentPrior_dataGrid.dataProvider.editField(getCellIndex().itemIndex, getDataLabel(), chkBoxDelCurPriorDG.selected);
	}

}
