require_relative 'contact'

class CRM

  def initialize

  end



  def main_menu

    while true

      print_main_menu
      option = gets.chomp.to_i
      call_option(option)
    end


  end

  def print_main_menu

    puts "Please select one of the options bellow:"
    puts "Press 1 to ADD a contact"
    puts "Press 2 to MODIFY a contact"
    puts "Press 3 to DELETE a contact"
    puts "Press 4 to DISPLAY ALL contacts"
    puts "Press 5 to SEARC a contact by a attribute"
    puts "Press 6 to EXIT"

  end

  def call_option(option)

    case option
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    else puts "select between 1 and 6"

    end

  end

  def add_new_contact

    puts "Please inform the first name"
    first_name = gets.chomp
    puts "Please inform the last name"
    last_name = gets.chomp
    puts "Please inform the email (optinal)"
    email = gets.chomp
    puts "Please inform the notes (optinal)"
    notes = gets.chomp

    Contact.create(first_name, last_name, email, notes)

  end

  def modify_existing_contact

    puts "Plese inform the contact \"ID\""
    contact_id = gets.chomp.to_i

    if Contact.find(contact_id) == false
      puts "Contact not found."
      modify_existing_contact

    else

      puts "You have select the contact "
      selected = Contact.find(contact_id)
      puts selected.first_name
      puts "Please select which attribute do you wanna change:"
      puts "Select 1 to change the first name"
      puts "Select 2 to change the last name"
      puts "Select 3 to change the email"
      puts "Select 4 to change the notes"
      puts "Select 5 to go back to main menu"

      selection = gets.chomp.to_i

      case selection

        when 1 then
          puts "Please inform the new fisrt name"
          new_name = gets.chomp
          selected.first_name = (new_name)

        when 2 then
          puts "Please inform the new last name"
          new_name = gets.chomp
          selected.last_name = (new_name)

        when 3 then
          puts "Please inform the new email"
          new_name = gets.chomp
          selected.email = (new_name)

        when 4 then
          puts "Please inform the new notes"
          new_name = gets.chomp
          selected.notes = (new_name)

        when 5 then
          main_menu
      end
    end
  end

  def delete_contact

    puts "Plese inform the contact \"ID\""
    contact_id = gets.chomp.to_i

    if Contact.find(contact_id) == false
      puts "Contact not found."
      delete_contact

    else

      puts "You have select the contact "
      selected = Contact.find(contact_id)
      puts selected.first_name
      puts "Do you want to delet this contact?"
      puts "(1) Yes, delete this contatc"
      puts "(2) No, I will select another contact"
      puts "(3) Back to main menu"
      selection = gets.chomp.to_i
        case selection
        when 1 then
          Contact.delete(selected)
        when 2 then
          delete_contact
        when 3 then
          main_menu
        end
    end
  end

  def display_all_contacts
      Contact.all.each do |contact|
        puts "\n\nContact ID: #{contact.id}"
        puts "First name: #{contact.first_name}"
        puts "Last name: #{contact.last_name}"
        puts "Email: #{contact.email}"
        puts "Notes: #{contact.notes}\n\n"
      end
  end

  def search_by_attribute
    puts "Please select which attribute do you wanna to search:"
    puts "Select 1 to search by first name"
    puts "Select 2 to search by last name"
    puts "Select 3 to search by email"
    puts "Select 4 to search by notes"
    puts "Select 5 to search by id"
    puts "Select 6 to search in all the fields"
    puts "Select 7 to back to main menu"
    selection = gets.chomp.to_i
      case selection

      when 1 then
        puts "Please inform the first name"
        name = gets.chomp
        result = Contact.find_by("first_name", name)
        if result == false
          puts "Contact not found."
        else
          puts "we found this contatcs:"
            result.each do |contact|
            puts "\n\nContact ID: #{contact.id}"
            puts "First name: #{contact.first_name}"
            puts "Last name: #{contact.last_name}"
            puts "Email: #{contact.email}"
            puts "Notes: #{contact.notes}\n\n"
            end
        end

      when 2 then
        puts "Please inform the last name"
        name = gets.chomp
        result = Contact.find_by("last_name", name)
        if result == false
          puts "Contact not found."
        else
          puts "we found this contatcs:"
            result.each do |contact|
            puts "\n\nContact ID: #{contact.id}"
            puts "First name: #{contact.first_name}"
            puts "Last name: #{contact.last_name}"
            puts "Email: #{contact.email}"
            puts "Notes: #{contact.notes}\n\n"
            end
        end

      when 3 then
        puts "Please inform the email"
        name = gets.chomp
        result = Contact.find_by("email", name)
        if result == false
          puts "Contact not found."
        else
          puts "we found this contatcs:"
            result.each do |contact|
            puts "\n\nContact ID: #{contact.id}"
            puts "First name: #{contact.first_name}"
            puts "Last name: #{contact.last_name}"
            puts "Email: #{contact.email}"
            puts "Notes: #{contact.notes}\n\n"
            end
        end

      when 4 then
        puts "Please inform the notes"
        name = gets.chomp
        result = Contact.find_by("notes", name)
        if result == false
          puts "Contact not found."
        else
          puts "we found this contatcs:"
            result.each do |contact|
            puts "\n\nContact ID: #{contact.id}"
            puts "First name: #{contact.first_name}"
            puts "Last name: #{contact.last_name}"
            puts "Email: #{contact.email}"
            puts "Notes: #{contact.notes}\n\n"
            end
        end

      when 5 then
        puts "Please inform the id"
        name = gets.chomp
        result = Contact.find_by("id", name)
        if result == false
          puts "Contact not found."
        else
          puts "we found this contatcs:"
            result.each do |contact|
            puts "\n\nContact ID: #{contact.id}"
            puts "First name: #{contact.first_name}"
            puts "Last name: #{contact.last_name}"
            puts "Email: #{contact.email}"
            puts "Notes: #{contact.notes}\n\n"
            end
        end

    when 6 then
      puts "Please inform what you are looking for:"
      value = gets.chomp
      result = Contact.find_any(value)
      if result == false
        puts "Contact not found."
      else
        puts "we found this contatcs:"
          result.each do |contact|
          puts "\n\nContact ID: #{contact.id}"
          puts "First name: #{contact.first_name}"
          puts "Last name: #{contact.last_name}"
          puts "Email: #{contact.email}"
          puts "Notes: #{contact.notes}\n\n"
          end
        end
      end
  end
end

Contact.create("Gustavo", "Mattos")
Contact.create("test", "test")
Contact.create("lala", "lele")
Contact.create("Gustavo", "second")
Contact.create("Gustavo", "third")
Contact.create("Gustavo", "fourth")






a = CRM.new
a.main_menu
