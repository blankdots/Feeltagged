$(document).ready(function(){

var wl= $(".wl").val();

$(function() {
		$("#slider").slider({
			value:50,
			min: 0,
			max: 100,
			step: 5,
			slide: function(event,ui){
				if (ui.value > 50)
				{$("#valr").text("I feel happy." + " " + " ")}
				else{$("#valr").text(" I feel Sad.")}
				/*$("#valr").text(ui.value);*/
			}
		});
	});

$("#feel").validate ({
          errorContainer: "#messageBox1",
          errorLabelContainer: "#messageBox1 ul",
          wrapper: "li",
          rules: {
               wl: {required: true},
               bd: {required: true}
          },
          messages: {
               wl: { required: "Now really the weather can't be that bad."},
			   bd: { required: "I get bored sometimes too."}
          }
     })
});