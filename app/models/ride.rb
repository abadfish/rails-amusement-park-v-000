class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !has_enough_tickets && tall_enough
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif !tall_enough && has_enough_tickets
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough && !has_enough_tickets
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      update_user_happiness
      update_user_nausea
      update_user_tickets
      "Thanks for riding the #{attraction.name}!"
    end

  end

  private

  def has_enough_tickets
    user.tickets >= attraction.tickets
  end

  def tall_enough
    user.height >= attraction.min_height
  end

  def update_user_happiness
    new_happiness_level = user.happiness.to_i + attraction.happiness_rating.to_i
    user.update(happiness: new_happiness_level)
  end

  def update_user_nausea
    new_nausea_level = user.nausea.to_i + attraction.nausea_rating.to_i
    user.update(nausea: new_nausea_level)
  end

  def update_user_tickets
    new_ticket_level =  user.tickets.to_i - attraction.tickets.to_i
    user.update(tickets: new_ticket_level)
  end
end
