temp =  window.onload + '';
leftBrace = temp.indexOf('{');
rightBrace = temp.lastIndexOf('}');
loadFunction = temp.substring(leftBrace + 1,rightBrace);
window.onload = sortOnLoad;
var ElementsToSort = new Array();

updateHiddenChooserField(document.forms["0"].elements["chosen"],document.forms["0"].elements["chosenListContent"]); 

function shiftSelected(chosen,howFar) 
{
	  var opts = chosen.options;
	  var newopts = new Array(opts.length);
	  var start; var end; var incr;
	  if (howFar > 0) {
	    start = 0; end = newopts.length; incr = 1;
	  } else {
	    start = newopts.length - 1; end = -1; incr = -1;
	  }
	
	  for(var sel=start; sel != end; sel+=incr) {
	    if (opts[sel].selected) {
	      setAtFirstAvailable(newopts,cloneOption(opts[sel]),sel+howFar,-incr);
	    }
	  }
	
	  for(var uns=start; uns != end; uns+=incr) {
	    if (!opts[uns].selected) {
	      setAtFirstAvailable(newopts,cloneOption(opts[uns]),start,incr);
	    }
	  }
	
	  opts.length = 0;
	  for(i=0; i<newopts.length; i++) {
	    opts[opts.length] = newopts[i]; 
	  }
}
	
function cloneOption(option) 
{
	  var out = new Option(option.text,option.value);
	  out.selected = option.selected;
	  out.defaultSelected = option.defaultSelected;
	  return out;
}

function setAtFirstAvailable(array,obj,startIndex,incr) 
{
	  if (startIndex < 0) startIndex = 0;
	  if (startIndex >= array.length) startIndex = array.length -1;
	  for(var xxx=startIndex; xxx>= 0 && xxx<array.length; xxx += incr) {
	    if (array[xxx] == null) {
	      array[xxx] = obj; 
	      return; 
	    }
	  }
}
	
function moveSelected(from,to) 
{
	  newTo = new Array();
	  newFrom = new Array();
	
	  for(i=from.options.length - 1; i >= 0; i--) {
	    if (from.options[i].selected) {
	      newTo[newTo.length] = cloneOption(from.options[i]);
	    }
	
	    else
	    {
	      newFrom[newFrom.length] = cloneOption(from.options[i]);
	    }
	  }
	
	  for(i=to.options.length - 1; i >= 0; i--) {
	    newTo[newTo.length] = cloneOption(to.options[i]);
	
	    newTo[newTo.length-1].selected = false;
	  }
	
	  to.options.length = 0;
	  from.options.length = 0;
	
	  for(i=newTo.length - 1; i >=0 ; i--) {
	    to.options[to.options.length] = newTo[i];
	  }
	
	  for(i=newFrom.length - 1; i >=0 ; i--) {
	    from.options[from.options.length] = newFrom[i];
	  }
	
	  selectionChanged(to,from);
	
	  var sorted = 'false';
  if (sorted)
  {
  	if (to.name.indexOf(sorted) >= 0 || sorted == "both")
{
	sortOptions(to,"up");
	}
  }
}

function updateHiddenChooserField(chosen,hidden) 
{
  hidden.value='';
  var opts = chosen.options;
  for(var i=0; i<opts.length; i++) {
    hidden.value = hidden.value + opts[i].value;
    if (i<opts.length-1) hidden.value = hidden.value + ",";
  }
}

function selectionChanged(selectedElement,unselectedElement) 
{
  for(i=0; i<unselectedElement.options.length; i++) {
    unselectedElement.options[i].selected=false;
  }
  enableButton("movefrom_"+selectedElement.name,(selectedElement.selectedIndex != -1));
  enableButton("movefrom_"+unselectedElement.name,(unselectedElement.selectedIndex != -1));
  enableButton("shiftdown_"+selectedElement.name,(selectedElement.selectedIndex != -1));
  enableButton("shiftup_"+selectedElement.name,(selectedElement.selectedIndex != -1));
  enableButton("shiftdown_"+unselectedElement.name,(unselectedElement.selectedIndex != -1));
  enableButton("shiftup_"+unselectedElement.name,(unselectedElement.selectedIndex != -1));
}

function enableButton(buttonName,enable) 
{
  var img = document.images[buttonName]; 
  if (img == null) return; 
  var src = img.src; 
  var und = src.lastIndexOf("_disabled.gif"); 

  if (und != -1) { 
    if (enable) img.src = src.substring(0,und)+".gif"; 
  } else { 
    if (!enable) {
      var gif = src.lastIndexOf("_clicked.gif"); 
  if (gif == -1) gif = src.lastIndexOf(".gif"); 
  img.src = src.substring(0,gif)+"_disabled.gif";
    }
  }
}

function pushButton(buttonName,push) 
{
  var img = document.images[buttonName]; 
  if (img == null) return; 
  var src = img.src; 
  var und = src.lastIndexOf("_disabled.gif"); 
  if (und != -1) return false; 
  und = src.lastIndexOf("_clicked.gif"); 

  if (und == -1) { 
    var gif = src.lastIndexOf(".gif");
if (push) img.src = src.substring(0,gif)+"_clicked.gif"; 
  } else { 
      if (!push) img.src = src.substring(0,und)+".gif"; 
  }
}

function deleteOption(object,index) 
{
    object.options[index] = null;
}

function addOption(object,text,value) 
{
    var defaultSelected = false;
    var selected = false;
    var optionName = new Option(text, value, defaultSelected, selected)
    object.options[object.length] = optionName;
    object.options[object.length-1].selected = false;
}

function sortOptions(what,direction) 
{
	//disable the left button, cuz it would get really confused:
	enableButton("movefrom_chosen",false);
	var copyOption = new Array();
	for (var i=0;i<what.options.length;i++)
	{
	    copyOption[i] = new Array(what.options[i].value,what.options[i].text);
	}
	
	if (direction == "up")
	{
    	copyOption.sort(sortingFunctionUp);
     }else{
    	copyOption.sort(sortingFunctionDown);
    }

    for (var k=what.options.length-1;k>-1;k--)
        deleteOption(what,k);

    for (var j=0;j<copyOption.length;j++)
        addOption(what,copyOption[j][1],copyOption[j][0]);
}

function sortingFunctionUp(a,b)
{
	if (a[1] < b[1]) return -1;
	else if (a[1] > b[1]) return 1;
	else return 0;
}

function sortingFunctionDown(a,b)
{
	if (a[1] > b[1]) return -1;
	else if (a[1] < b[1]) return 1;
	else return 0;
}

function sortOnLoad()
{
	for (var i=0;i < ElementsToSort.length;i++) {
		sortOptions(ElementsToSort[i],'up');
	}
	eval(loadFunction);
}