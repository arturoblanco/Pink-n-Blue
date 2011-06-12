var filterSearch = ( function  () {
  var filterSearch = {};
  var filterSearchForm = "#filter_search_form";
  var filterSearchBtn = "#filter_search_btn";
  var inputTextFields = undefined;
  var selectTextFields = undefined;


  /* BEGIN DOCUMET READY */
  $(document).ready(function  () {
    /* Finding elements of the filter search form */
    inputTextFields = $(filterSearchForm).find("input:text");
    selectTextFields = $(filterSearchForm).find("select");

    /* Adding event to the sbtn search of the form */
    $(filterSearchBtn).click(function  () {
      ajaxSearchRequest();
    });

  });

  var ajaxSearchRequest = function  () {
    $.ajax({
      type: "GET",
      url: window.location.pathname + ".js",
      data: $(filterSearchForm).serialize(),
      success: function  (jsonResponse) {
      },
      error: function  () {
        alert("Error");
      }
    });
  }
  /* END DOCUMENT READY */
  return filterSearch;
})();
