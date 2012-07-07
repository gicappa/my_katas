require 'spec_helper'

describe UpdateUserEmail do
  it "builds a new instance of the User Story accepting a user_id and a user repository as a context" do
    UpdateUserEmail.new(UserRepository.new, UserNotifier.new).should_not be_nil
  end
  
  describe "#persist_email_and_notifies_token" do
    let(:user) { User.new {|u| u.email = 'old@email.com'}}
    
    before(:each) do
      @repository = UserRepository.new
      stub(@repository).find.with_any_args { user }      
      stub(@repository).save_user_with_temporary_email.with_any_args { true }
      
      @notifier = UserNotifier.new
      stub(@notifier).send_notification_changed_message_towith_any_args { true }
    end
    
    it "retrieves a user from repository" do
      mock(@repository).find(15) { user }      
      
      update_user_email = UpdateUserEmail.new(@repository, @notifier)
      update_user_email.persist_email_and_notifies_token(15, 'new@email.it')      
    end
    
    it "persists the email in a temporary way" do
      mock(@repository).save_user_with_temporary_email(user, 'new@email.it') { true }

      update_user_email = UpdateUserEmail.new(@repository, @notifier)
      update_user_email.persist_email_and_notifies_token(15, 'new@email.it')      
    end

    it "notify a message with the token" do
      mock(@notifier).send_notification_changed_message_to(user, "token", 'new@email.it')
      
      update_user_email = UpdateUserEmail.new(@repository, @notifier)
      update_user_email.persist_email_and_notifies_token(15, 'new@email.it')
    end
    
  end
  
end
  
