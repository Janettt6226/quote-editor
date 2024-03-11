class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc)}

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  # is equivalent to what's below since by default,
    # * the target option will be equal to model_name.plural
    # * The partial default value is equal to calling to_partial_path on an instance of the model, which by default in Rails for our Quote model is equal to "quotes/quote".
    # * The locals default value is equal to { model_name.element.to_sym => self } which, in in the context of our Quote model, is equal to { quote: self }.
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Those three callbacks are equivalent to the following single line

  broadcasts_to -> (quote) { "quotes" }, inserts_by: :preprend
end
