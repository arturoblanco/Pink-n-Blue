var filterSearch = ( function  () {
  var filterSearch = {};
  var filterSearchForm = "#filter_search_form";
  var filterSearchBtn = "#filter_search_btn";
  var filterSearchResults = "#filter_search_results";
  var paginationLinks = "#filter_search_results div.pagination nav.pagination a"
  var searchParams = new Object();
  var inputTextFields = undefined;
  var selectTextFields = undefined;
  var ajaxResponse = undefined;

  /* 
  * BEGIN DOCUMET READY 
  */
  $(document).ready(function  () {
    loadFilterFields();

    $(paginationLinks).live('click', function  (event) {
      ajaxSearchRequest(this.href, filterSearchResponse)
      event.preventDefault();
    });

    $(filterSearchBtn).click(function  () {
      instanceParamsVariables();
    });
  });
  /*
  * END OF DOCUMENT READY
  */
  
  /* Finding elements of the filter search form */
  var loadFilterFields = function  () {
    inputTextFields = $(filterSearchForm).find("input:text");
    selectTextFields = $(filterSearchForm).find("select");
  }

  var instanceParamsVariables = function  () {
    searchParams = {};
    inputTextVariables();
    selectFieldsVariables();
    ajaxSearchRequest(window.location.pathname, filterSearchResponse);
  }

  var inputTextVariables = function  () {
    jQuery.each(inputTextFields, function  (index, textField) {
      var textFieldObj = $(textField);
      if (textFieldObj.val() !== "") {
        searchParams[textFieldObj.attr('id')] = textFieldObj.val();
      }
    });
  }

  var selectFieldsVariables = function  () {
    jQuery.each(selectTextFields, function  (index, selectField) {
      var selectFieldObj = $(selectField);
      if (selectFieldObj.val() !== "") {
        searchParams[selectFieldObj.attr('id')] = selectFieldObj.val();
      }
    });
  }

  var ajaxSearchRequest = function  (urlFilter, fnResponse) {
    $.ajax({
      type: "GET",
      url: urlFilter,
      data: $.param(searchParams),
      success: fnResponse,
      error: function  (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR, textStatus, errorThrown);
        alert("Error");
      }
    });
  }
  
  /*
  * FUNCTIONS FOR RESPONSE OF THE AJAX REQUEST 
  */
  var filterSearchResponse = function  (xhrResponse) {
    $(filterSearchResults).html(xhrResponse.obj_response);
  }
  /*
  * END OF FUNCTIONS FOR RESPONSE OF THE AJAX REQUEST
  */
  
  return filterSearch;
  })();
