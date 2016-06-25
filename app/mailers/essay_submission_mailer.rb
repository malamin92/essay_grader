class EssaySubmissionMailer < ActionMailer::Base
  default from: 'm.alamin92@gmail.com'
  
  def essay_submitted_email(user, essay)
    @user = user
    @essay = essay
    mail(to: "m.alamin92@gmail.com", subject: 'New Essay Submission')
  end
end
