module ApplicationHelper

  def render_errors(object)
    render(partial: "shared/errors", locals: {:object =>  object})
  end

end
