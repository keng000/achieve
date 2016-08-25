class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog
    @greeting = "Hi"
    def sendmail_blog(blog)
      @blog = blog

    mail to: "s_flashback@yahoo.co.jp",
      subject: "【Achieve】ブログが投稿されました"
  end
end
