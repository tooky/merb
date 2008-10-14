<% with_modules(modules) do -%>
class <%= class_name %> < Application
  # provides :xml, :yaml, :js

  def index
    @<%= plural_model %> = <%= model_class_name %>.all
    display @<%= plural_model %>
  end

  def show(id)
    @<%= singular_model %> = <%= model_class_name %>.get(id)
    raise NotFound unless @<%= singular_model %>
    display @<%= singular_model %>
  end

  def new
    only_provides :html
    @<%= singular_model %> = <%= model_class_name %>.new
    display <%= model_class_name %>
  end

  def edit(id)
    only_provides :html
    @<%= singular_model %> = <%= model_class_name %>.get(id)
    raise NotFound unless @<%= singular_model %>
    display @<%= singular_model %>
  end

  def create(<%= singular_model %>)
    @<%= singular_model %> = <%= model_class_name %>.new(<%= singular_model %>)
    if @<%= singular_model %>.save
      redirect resource(@<%= singular_model %>), :message => {:notice => "<%= model_class_name %> was successfully created"}
    else
      render :new
    end
  end

  def update(<%= singular_model %>)
    @<%= singular_model %> = <%= model_class_name %>.get(<%= singular_model %>[:id] )
    raise NotFound unless @<%= singular_model %>
    if @<%= singular_model %>.update_attributes(<%= singular_model %>)
       redirect resource(@<%= singular_model %>)
    else
      display @<%= singular_model %>, :edit
    end
  end

  def destroy(id)
    @<%= singular_model %> = <%= model_class_name %>.get(id)
    raise NotFound unless @<%= singular_model %>
    if @<%= singular_model %>.destroy
      redirect resource(:<%= plural_model %>)
    else
      raise InternalServerError
    end
  end

end # <%= class_name %>
<% end -%>
