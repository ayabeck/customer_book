class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input_html_classes
    super.push('datepicker')
  end
end