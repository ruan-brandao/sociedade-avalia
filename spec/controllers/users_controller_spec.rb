require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
  login_user

  it 'should have a current user' do
    subject.current_user.should_not be_nil
  end

end
