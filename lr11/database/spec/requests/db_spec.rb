require 'rails_helper'

RSpec.describe "Dbs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/db/show", params: { input_number: 2000, commit: 'Find' }
      expect(response).to have_http_status(:success)
    end
  end
  context 'check ab adding an finding' do
    example_number = rand(1100..2000)
    it 'should add and find correctly' do
      get "/db/show/?input_number=#{example_number}"
      if (Happy.find_by(input: example_number))
        expect(Happy.find_by(input: example_number)).not_to be_nil
      else
        # @output_pole = ActiveSupport::JSON.encode(Happy.new(input: @input).find_happy_numbers)
        output_pole = Happy.new(input: example_number).json_encode
        expect(result_encoded = Happy.create(input: example_number, output: output_pole)).not_to be_nil
        expect(Happy.find_by(input: example_number)).not_to be_nil
      end
    end
  end 

  context 'should check regular expression validation' do
    example_number = 'some string'
    it 'should redirect when input is string' do
      # get "/db/show", params: { input_number: example_number }
      get "/db/show", params: { input_number: example_number, commit: 'Find' }
      expect(response).to have_http_status(:redirect)
    end
  end
  context 'should check presence of input validation' do
    nothing = ''
    it 'should redirect when input is empty' do
      # get "/db/show", params: { input_number: example_number }
      get "/db/show", params: { input_number: nothing, commit: 'Find' }
      expect(response).to have_http_status(:redirect)
    end
  end


  context 'check impossibility to add not unique element' do
    cycle_number = 2000
    Happy.delete_all
    it 'should not append not unique element' do
      Happy.delete_all
      get "/db/show", params: { input_number: cycle_number, commit: 'Find' }
      get "/db/show", params: { input_number: cycle_number, commit: 'Find' }
      expect(Happy.distinct.count(:input)).to eq(Happy.count)
    end
    it 'should not append not unique element with not to change' do
      Happy.delete_all
      get "/db/show", params: { input_number: cycle_number, commit: 'Find' }
      expect{get "/db/show", params: { input_number: cycle_number, commit: 'Find' }}.not_to change(Happy.count)
    end
  end
end


