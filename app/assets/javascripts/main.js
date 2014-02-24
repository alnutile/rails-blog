	//Text on bottom of content

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


	if($('div.sites div.site').length) {
        $('div.sites div.site').each(function(){
            var text = $(this).html();
            var fixed = replaceURLWithHTMLLinks(text);
            $(this).html(fixed);
        });
	};

    if($('div.sites div.site-ignore').length) {
        $('div.sites div.site-ignore').each(function(){
            $('a', this).text('http://javascript.example.com');
        });
    };


    if($('div.testimonies')) {
		var how_many = $('div.testimonies blockquote').length;
		var random_quote = Math.floor(Math.random()*how_many);
		$('.testimonies blockquote').eq(random_quote).fadeIn();
	}

	//$('textarea').wysihtml5();
