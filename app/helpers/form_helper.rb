module FormHelper
  def setup_booking(booking)
    booking.booking_checklist ||= BookingChecklist.new
    booking
  end
end