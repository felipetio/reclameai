require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  setup do
    @order_bsb = orders(:bsb)
    @order_sp  = orders(:sp)
    @ip_address_sp = "2804:431:c7f5:bd21:f9a4:e521:38c4:111c"
  end

  test "should process a close ticket as not suspicious" do
    t = Ticket.create(
          order_id: @order_sp.id,
          description: 'test',
          ip_address: @ip_address_sp)

    assert_not t.suspicious
  end

  test "should process a far-off ticket as suspicious" do
    t = Ticket.create(
          order_id: @order_bsb.id,
          description: 'test',
          ip_address: @ip_address_sp)

    assert t.suspicious
  end
end
