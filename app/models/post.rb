class Post < ActiveRecord::Base
  attr_accessible :consultation_summary, :date, :patron_request, :resources_used, :status, :title, :create_at, :updated_at
end
