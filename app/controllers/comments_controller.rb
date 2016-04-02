class CommentsController < ApplicationController
  
  def index
    super
    if not logged_in_as_instructor
      return render body: "You shouldn't be looking at this page."
    end
  end
  
end
