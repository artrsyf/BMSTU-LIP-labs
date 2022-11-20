// var button = document.querySelector("button"); Обработка нажатия кнопки js
//   button.addEventListener("click", function() {
//     console.log("Кнопка нажата.");
//   });



localStorage.setItem('color', 'eewqewq');
var total_price = 0;
var count = 1;
$(function(){
   $("#addButton").click(function(){
   		var product_name = $("#name").val();
   		var product_price = $("#price").val();
         localStorage.setItem('name' + count.toString(), product_name.toString());
         localStorage.setItem('price' + count.toString(), product_price.toString())
         count += 1;
   		total_price += Number(product_price);
   		if (product_name == "" || product_price == "" || !(/^[a-zA-Z' '0-9]+$/.test(product_name)) || !(/^[0-9]+$/.test(product_price))){
   			alert("Input correct name and price of product");
   			return false;
   		};
      	$("#table").append(" \
		<tr> \
			<td> \
				<div class='block_item'>" + product_name + "</div> \
			</td> \
			<td class='cell'> \
				<div class='block_item cell'>" + product_price + "</div> \
			</td> \
		</tr>");
      	return false;
   });
});
$(function(){
	$("#calculateButton").click(function(){
		// var div = document.getElementById("totalprice");
		$("#totalprice").text(total_price);
		return false;
	});
});

$(function(){
   $("#go_to_shopping_cart").click(function(){
      localStorage.setItem('count', count.toString());
      window.location.href = 'shopping-cart.html';
      return false;
   })
})
