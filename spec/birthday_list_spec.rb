require "birthday_list"

# - Store all of my friends’ birthdays so I can keep track of them
# store_birthday("Karen", "23/05/1996")
# => "Karen's birthday has been stored!"
# store_birthday("Karen", "23/05/1996")
# => "Your friend's birthday is already stored!"

describe BirthdayList do
    before(:each) do
        @bday_list = BirthdayList.new
        @bday_list.store_birthday("Already Added", "06/08/1991")
        @bday_list.store_birthday("Dan Rodriguez", "05/10/1996")
        @bday_list.store_birthday("Taylor Switch", "18/12/1989")
    end

    it "verifies that a birthday has been stored" do
        expect(@bday_list.store_birthday("Karen", "23/05/1996")).to eq("Karen's birthday has been stored!")
    end
    
    it "tells you when a name has already been stored" do
        expect(@bday_list.store_birthday("Already Added", "06/08/1991")).to eq("Your friend's birthday is already stored!")
    end

    #See them all at once with their names and birthdays each on a line in a tidy format
    it "shows full list with names and birthdays on each line" do
        expectation = expect { puts "Already Added || August 06, 1991"; puts "Dan Rodriguez || October 05, 1996"; puts "Taylor Switch || December 18, 1989" }
        
        expectation.to output(/Already Added || August 06, 1991/).to_stdout
        expectation.to output(/Dan Rodriguez || October 05, 1996/).to_stdout
        expectation.to output(/Taylor Switch || December 18, 1989/).to_stdout
    end
end
