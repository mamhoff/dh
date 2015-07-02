$(document).ready(function () {
  $(document)
    .on('click', '*[data-toggle="lightbox"]', function (event) {
      var $this = $(this);

      // Establish two kinds of Lightboxes here - one for normal image galleries
      // and one for sliders.
      // Lightboxes for sliders are treated a little differently: They have no
      // close button and are closed on click.
      if ($this.data('always_show_close') === undefined) {
        $(this).ekkoLightbox();
      }
      else {
        $(this).ekkoLightbox({modal_id: 'lightbox_for_slider'});
      }

      event.preventDefault();
    })

    // Close Lightbox on click for Lightbox for sliders
    .on('click', '#lightbox_for_slider', function (event) {
      $(this).modal('hide');
    });
});
