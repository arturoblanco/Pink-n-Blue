var filterJs = (function  () {
  var filterJs = {};
  var filterForm = "#filter_form";

  $(document).ready(function  () {
    $(filterForm).find("select").change(function  () {
      console.log($(this).val());
    });
  });
  /* END DOCUMENT READY */
  return filterJs;
})();
