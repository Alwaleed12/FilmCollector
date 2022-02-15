class Appearance < ApplicationRecord
  # belongs_to method specifies a one to one relationship
  # actor options specifies that one appearance has one actor
  belongs_to :actor
  # movie option specifies that one appearance has one movie
  belongs_to :movie
end
