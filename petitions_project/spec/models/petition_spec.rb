require 'rails_helper'

RSpec.describe Petition, type: :model do

  describe '#voted_by?' do

    subject { Petition.create(title: 'test', text: 'test').voted_by?(current_user) }

    context 'when current_user has voted' do
      let {current_user} {}
      it { should be_truthy }
    end
    context 'when' do
      let {}{}
      it { should be_falsy }
    end
  end
end