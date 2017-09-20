require 'mechanize'

class MechanizeOrder
  include Interactor

  def call
    @hatch = Hatch.find(context.hatch_id)
    agent = Mechanize.new
    agent.get("http://xn--80accfiasjf8cghbfut2k.xn--p1ai/request?g=112")
    form = agent.page.forms.first
    form.log = "devico"
    form = agent.page.forms.first
    form.log = "devico"
    form.pass = "hatch7hatch"
    form.submit
    form = agent.page.forms.first
    addr = @hatch.address.split(",")
    form.str = addr[1]
    form = agent.page.forms.first
    form.str = addr[1]
    form.home = addr[2]
    form.file_uploads.first.file_name = @hatch.photos[0].file.file
    form.submit
  end
end
