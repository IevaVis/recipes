// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require_tree .


$(document).on('turbolinks:load', function() {
	$("#submitWeather").click(function(){
		var city = $("#city").val();
		if(city != ''){
			$.ajax({
				url: "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=metric" + "&APPID=48061bdd06623adede63c811fa612308",
				type: "GET", 
				dataType: "jsonp",
				success: function(data){
					var widget = show(data);
						$("#show").html(widget);
						$("#city").val('');
						}
					});
		}else{
				$("#error").html('Field cannot be empty');
			}
	 });
});

function show(data){
	return "<h5 style='font-weight:bold;'>Current Weather For " + data.name + ", " + data.sys.country +"</h5>" +
					"<h6><strong>Weather</strong>: "+ data.weather[0].main +"</h6>" +
				 "<h6><strong>Description</strong>: <img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png'> "+ data.weather[0].description +"</h6>" +
				 "<h6><strong>Temperature</strong>: "+ data.main.temp + "&deg;C</h6>" +
				 "<h6><strong>Humidity</strong>: "+ data.main.humidity + "%</h6>" +
				 "<h6><strong>Min. Temperature</strong>: "+ data.main.temp_min + "&deg;C</h6>" +
				 "<h6><strong>Max. Temperature</strong>: "+ data.main.temp_max + "&deg;C</h6>" +
				 "<h6><strong>Wind Speed</strong>: "+ data.wind.speed + " m/s</h6>";
}



$(document).on('turbolinks:load', function() {
	// when clicking on button class filter
	$('.filter').on('click', function(event){
		// prevent Default
		event.preventDefault();
		//look for the cocktails where non_alcoholic = true
		$.ajax({
			// URL - A string containing the URL to which the request is sent.
			url: "/search?non_alcoholic=true",
			method: "GET",
			dataType: "json",
			success: function(data){
				//when success empty the row
				$(".row").empty()
				for (var i = data.length - 1; i >= 0; i--) {
					$(".row").append('<div class="col-md-4"><div class="cocktails"><img src='
					+
					function() {
						if (data[i].picture.url == null) {
							return "/assets/Cocktail.jpg"
						} else {
							return data[i].picture.url
						}
					}()
					+
					' , class="picture"><a href="/cocktails/' + data[i].id + '">' + "<br/>" + 
					 data[i].title + "</a>" + "<br/>" +
					"<strong>Ingredients</strong>: " + data[i].ingredients + "<br/>" +
					"<strong>Preparation</strong>: " + data[i].preparation + "</div></div>")
				}
			}
		});
	})
})


























































