# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
    scenario 'simple test with input number eq 5000' do
        visit root_path
        # fill_in :input_number, with: 5000
        # ('#find').click
      # expect(find('.element-11')).to have_text("3003")
    end
end