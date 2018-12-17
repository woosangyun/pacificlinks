
(function($)
{
	var fixCellIndexes = function(table) 
	{
		var rows = table.rows;
		var len = rows.length;
		var matrix = [];
		for ( var i = 0; i < len; i++ )
		{
			var cells = rows[i].cells;
			var clen = cells.length;
			for ( var j = 0; j < clen; j++ )
			{
				var c = cells[j];
				var rowSpan = c.rowSpan || 1;
				var colSpan = c.colSpan || 1;
				var firstAvailCol = -1;
				if ( !matrix[i] )
				{ 
					matrix[i] = []; 
				}
				var m = matrix[i];
				// Find first available column in the first row
				while ( m[++firstAvailCol] ) {}
				c.realIndex = firstAvailCol;
				for ( var k = i; k < i + rowSpan; k++ )
				{
					if ( !matrix[k] )
					{ 
						matrix[k] = []; 
					}
					var matrixrow = matrix[k];
					for ( var l = firstAvailCol; l < firstAvailCol + colSpan; l++ )
					{
						matrixrow[l] = 1;
					}
				}
			}
		}
	};

	var fixRowIndexes = function(tbl) 
	{
		var v = 0, i, k, r = ( tbl.tHead ) ? tbl.tHead.rows : 0;
		if ( r )
		{
			for ( i = 0; i < r.length; i++ )
			{
				r[i].realRIndex = v++;
			}
		}
		for ( k = 0; k < tbl.tBodies.length; k++ )
		{
			r = tbl.tBodies[k].rows;
			if ( r )
			{
				for ( i = 0; i < r.length; i++ )
				{
					r[i].realRIndex = v++;
				}
			}
		}
		r = ( tbl.tFoot ) ? tbl.tFoot.rows : 0;
		if ( r )
		{
			for ( i = 0; i < r.length; i++ )
			{
				r[i].realRIndex = v++;
			}
		}
	};

	$.fn.tableHover = function(options)
	{
		var settings = $.extend({
				allowHead : true,
				allowBody : true,
				allowFoot : true,

				headRows : false,
				bodyRows : true,
				footRows : false,
				spanRows : true,

				headCols : false,
				bodyCols : true,
				footCols : false,
				spanCols : true,
				ignoreCols : [],

				headCells : false,
				bodyCells : true,
				footCells : false,
				//css classes,,
				rowClass : 'hover',
				colClass : '',
				cellClass : '',
				clickClass : ''
			}, options);

		return this.each(function() 
        {
			var colIndex = [], rowIndex = [], tbl = this, r, rCnt = 0, lastClick = [-1, -1];

			if ( !tbl.tBodies || !tbl.tBodies.length )
			{
				return;
			}

			var addToIndex = function(rows, nodeName)
			{
				var c, row, rowI, cI, rI, s;
				//loop through the rows
				for ( rowI = 0; rowI < rows.length; rowI++, rCnt++ )
				{
					row = rows[rowI];
					//each cell
					for ( cI = 0; cI < row.cells.length; cI++ )
					{
						c = row.cells[cI];
						//add to rowindex
						if ( (nodeName == 'TBODY' && settings.bodyRows) 
							|| (nodeName == 'TFOOT' && settings.footRows) 
							|| (nodeName == 'THEAD' && settings.headRows) )
						{
							s = c.rowSpan;
							while ( --s >= 0 )
							{
								rowIndex[rCnt + s].push(c);
							}
						}
						//add do colindex
						if ( (nodeName == 'TBODY' && settings.bodyCols)
								|| (nodeName == 'THEAD' && settings.headCols) 
								|| (nodeName == 'TFOOT' && settings.footCols) )
						{
							s = c.colSpan;
							while ( --s >= 0 )
							{
								rI = c.realIndex + s;
								if ( $.inArray(rI + 1, settings.ignoreCols) > -1 )
								{
									break;//dont highlight the columns in the ignoreCols array
								}
								if ( !colIndex[rI] )
								{
									colIndex[rI] = [];
								}
								colIndex[rI].push(c);
							}
						}
						//allow hover for the cell?
						if ( (nodeName == 'TBODY' && settings.allowBody) 
								|| (nodeName == 'THEAD' && settings.allowHead) 
								|| (nodeName == 'TFOOT' && settings.allowFoot) )
						{
							c.thover = true;
						}
					}
				}
			};

			// Mouseover event handling. Set the highlight to the rows/cells.
			var over = function(e)
			{
				var p = e.target;
				while ( p != this && p.thover !== true )
				{
					p = p.parentNode;
				}
				if ( p.thover === true )
				{
					highlight(p, true);
				}
			};

			// Mouseover event handling. Set the highlight to the rows/cells.
			var out = function(e)
			{
				var p = e.target;
				while ( p != this && p.thover !== true )
				{
					p = p.parentNode;
				}
				if ( p.thover === true )
				{
					highlight(p, false);
				}
			};
			
			 // Mousedown event handling. Sets or removes the clickClass css style to the currently highlighted rows/cells.
			var click = function(e)
			{
				var t = e.target;
				while ( t && t != tbl && !t.thover ) //search the real target
					t = t.parentNode;
				if ( t.thover && settings.clickClass != '' )
				{
					var x = t.realIndex, y = t.parentNode.realRIndex, s = '';
					//unclick
					$('td.' + settings.clickClass + ', th.' + settings.clickClass, tbl).removeClass(settings.clickClass);
					if ( x != lastClick[0] || y != lastClick[1] )
					{
						//click..
						if ( settings.rowClass != '' )
						{
							s += ',.' + settings.rowClass;
						}
						if ( settings.colClass != '' )
						{
							s += ',.' + settings.colClass;
						}
						if ( settings.cellClass != '' )
						{
							s += ',.' + settings.cellClass;
						}
						if ( s != '' )
						{
							$('td, th', tbl).filter(s.substring(1)).addClass(settings.clickClass);
						}
						lastClick = [x, y];
					}
					else
					{
						lastClick = [-1, -1];
					}
				}
			};

			var highlight = function(cell, on)
			{
				if ( on ) //create dummy funcs - dont want to test for on==true all the time
				{
					$.fn.tableHoverHover = $.fn.addClass;
				}
				else
				{
					$.fn.tableHoverHover = $.fn.removeClass;
				}
				//highlight columns
				var h = colIndex[cell.realIndex] || [], rH = [], i = 0, rI, nn;
				if ( settings.colClass != '' )
				{
					while ( settings.spanCols && ++i < cell.colSpan && colIndex[cell.realIndex + i] )
					{
						h = h.concat(colIndex[cell.realIndex + i]);
					}
					$(h).tableHoverHover(settings.colClass);
				}
				//highlight rows
				if ( settings.rowClass != '' )
				{
					rI = cell.parentNode.realRIndex;
					if ( rowIndex[rI] )
					{
						rH = rH.concat(rowIndex[rI]);
					}
					i = 0;
					while ( settings.spanRows && ++i < cell.rowSpan )
					{
						if ( rowIndex[rI + i] )
						{
							rH = rH.concat(rowIndex[rI + i]);
						}
					}
					$(rH).tableHoverHover(settings.rowClass);
				}
				//highlight cell
				if ( settings.cellClass != '' )
				{
					nn = cell.parentNode.parentNode.nodeName.toUpperCase();
					if ( (nn == 'TBODY' && settings.bodyCells)
							|| (nn == 'THEAD' && settings.headCells)
							|| (nn == 'TFOOT' && settings.footCells) )
					{
						$(cell).tableHoverHover(settings.cellClass);
					}
				}
			};

			fixCellIndexes(tbl);
			fixRowIndexes(tbl);

			//init rowIndex
			for ( r = 0; r < tbl.rows.length; r++ )
			{
				rowIndex[r] = [];
			}
			//add header cells to index
			if ( tbl.tHead )
			{
				addToIndex(tbl.tHead.rows, 'THEAD');
			}
			//create index - loop through the bodies
			for ( r = 0; r < tbl.tBodies.length; r++ )
			{
				addToIndex(tbl.tBodies[r].rows, 'TBODY');
			}
			//add footer cells to index
			if ( tbl.tFoot )
			{
				addToIndex(tbl.tFoot.rows, 'TFOOT');
			}
			$(this).bind('mouseover', over).bind('mouseout', out).click(click);
		});
	};
})(jQuery);


