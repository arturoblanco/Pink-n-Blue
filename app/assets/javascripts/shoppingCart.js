var shoppingCart = (function  () {
  var shoppingCart = {};
  var shoppForm = "form.cart_form";
  var urlShopp = "/cart_products";
  var totalProducts = "#num_of_prods";
  var totalShopp = "dd.article-price";
  var productColor = "a.sel_prod_color"
  
  $(document).ready(function  () {
    $(shoppForm).find("[type=submit]").click(function  () {
      var shoppingCartForm = $(this).parent(shoppForm);
      sendShoppForm(shoppingCartForm)
    });
    
    $(productColor).click(function  () {
      colorSelected = $(this);
      setSelectedColor(colorSelected);
      setProductColor(colorSelected);
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
  
  var setSelectedColor = function  (colorSelected) {
    var colorList = colorSelected.parents("ul.product_colors");
    $(colorList).children().removeClass("color_selected");
    colorSelected.parent().addClass("color_selected");
  }
  
  var setProductColor = function  (colorSelected) {
    var productForm = colorSelected.parents("ul.product_colors").next("form");
    var color = colorSelected.text().toLowerCase();
    $(productForm).find("input:hidden.selected_color").val(color);
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