
//Text on bottom of content
var textMe = jQuery('head title').text().substr(0,5);
jQuery('#row-text').append('<div id="text-me" class="span9">' + textMe + '</div>');
 
$("body").fadeIn();

var scrollTop = function() {
	$('html, body').animate({scrollTop:0}, 'slow'); 
}

var updateUrl = function(urlGet) {
	  $.address.state('/');
	  $.address.value(urlGet); 
}


var replaceURLWithHTMLLinks = function(text) {
    var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
    return text.replace(exp,"<a target='_blank' href='$1'>$1</a>"); 
}


if($('div.sites').length) {
	var text = $('div.sites').html();
	var fixed = replaceURLWithHTMLLinks(text);
	$('div.sites').html(fixed);
	$('a.fiber').text('http://fibershark.com');
	$('a.broma').text('http://broma.com');

}

if($('div.testimonies')) {
	var how_many = $('div.testimonies blockquote').length;
	var random_quote = Math.floor(Math.random()*how_many);
	$('.testimonies blockquote').eq(random_quote).fadeIn();
}