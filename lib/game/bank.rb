# frozen_string_literal: true

class Bank
  attr_reader :balance

  def initialize(amount = 0)
    @balance = amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def deposit(amount)
    @balance += amount
  end

  def reset
    @balance = 0
  end
end
