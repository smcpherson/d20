class DicesController < ApplicationController

  def generate_ability_scores
    render :layout => false, :inline => Dice.roll("generate_ability_scores")
  end

  def generate_fighter_money
    render :layout => false, :inline => Dice.roll("generate_fighter_money")
  end
end
