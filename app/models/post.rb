class Post < ApplicationRecord
  belongs_to :sport

    ## Validations
    validates :caption, presence: true

end
