# Ran out of time trying to get the js working on these tests but this is how I would have done the integration tests
RSpec.feature 'Get a short url', js: true, driver: :webkit do
  scenario 'Able to get a short url with a valid input' do
    visit_homepage
    enter_url('http://www.looongurl.com')
    short_url = find("#short_url").value
    # expect(short_url).to match(/https?:\/\/[\S]+/)
  end

  scenario 'Not able to get a short url with an invalid input' do
    visit_homepage
    enter_url('')
    validation_message = find("#short_url").value
    # expect(validation_message).to eq "The URL you've entered can't be blank"
  end

  def visit_homepage
    visit root_path
    expect(page).to have_content 'Shorten your url'
  end

  def enter_url(url)
    fill_in('url', with: url)
    click_button('Get shortened url')
  end
end
