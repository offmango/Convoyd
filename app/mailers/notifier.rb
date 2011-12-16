class Notifier < ActionMailer::Base
  # default from: "from@convoyd.com"
  
  # Notify someone when a file has been uploaded for them
  def upload_notification(convoyd_file, emails)
    @convoyd_file = convoyd_file
    mail( :to => emails.gsub(/ /,'').split(","),
          :from => @convoyd_file.user.email,
          :cc => @convoyd_file.user.email,
          :subject => "There's Something for You on Convoyd!")
  end
    
end
