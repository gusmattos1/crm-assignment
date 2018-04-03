class Contact 

@@contacts = []
@@id = 1

def self.prin t_contacts
  return @@contatcs
end
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email = "N/A", notes = "N/A")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    @id = @@id
    @@id += 1
  end

#=================== READERS ==========================

def first_name
  @first_name
end

def last_name
  @last_name
end

def email
  @email
end

def notes
  @notes
end

def id
  @id
end

#=================== WRITERS ==========================

def first_name=(new_name)
  @first_name = new_name
end

def last_name=(new_last_name)
  @last_name = new_last_name
end

def email=(new_email)
  @email = new_email
end

def notes=(new_notes)
  @notes = new_notes
end

#=================== METHODS ==========================

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email = "N/A", notes = "N/A")
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    return puts "your have successfully create the contact\" #{new_contact.first_name} \" ID: #{new_contact.id}"
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(contact_id)
    my_contact = nil
    @@contacts.each do |contact|
      if contact.id == contact_id
      my_contact = contact

      end

    end
    if my_contact == nil
      return false
    else
      return my_contact
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(id, attribute, value)

    Contact.find(id)
    contact.attribute = value
    return contact

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, name)

    results = []
    @@contacts.each do |contact|
      if attribute == "first_name" && contact.first_name == name
        results << contact
      end
    end

      if results.any? == true
        return results
      else
        return false
      end

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(contact)
    @@contacts.delete(contact)
  end

  # Feel free to add other methods here, if you need them.

end
