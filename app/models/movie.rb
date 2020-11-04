class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model

  pg_search_scope :search_by_title_and_syllabus,
      against: [:title, :syllabus]
end
