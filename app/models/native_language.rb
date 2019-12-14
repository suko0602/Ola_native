class NativeLanguage < ApplicationRecord
  enum level: { native: 0, semi_native: 1 }
end
