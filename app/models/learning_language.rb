class LearningLanguage < ApplicationRecord
  enum level: { beginner: 0, intermediate: 1, advance: 2 }
end
