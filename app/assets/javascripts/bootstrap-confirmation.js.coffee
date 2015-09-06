# Override Rails handling of confirmation
$.rails.allowAction = (element) ->
  header_message = element.data('confirm')
  body_message   = element.data('message') || 'Are you sure you want to delete?'
  # If there's no message, there's no data-confirm attribute, which means there's nothing to confirm
  return true unless header_message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
    .removeAttr('class')
    .removeAttr('data-confirm')
    .attr('data-dismiss', 'modal')
    .addClass('btn btn-primary btn-block')
    .html('OK')

  # Create the modal box with the message
  modal_html =
    """
    <div class='modal fade'>
      <div class='modal-dialog modal-sm'>
        <div class='modal-content'>
          <div class='modal-header'>
            <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
            <h4 class='modal-title text-center'>#{ header_message }</h4>
          </div>
          <div class='modal-body text-center'>#{ body_message }</div>
          <div class='modal-footer'>
            <a data-dismiss='modal' class='btn btn-default btn-block'>Cancel</a>
          </div>
        </div>
      </div>
    </div>
    """
  $modal_html = $(modal_html)
  $modal_html.find('.modal-footer').prepend($link)
  $modal_html.modal()
  $modal_html.on 'hidden.bs.modal', (evt)-> $modal_html.remove()
  return false
