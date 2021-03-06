require 'csv'

module Bank

  class Account

    attr_reader :id, :balance, :open_date

    def initialize(id, balance, open_date = nil)
      @id = id
      raise ArgumentError.new "The initial balance must not be a negative number" if balance < 0

      @balance = balance



      # raise ArgumentError.new("The initial balance must not be a negative number") if balance < 0
      #
      # @id = id
      # @balance = balance

      # owner1 = Bank::Owner.new(owner)

      # @owner = owner
      # @account = Accounts.all
      # @owner = Bank::Owner.new(owner_info_hash)
      # @owner_name = owner1.name


    end

    def self.all
      accounts = []
      CSV.open("../support/accounts.csv").each do |line|
        id = line[0]
        balance = line[1].to_i
        open_date = line[2]

        new_account = Account.new(id, balance, open_date)
        accounts << new_account
      # accounts[ line[0] ] = line[1..-1]
      # puts line
      # accounts[line[0]] = line[1..-1]

      end
      return accounts
    end


    def self.find(search_id)
      # new_search = Account.all
      match = nil

      Bank::Account.all.each do |account|
        if account.id == search_id
          match = search_id
          break
        else
          match = nil
        end
      end

      raise ArgumentError.new("There are no accounts with that ID") if match == nil

      return match


    end

    def withdraw(money_to_withdraw)
      raise ArgumentError.new "The amount to withdraw must be greater than zero" if money_to_withdraw < 0 #requires positive withdrawal amount
      if money_to_withdraw > @balance #requires withdrawal amount less than balance
          puts "Amount to withdraw must be greater than balance"
      else
          @balance -= money_to_withdraw
      end
      return @balance
    end

    def deposit(money_to_deposit)
      raise ArgumentError.new "The deposit amount must be greater than zero" if money_to_deposit < 0
        # start_balance = @balance
        # updated_balance = start_balance + money_to_deposit
        @balance += money_to_deposit

    end

    # def add_owner
    #
    # end

  end

end
