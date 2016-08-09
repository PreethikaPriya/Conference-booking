class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.booked.subject
  #
  def booked(booking,current_user)
    @booking = booking
    @current_user = current_user
    mail to: "#{booking.user.email}",cc:"preethikapriya9@gmail.com;cspavanckm@gmail.com",
    subjet:" #{@booking.conference_room_id}
    has been booked !"
  end
end
