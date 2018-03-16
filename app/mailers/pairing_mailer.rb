class PairingMailer < ApplicationMailer
  def creation_confirmation(pairing)
    @pairing = pairing

    mail(
      to:       "joao.carrelo.sanches@gmail.com",
      subject:  "You're going to the movies!"
    )
  end
end
