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
end
