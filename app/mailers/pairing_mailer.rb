class PairingMailer < ApplicationMailer
  def creation_confirmation(pairing)
    @pairing = pairing

    mail(
      to:       "lorenzo.fermi@bancaimi.com",
      subject:  "You're going to the movies!"
    )
  end
end
