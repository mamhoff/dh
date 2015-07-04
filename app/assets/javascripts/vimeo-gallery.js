// Fetch Vimeo thumbnails via the JSON api

$(document).ready(function() {
  var $images = $('img', '.dh-vimeo-gallery-element');

  $images.each(function (index, image) {
    var $image = $(image), api_url, id;

    id = $image.data('id');
    api_url = 'https://vimeo.com/api/v2/video/' + id + '.json';

    // Vimeo's api delivers JSON data about the video. We just need the
    // medium thumbnail URL.
    $.getJSON(api_url, function(data) {
      var thumbnail_url = data[0].thumbnail_medium;

      // Exchange image source
      $image.attr('src', thumbnail_url);

      // Show play icon
      $image
        .siblings('.glyphicon')
        .fadeIn();
    });
  });
});
