RSpec::Matchers.define :have_error_for do |key, message|
  match do |model|
    model.valid?

    if message.blank?
      model.errors.has_key?(key)
    else
      model.errors.full_messages_for(key).include?(message)
    end
  end
  failure_message do |model|
    "Expected: \"#{message}\" \nTo be included in: #{model.errors.full_messages_for(key)}"
  end
end
