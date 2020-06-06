class Transfer

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end
<<<<<<< HEAD

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."      
    end
  end

end 
=======
  
def execute_transaction
    if self.valid? && self.amount < self.sender.balance
      self.amount = 0 if self.status == “complete”
      self.sender.balance = self.sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
      self.status = “complete”
    else
      self.status = “rejected”
      return “Transaction rejected. Please check your account balance.”
    end
  end
end
>>>>>>> bd151612da9badecf537f04d731a069677c0277d
