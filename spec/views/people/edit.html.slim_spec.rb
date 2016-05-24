require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :fullname => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_fullname[name=?]", "person[fullname]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_phone[name=?]", "person[phone]"

      assert_select "textarea#person_description[name=?]", "person[description]"
    end
  end
end
