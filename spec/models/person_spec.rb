require 'rails_helper'

RSpec.describe Person, type: :model do
   context "shoulda" do
      it { expect(subject).to have_db_column(:fullname).of_type(:string) }
      it { expect(subject).to validate_presence_of(:fullname) }

      it { expect(subject).to have_db_column(:email).of_type(:string) }

      it { expect(subject).to have_db_column(:phone).of_type(:string) }

      it { expect(subject).to have_db_column(:description).of_type(:text) }
   end
end
