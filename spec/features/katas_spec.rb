require 'rails_helper'
require 'capybara'

describe 'Kata' do
  it 'can be read' do
    second_title = 'second title'
    second_description = 'second description'
    create_kata
    create_kata(title: second_title, description: second_description)

    visit root_path
    click_on(second_title)

    expect(page).to have_content(second_title)
    expect(page).to have_content(second_description)
  end

  def create_kata(title: 'Kata title', description: 'Kata description')
    kata = Kata.new(title: title, description: description)
    kata.save

    kata
  end
end
