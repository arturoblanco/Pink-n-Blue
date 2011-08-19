var shoppingCart = (function  () {
  var shoppingCart = {};
  var shoppForm = "form.cart_form";
  var urlShopp = "/cart_products";
  var totalProducts = "#num_of_prods";
  var totalShopp = "dd.article-price";
  
  $(document).ready(function  () {
    $(shoppForm).find("[type=submit]").click(function  () {
      shoppingCartForm = $(this).parent(shoppForm);
      sendShoppForm(shoppingCartForm)
    })
  });
  /* 
  * END DOCUEMNT.READY
  */
  
  var sendShoppForm = function  (shoppForm) {
    ajaxRequest(shoppForm, urlShopp, "POST", successShoppForm )
  }
  
  var successShoppForm = function  (jsonResponse) {
    cartInfo = jsonResponse.cart_info;
    $(totalProducts).text(cartInfo.total_products);
    $(totalShopp).html(formatTotalShopp(cartInfo.total_shopp));
  }
  
  var ajaxRequest = function  (form, url, method, successFunction) {
    $.ajax({
       type: method,
       url: url,
       data: form.serialize(),
       success: successFunction,
       error: function  (jqXHR, textStatus, errorThrown) {
         console.log(jqXHR, textStatus, errorThrown);
       }
    });
  }
  
  /*
  * START MISC METHODS
  */
  var formatTotalShopp = function  (totalShopp) {
    totalShopp = totalShopp.split(".");
    return totalShopp[0] + "," + "<span>" + totalShopp[1] + "</span>";
  } 
  /*
  * END MISC METHODS
  */
  
  return shoppingCart;
})();