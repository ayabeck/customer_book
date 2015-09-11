module ApplicationHelper
  # usage example
  # <%= simple_form_for(@param) do |f| %>
  #   <div class="form-inputs">
  #   ...
  #   <div class="form-actions">
  #    <%= bootstrap_form_button(f) %>
  #   </div>
  # <% end %>
  def bootstrap_form_button(form)
    content_tag(:div, class: 'form-group') do
      content_tag(:div, class: 'col-wrapper-nolabel') do
        content_tag(:div, class: 'row') do
          content_tag(:div, class: 'col-input') do
            form.button :submit
          end
        end
      end
    end
  end

end
