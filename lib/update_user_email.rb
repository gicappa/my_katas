class UpdateUserEmail
  
  def initialize(user_repository, notifier)
    @user_repository = user_repository
    @notifier = notifier
  end
  
  def persist_email_and_notifies_token(user_id, new_email)
    user = @user_repository.find(user_id)
    
    @user_repository.save_user_with_temporary_email(user, new_email)
    
    @notifier.send_notification_changed_message_to(user, "token", new_email)
  end
end