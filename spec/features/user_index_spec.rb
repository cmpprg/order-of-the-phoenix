require "rails_helper"

RSpec.describe 'As a user' do
  context 'when I visit the root page' do
    it "if I select 'Gryffindo' and click 'Search for Memebers I should be on search page.'" do
      visit '/'

      select "Gryffindor", from: 'house'
      click_button 'commit'

      expect(current_path).to eql('/search')
    end

    it "After 'Gryfindor' selection i should see total number of order of phoenix memeber that belong to gryfindor." do
      visit '/search?house=Gryffindor'

      within '.total' do
        expect(page).to have_content('Total: 21')
      end
    end
  end
end

# ```
# As a user, ***
# When I visit "/" ***
# And I Select “Gryffindor” from the select field ***
# (Note: Use the existing select field) ***
# And I click "Search For Members“ ***
# Then I should be on page “/search” ***
# Then I should see the total number of the order of the phoenix members that belong to Gryffindor. (i.e. 21)
# And I should see a list with the detailed information for the 21 members of the Order of the Phoenix for house Gryffindor.
# ​
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
#
