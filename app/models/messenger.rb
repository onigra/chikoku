class Messenger
  def initialize(current_user, sender_class)
    @user = current_user
    @klass = sender_class
  end

  def send_message
    @user.send("#{@klass.to_s.underscore}").send_message
  end
end
