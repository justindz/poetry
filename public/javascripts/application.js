// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

poem = {
  removeDistractions: function()
  {
    document.body.setAttribute('style', 'visibility: hidden; background-color: #FFFFFF;');
    $('poem').setAttribute('style', 'visibility: visible;');
    $('restore_distractions').setAttribute('style', 'visibility: visible;');
    $('remove_distractions').setAttribute('style', 'visibility: hidden;');
  },
  
  restoreDistractions: function()
  {
    document.body.setAttribute('style', 'visibility: visible; background-color: #DDDDDD;');
    $('restore_distractions').setAttribute('style', 'visibility: hidden;');
    $('remove_distractions').setAttribute('style', 'visibility: visible;');
  }
}

versions = {
  getCheckedBoxes: function()
  { 
    var checkboxes = $('comparison_form').getInputs('checkbox');
    var checkedBoxes = [];
    
    checkboxes.each(function(checkbox)
    {
      if (checkbox.checked)
      {
        checkedBoxes.push(checkbox);
      }
    });
    
    return checkedBoxes;
  },

  checked: function(checkbox)
  {    
    var checkedBoxes = this.getCheckedBoxes();
    
    if (checkedBoxes.size() != 2)
    {
      $('submit').disable();
    }
    else if (checkedBoxes.size() == 2)
    {
      $('submit').enable();
    }
    
    if (checkedBoxes.size() > 2)
    {
      this.clearPriorCheckboxes(checkbox);
    }
    
    return true;
  },
  
  clearPriorCheckboxes: function(checkbox)
  { 
    var checkedBoxes = this.getCheckedBoxes();
    checkedBoxes.each(function(item)
    {
      item.checked = false;
    });
    checkbox.checked = true;
  }
}