
//Text on bottom of content
var textMe = jQuery('head title').text().substr(0,5);
jQuery('#row-text').append('<div id="text-me" class="span9">' + textMe + '</div>');

//Latest Tweat

$.getJSON("http://api.twitter.com/1/statuses/user_timeline/alnutile.json?count=1&include_rts=1&callback=?", function(data) {
 var tweat = data[0].text;
 $("#row-tweat").html('<p class="muted">twitter: ' + tweat + '</p>').fadeIn('slow');
});

$("body").fadeIn();

var scrollTop = function() {
	$('html, body').animate({scrollTop:0}, 'slow'); 
}

var updateUrl = function(urlGet) {
	  $.address.state('/');
	  $.address.value(urlGet); 
}