function SortableTable(oTable, oSortTypes) {

    this.sortTypes = oSortTypes || [];

    this.sortColumn = null;
    this.descending = null;

    var oThis = this;
    this._headerOnclick = function (e) {
        oThis.headerOnclick(e);
    };

    if (oTable) {
        this.setTable( oTable );
        this.document = oTable.ownerDocument || oTable.document;
    }
    else {
        this.document = document;
    }


    // only IE needs this
    var win = this.document.defaultView || this.document.parentWindow;
    this._onunload = function () {
        oThis.destroy();
    };
    if (win && typeof win.attachEvent != "undefined") {
        win.attachEvent("onunload", this._onunload);
    }
}

SortableTable.gecko = navigator.product == "Gecko";
SortableTable.msie = /msie/i.test(navigator.userAgent);
// Mozilla is faster when doing the DOM manipulations on
// an orphaned element. MSIE is not
SortableTable.removeBeforeSort = SortableTable.gecko;

SortableTable.prototype.onsort = function () {};

// default sort order. true -> descending, false -> ascending
SortableTable.prototype.defaultDescending = false;

// shared between all instances. This is intentional to allow external files
// to modify the prototype
SortableTable.prototype._sortTypeInfo = {};

SortableTable.prototype.setTable = function (oTable) {
    if ( this.tHead )
        this.uninitHeader();
    this.element = oTable;
    this.setTHead( oTable.tHead );
    this.setTBody( oTable.tBodies[0] );
};

