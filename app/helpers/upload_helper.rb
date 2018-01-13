module UploadHelper
  def format_errors(errors)
    msg = ''
    errors.each do |key, value|
      if value.include?(',')
        msg = msg + "#{key}: #{value[0]},<br>"
      else
        msg = msg + "#{key}: #{value[0]}<br>"
      end
    end

    msg.html_safe
  end

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

  def format_curr(value)
    helper.number_to_currency(value)
  end
end
