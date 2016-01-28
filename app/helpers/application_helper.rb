module ApplicationHelper
  def link_to_add_fields(name, f, type)
    id = 1
    fields = render type, id: id, type: type

    link_to(name, '#', class: "add_element", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
