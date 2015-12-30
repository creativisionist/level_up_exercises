module Helpers
  def initialize_bomb(activation_code, deactivation_code)
    fill_in 'activation_code', with: activation_code
    fill_in 'deactivation_code', with: deactivation_code
    find("button[name='submit_button']").click
  end

  def submit_and_validate_code(field_name, code)
    fill_in field_name, with: code
    find("button[name='submit_button']").click
  end
end

World(Helpers)
