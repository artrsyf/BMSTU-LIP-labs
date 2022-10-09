$(function(){
   $("#qqButton").click(function(){
      alert(localStorage.getItem('name2'));
   });
});
var count;
$(function(){
	$(document).ready(function(){
		count = Number(localStorage.getItem('count')) - 1;
		for (let i = 1; i <= count; i++){
			$("#orderTable").append("<tr><td>" + localStorage.getItem('name' + i.toString()) + "</td><td class='cell'>" + localStorage.getItem('price' + i.toString()) + "</td></tr>");
		};
	});
});