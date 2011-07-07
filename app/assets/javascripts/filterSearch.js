var filterSearch = ( function  () {
  var filterSearch = {};
  var filterSearchForm = "#filter_search_form";
  var filterSearchBtn = "#filter_search_btn";
  var filterSearchResults = "#filter_search_results";
  var paginationLinks = "#filter_search_results div.pagination nav.pagination a"
  var inputTextFields = undefined;
  var selectTextFields = undefined;


  /* BEGIN DOCUMET READY */
  $(document).ready(function  () {
    /* Finding elements of the filter search form */
    inputTextFields = $(filterSearchForm).find("input:text");
    selectTextFields = $(filterSearchForm).find("select");

    /* Preventing default request of links pagination */
    $(paginationLinks).live('click', function  (event) {
      $.ajax({
        type: "GET",
      url: this.href,
        success: function(xhrResponse) {
          $(filterSearchResults).html(xhrResponse.obj_response);
        },
        error: function  () {
        }
      });
      event.preventDefault();
    });

    /* Adding event to the sbtn search of the form */
    $(filterSearchBtn).click(function  () {
      instanceParamsVariables();
    });

  });

  var instanceParamsVariables = function  () {
    searchParams = new Object();
    inputTextVariables();
    selectFieldsVariables();
    ajaxSearchRequest();
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

  var ajaxSearchRequest = function  (paramsPage) {
    $.ajax({
      type: "GET",
      url: window.location.pathname,
      data: $.param(searchParams),
      success: function  (xhrResponse) {
        $(filterSearchResults).html(xhrResponse.obj_response);
      },
      error: function  () {
        alert("Error");
      }
    });
  }
  /* END DOCUMENT READY */
  return filterSearch;
})();
