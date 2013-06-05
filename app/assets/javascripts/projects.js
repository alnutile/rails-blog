$('.project-thumb-projects a').on('click', function(){
	var clickedClass = $(this).attr('class');
	clickedClass = clickedClass.split('-');

	jQuery.ajax({       
	    type: 'GET',
	    url: 'http://' + window.location.host + '/projects/' + clickedClass[1] +'.json',
	    dataType: 'json',
	    success: layoutProjectContent, //This is what I will run on success
	    data: {}        
 	});
	return false;
});

var layoutProjectContent = function(data) {
	$('#project-slide p.starting').html(data.body);
	$('#project-slide h4.media-heading').html(data.title);
	var imageSrc = data.photo_file_name;
	var imageSize = data.photo_file_size;
	var id = data.id;
	if($(id).length == 1) {
		id = '00'+id;
	} else if($(id).length == 2) {
		id = '0'+id;
	}
	var imagePath = '/system/projects/photos/000/000/'+id+'/large/'+imageSrc;
	$('#project-slide .media-img img').attr('src', imagePath);
	scrollTop();
	updateUrl('projects/'+data.id);
}
