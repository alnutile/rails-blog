(function ($) {
	$('a.image').on('click', function(){
		var clickedClass = $(this).attr('class');
		clickedClass = clickedClass.split('-');
		var imagePath = $(this).attr('data-url');
		jQuery.ajax({       
		    type: 'GET',
		    url: 'http://' + window.location.host + '/projects/' + clickedClass[1] +'.json',
		    dataType: 'json',
		    success: function(json) {
		    		layoutProjectContent(json, imagePath);
		    	}  
		 	});
			return false;
    });

	var layoutProjectContent = function(data, imagePath) {
		$('#project-slide div.starting').html(data.body);
		$('#project-slide h4.media-heading').html(data.title);
		var imageSrc = data.photo_file_name;
		var imageSize = data.photo_file_size;
		var id = data.id;
		if($(id).length == 1) {
			id = '00'+id;
		} else if($(id).length == 2) {
			id = '0'+id;
		}
		$('#project-slide .media-img img').attr('src', imagePath);
		scrollTop();
		updateUrl('projects/'+data.id);
	}



})(jQuery)