SortableTable.prototype.setTHead = function (oTHead) {
    if (this.tHead && this.tHead != oTHead )
        this.uninitHeader();
    this.tHead = oTHead;
    this.initHeader( this.sortTypes );
};

SortableTable.prototype.setTBody = function (oTBody) {
    this.tBody = oTBody;
};

SortableTable.prototype.setSortTypes = function ( oSortTypes ) {
    if ( this.tHead )
        this.uninitHeader();
    this.sortTypes = oSortTypes || [];
    if ( this.tHead )
        this.initHeader( this.sortTypes );
};

// adds arrow containers and events
// also binds sort type to the header cells so that reordering columns does
// not break the sort types
SortableTable.prototype.initHeader = function (oSortTypes) {
    if (!this.tHead) return;
    var cells = this.tHead.rows[0].cells;
    var doc = this.tHead.ownerDocument || this.tHead.document;
    this.sortTypes = oSortTypes || [];
    var l = cells.length;
    var img, c;
    for (var i = 0; i < l; i++) {
        c = cells[i];
        if (this.sortTypes[i] != null && this.sortTypes[i] != "None") {
            img = doc.createElement("IMG");
            //img.src = "blank.png";
            //c.appendChild(img);
            if (this.sortTypes[i] != null)
                c._sortType = this.sortTypes[i];
            if (typeof c.addEventListener != "undefined")
                c.addEventListener("click", this._headerOnclick, false);
            else if (typeof c.attachEvent != "undefined")
                c.attachEvent("onclick", this._headerOnclick);
            else
                c.onclick = this._headerOnclick;
        }
        else
        {
            c.setAttribute( "_sortType", oSortTypes[i] );
            c._sortType = "None";
        }
    }
    this.updateHeaderArrows();
};

// remove arrows and events
SortableTable.prototype.uninitHeader = function () {
    if (!this.tHead) return;
    var cells = this.tHead.rows[0].cells;
    var l = cells.length;
    var c;
    for (var i = 0; i < l; i++) {
        c = cells[i];
        if (c._sortType != null && c._sortType != "None") {
            c.removeChild(c.lastChild);
            if (typeof c.removeEventListener != "undefined")
                c.removeEventListener("click", this._headerOnclick, false);
            else if (typeof c.detachEvent != "undefined")
                c.detachEvent("onclick", this._headerOnclick);
            c._sortType = null;
            c.removeAttribute( "_sortType" );
        }
    }
};

