module ReservationsHelper
  def times
    times = ["10:00",
             "10:30",
             "11:00",
             "11:30",
             "14:00",
             "15:00",
             "15:30",
             "16:00",
             "16:30",
             "17:00",
             "17:30",
             "18:00",
             "18:30"]
  end

  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return result if result
    end
    return result
  end
  
  # def end_time_reservation
  #   end_time_reservation1 == @start_time + (30.minutes.since)
  #   end_time_reservation2 == @start_time + (60.minutes.since)
  #   end_time_reservation3 == @start_time + (90.minutes.since)
  # end
  
  # def
  #   case reservation
  #   when reservation1
  #     @time + next_time == "予約済み"
  #   when reservation2
  #     @time + (next_time * 2) == "予約済み"
  #   when reservation3
  #     @time + (next_time * 3) == "予約済み"
  #   else
  #     return result if result
  #   end
  # end
end