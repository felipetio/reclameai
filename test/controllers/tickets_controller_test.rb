require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should post create and redirect to show" do
    order = orders(:sp)
    ticket_params = { order_id: order.id, description: "Lorem impsum" }
    post tickets_url, params: {ticket: ticket_params }
    assert_response :redirect
  end

  test "should get show" do
    ticket = tickets(:one)
    get ticket_url ticket.id
    assert_response :success
  end
end