SortableTable.prototype.updateHeaderArrows = function () {
};

SortableTable.prototype.headerOnclick = function (e) {
    // find TD element
    var el = e.target || e.srcElement;
    while (el.tagName != "TD")
        el = el.parentNode;

    this.sort(SortableTable.msie ? SortableTable.getCellIndex(el) : el.cellIndex);
};

// IE returns wrong cellIndex when columns are hidden
SortableTable.getCellIndex = function (oTd) {
    var cells = oTd.parentNode.childNodes
    var l = cells.length;
    var i;
    for (i = 0; cells[i] != oTd && i < l; i++)
        ;
    return i;
};

SortableTable.prototype.getSortType = function (nColumn) {
    return this.sortTypes[nColumn] || "String";
};

// only nColumn is required
// if bDescending is left out the old value is taken into account
// if sSortType is left out the sort type is found from the sortTypes array

SortableTable.prototype.sort = function (nColumn, bDescending, sSortType) {
    if (!this.tBody) return;
    if (sSortType == null)
        sSortType = this.getSortType(nColumn);

    // exit if None
    if (sSortType == "None")
        return;

    if (bDescending == null) {
        if (this.sortColumn != nColumn)
            this.descending = this.defaultDescending;
        else
            this.descending = !this.descending;
    }
    else
        this.descending = bDescending;

    this.sortColumn = nColumn;

    if (typeof this.onbeforesort == "function")
        this.onbeforesort();

    var f = this.getSortFunction(sSortType, nColumn);
    var a = this.getCache(sSortType, nColumn);
    var tBody = this.tBody;

    a.sort(f);

    if (this.descending)
        a.reverse();

    if (SortableTable.removeBeforeSort) {
        // remove from doc
        var nextSibling = tBody.nextSibling;
        var p = tBody.parentNode;
        p.removeChild(tBody);
    }

    // insert in the new order
    var l = a.length;
    for (var i = 0; i < l; i++)
        tBody.appendChild(a[i].element);

    if (SortableTable.removeBeforeSort) {
        // insert into doc
        p.insertBefore(tBody, nextSibling);
    }

    this.updateHeaderArrows();

    this.destroyCache(a);

    if (typeof this.onsort == "function")
        this.onsort();
};

SortableTable.prototype.asyncSort = function (nColumn, bDescending, sSortType) {
    var oThis = this;
    this._asyncsort = function () {
        oThis.sort(nColumn, bDescending, sSortType);
    };
    window.setTimeout(this._asyncsort, 1);
};

SortableTable.prototype.getCache = function (sType, nColumn) {
    if (!this.tBody) return [];
    var rows = this.tBody.rows;
    var l = rows.length;
    var a = new Array(l);
    var r;
    for (var i = 0; i < l; i++) {
        r = rows[i];
        a[i] = {
            value:        this.getRowValue(r, sType, nColumn),
            element:    r
        };
    };
    return a;
};

SortableTable.prototype.destroyCache = function (oArray) {
    var l = oArray.length;
    for (var i = 0; i < l; i++) {
        oArray[i].value = null;
        oArray[i].element = null;
        oArray[i] = null;
    }
};

SortableTable.prototype.getRowValue = function (oRow, sType, nColumn) {
    // if we have defined a custom getRowValue use that
    if (this._sortTypeInfo[sType] && this._sortTypeInfo[sType].getRowValue)
        return this._sortTypeInfo[sType].getRowValue(oRow, nColumn);

    var s;
    var c = oRow.cells[nColumn];
    if (typeof c.innerText != "undefined")
        s = c.innerText;
    else
        s = SortableTable.getInnerText(c);
    return this.getValueFromString(s, sType);
};

