require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :fullname => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_fullname[name=?]", "person[fullname]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_phone[name=?]", "person[phone]"

      assert_select "textarea#person_description[name=?]", "person[description]"
    end
  end
end
