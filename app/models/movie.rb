class Movie < ApplicationRecord
  belongs_to :director

  include PgSearch::Model
  pg_search_scope :title_syllabus_search,
    against: [:title, :syllabus],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :global_search,
    against: [:title, :syllabus],
    associated_against: {
      director: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

    multisearchable against: [:title, :syllabus]
end
