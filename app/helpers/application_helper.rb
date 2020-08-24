module ApplicationHelper
    def field_with_errors(object, method, &block)
        if block_given?
          if object.errors[method].empty?
            content = with_output_buffer(&block)
            content.html_safe
          else
            content = with_output_buffer(&block)
            content_tag(:span, content, :class => "field_with_errors")
          end
        end
      end
end
