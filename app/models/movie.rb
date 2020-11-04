class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model

  pg_search_scope :search_by_title_and_syllabus,
      against: [:title, :syllabus],
      associated_against: {
            director: [ :first_name, :last_name ]
          },
    using: {
      tsearch: { prefix: true } # <-- now `nolan` will return something!
    }
end