SortableTable.getInnerText = function (oNode) {
    var s = "";
    var cs = oNode.childNodes;
    var l = cs.length;
    for (var i = 0; i < l; i++) {
        switch (cs[i].nodeType) {
            case 1: //ELEMENT_NODE
                s += SortableTable.getInnerText(cs[i]);
                break;
            case 3:    //TEXT_NODE
                s += cs[i].nodeValue;
                break;
        }
    }
    return s;
};

SortableTable.prototype.getValueFromString = function (sText, sType) {
    if (this._sortTypeInfo[sType])
        return this._sortTypeInfo[sType].getValueFromString( sText );
    return sText;
    };

SortableTable.prototype.getSortFunction = function (sType, nColumn) {
    if (this._sortTypeInfo[sType])
        return this._sortTypeInfo[sType].compare;
    return SortableTable.basicCompare;
};

SortableTable.prototype.destroy = function () {
    this.uninitHeader();
    var win = this.document.parentWindow;
    if (win && typeof win.detachEvent != "undefined") {    // only IE needs this
        win.detachEvent("onunload", this._onunload);
    }
    this._onunload = null;
    this.element = null;
    this.tHead = null;
    this.tBody = null;
    this.document = null;
    this._headerOnclick = null;
    this.sortTypes = null;
    this._asyncsort = null;
    this.onsort = null;
};

SortableTable.prototype.addSortType = function (sType, fGetValueFromString, fCompareFunction, fGetRowValue) {
    this._sortTypeInfo[sType] = {
        type:                sType,
        getValueFromString:    fGetValueFromString || SortableTable.idFunction,
        compare:            fCompareFunction || SortableTable.basicCompare,
        getRowValue:        fGetRowValue
    };
};

// this removes the sort type from all instances of SortableTable
SortableTable.prototype.removeSortType = function (sType) {
    delete this._sortTypeInfo[sType];
};

SortableTable.basicCompare = function compare(n1, n2) {
    if (n1.value < n2.value)
        return -1;
    if (n2.value < n1.value)
        return 1;
    return 0;
};

SortableTable.idFunction = function (x) {
    return x;
};

SortableTable.toUpperCase = function (s) {
    return s.toUpperCase();
};

SortableTable.toDate = function (s) {
    var parts = s.split("-");
    var d = new Date(0);
    d.setFullYear(parts[0]);
    d.setDate(parts[2]);
    d.setMonth(parts[1] - 1);
    return d.valueOf();
};


// add sort types
SortableTable.prototype.addSortType("Number", Number);
SortableTable.prototype.addSortType("CaseInsensitiveString", SortableTable.toUpperCase);
SortableTable.prototype.addSortType("Date", SortableTable.toDate);
SortableTable.prototype.addSortType("String");
// None is a special case

/* accordion */
$(document).ready(function(){
$('.acc_container').hide(); //Hide/close all containers


$('.acc_trigger').click(function(){
 if( $(this).next().is(':hidden') ) { //If immediate next container is closed...
  $(this).toggleClass('active').next().slideDown(); //Add .faq_q class to clicked trigger and slide down the immediate next container
 }else {
  $(this).removeClass('active').next().slideUp();
 }
 return false; //Prevent the browser jump to the link anchor
});

});

$(function(){
	var strp =''+ 
		'<ul class="clearfix pattern">'+
			'<li><a href="tab.html">tab</a></li>'+
			'<li><a href="btn.html">button</a></li>'+
			'<li><a href="list.html">list</a></li>'+
			'<li><a href="paging.html">paging</a></li>'+
			'<li><a href="pop.html">popup</a></li>'+
			'<li><a href="step.html">step</a></li>'+
			'<li><a href="table.html">table</a></li>'+
			'<li><a href="title.html">title</a></li>'+
			'<li><a href="form.html">form</a></li>'+
			'<li><a href="notice.html">notice</a></li>'+
		'</ul>';	
	$('.content_js').prepend(strp);		
	$('.pattern li').css({
		'float':"left",
		'margin-right':'5px',
		'margin-bottom':'5px'		
	});		
	$('.pattern li a').css({
		'color':"red",	
	});	
});































