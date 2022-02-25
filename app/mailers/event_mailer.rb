class EventMailer < ApplicationMailer
  default from: 'larbi.ah@outlook.com'
 
  def confirmation_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = User.find(attendance.user_id)
    @event = Event.find(attendance.event_id)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://eventvaulx.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Ton inscription pour l\'évènement est confirmé !') 
  end

end

