class Api::<%= singular_name.camelize %> < Api::Base
  self.element_name = "<%= plural_name %>"
end