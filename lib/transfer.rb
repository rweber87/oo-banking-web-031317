class Transfer

 attr_accessor :sender, :receiver, :amount, :status

@@executed = []

def initialize(sender, receiver, amount)
	@sender = sender
	@receiver = receiver
	@status = 'pending'
	@amount = amount
end

def valid?
	@sender.valid? == @receiver.valid?
end

def execute_transaction
	
	if @sender.balance >= amount && @@executed.include?(self) == false
		@sender.balance -= amount
		@receiver.deposit(amount)
		self.status = 'complete'
		@@executed << self
	else
		self.status = 'rejected'
		return "Transaction rejected. Please check your account balance."
	end

	def reverse_transfer
		if @@executed.include?(self)
			@receiver.balance -= amount
			@sender.balance += amount
			self.status = 'reversed'
		end
	end
	
end

end
