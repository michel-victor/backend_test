class ContentsController < ApplicationController
  def index
    # Ordered by createed_at from default_scope in model
    @contents = Content.all
  end
end
