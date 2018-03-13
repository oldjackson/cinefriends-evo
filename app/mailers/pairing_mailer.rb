class PairingMailer < ApplicationMailer
  def creation_confirmation(pairing)
    @pairing = pairing

    mail(
      to:       @pairing.posting.user.email,
      subject:  "You're going to the movies!"
    )
  end
end
