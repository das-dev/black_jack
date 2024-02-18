# frozen_string_literal: true

class Bank
  def initialize(amount = 0)
    @bank = amount
  end

  def withdraw(amount)
    @bank -= amount
  end

  def deposit(amount)
    @bank += amount
  end
end
