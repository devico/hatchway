class SendOrder
  include Interactor

  def call
    @hatch = Hatch.find(context.hatch_id)

    new_message = WriteMessage.new({ a: @hatch.a,
                                     a1: @hatch.a1,
                                     b: @hatch.b,
                                     c: @hatch.c,
                                     d: @hatch.d,
                                     latitude: @hatch.latitude,
                                     longitude: @hatch.longitude,
                                     address: @hatch.address }).create_message_text
    OrderMailer.send_mail_order(new_message[:message]).deliver
  end
end
