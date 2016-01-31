module ApplicationHelper
  def link_to_add_fields(name, f, association, element_type)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    # order_number = order_numbering(f.object)
    # p order_number
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render element_type, f: builder, element_type: element_type
    end

    if element_type != "list_item"
      namespace = f.object.elements.length
      link_to(name, '#', class: "add_element", data: {id: id, fields: fields.gsub("\n", ""), namespace: namespace})
    else
      namespace = f.object.list_items.length
      link_to(name, '#', class: "add_list_item", data: {id: id, fields: fields.gsub("\n", ""), namespace: namespace})
    end
  end
end
