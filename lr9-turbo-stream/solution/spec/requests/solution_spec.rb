# frozen_string_literal: true

# RSpec tests starts only with explicit reference of the full path to _spec.rb in project directory
require 'rails_helper'
require 'nokogiri'
require 'capybara/rspec'
require 'selenium-webdriver'

FIRST_TEN_HAPPY_ELEMENTS = [0, 1001, 1010, 1100, 2002, 2011, 2020, 2101, 2110, 2200].freeze

RSpec.describe 'Solutions', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    context 'integer input' do
      it 'returns http success' do
        post '/solution/show', params: { input_number: '2132' }, xhr: true
        expect(response).to have_http_status(:success)
      end
    end
    context 'string input' do
      it 'returns error 302' do
        post '/solution/show', params: { input_number: 'ewqwq' }
        expect(response).to have_http_status(302)
      end
    end
    context 'float input' do
      it 'returns error 302' do
        post '/solution/show', params: { input_number: '2.5' }
        expect(response).to have_http_status(302)
      end
    end
    context 'mixed input' do
      it 'returns error 302' do
        post '/solution/show', params: { input_number: '2132qwqwdwd2' }
        expect(response).to have_http_status(302)
      end
    end
    context 'empty input' do
      it 'returns error 302' do
        post '/solution/show', params: { input_number: '' }
        expect(response).to have_http_status(302)
      end
    end
  end
  context 'output content on show page' do
    it 'should return first 10 correct happy numbers' do
      post solution_show_path, params: { input_number: 100_000 }, xhr: true
      html = Nokogiri::HTML(response.body)
      FIRST_TEN_HAPPY_ELEMENTS.each_with_index do |element, index|
        th_element = html.search('td')[1 + index * 2].text.to_i
        expect(th_element).to eq(element)
      end
    end
  end
  context 'check correct render in input action controller' do
    it 'should return correct view - input' do
      get root_path
      expect(response).to render_template("solution/input")
    end
  end
  context 'check correct render in show action controller' do
    it 'should return correct view - show and output' do
      post '/solution/show', params: { input_number: '12345' }, xhr: true
      expect(response).to render_template("solution/_output", "solution/show")
    end
  end

  describe 'selenium-webdriver open root_path and' do
    before(:each) do
      @driver = Selenium::WebDriver.for :chrome
      @base_url = 'https://www.google.com/'
      @accept_next_alert = true
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
    end

    after(:each) do
      expect(@verification_errors.size).to be_zero
    end

    it 'send 213q; should raise error with invalid input' do
      @driver.get 'http://localhost:3000/'
      @driver.find_element(:id, 'input_number').click
      @driver.find_element(:id, 'input_number').clear
      @driver.find_element(:id, 'input_number').send_keys '213q'
      @driver.find_element(:name, 'commit').click
      expect(@driver.find_element(:id, 'error').text).to eq('Incorrect input')
    end

    it 'empty input; should raise error with empty input' do
      @driver.get 'http://localhost:3000/'
      @driver.find_element(:id, 'input_number').click
      @driver.find_element(:id, 'input_number').clear
      @driver.find_element(:name, 'commit').click
      expect(@driver.find_element(:id, 'error').text).to eq('Input is empty')
    end

    it 'default input; should display table correct' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:class, 'element-2').text).to eq('1001')
    end

    it 'check program process after raise error' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:id, 'input_number').click
      @driver.find_element(:id, 'input_number').clear
      @driver.find_element(:id, 'input_number').send_keys('12000')
      @driver.find_element(:name, 'commit').click

      @driver.find_element(:id, 'input_number').click
      @driver.find_element(:id, 'input_number').clear
      @driver.find_element(:id, 'input_number').send_keys('')
      @driver.find_element(:name, 'commit').click

      @driver.find_element(:id, 'input_number').click
      @driver.find_element(:id, 'input_number').clear
      @driver.find_element(:id, 'input_number').send_keys('ssome string')
      @driver.find_element(:name, 'commit').click

      @driver.find_element(:id, 'input_number').click
      @driver.find_element(:id, 'input_number').clear
      @driver.find_element(:id, 'input_number').send_keys('6000')
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:class, 'element-56').text).to eq('5500')
    end
  end
end
