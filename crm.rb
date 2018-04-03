require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu

    when true

      print_main_menu
      option = gets.chomp
      call_option(option)


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
    contact_id = gets.chomp
    puts "You have select the contact "
    Contact.find(contact_id)
    puts "Please select which attribute do you wanna change:"
    puts "Select 1 to change the first name"
    puts "Select 2 to change the last name"
    puts "Select 3 to change the email"
    puts "Select 4 to change the notes"

    select = gets.chomp

    case select

      when 1 then
        puts "Please inform the new fisrt name"
        new_name = gets.chomp
        contact.first_name = (new_name)

      when 2 then
        puts "Please inform the new last name"
        new_name = gets.chomp
        contact.last_name = (new_name)

      when 3 then
        puts "Please inform the new email"
        new_name = gets.chomp
        contact.email = (new_name)

      when 4 then
        puts "Please inform the new notes"
        new_name = gets.chomp
        contact.notes = (new_name)
      end
    end




  end

  def delete_contact(id)

    puts "Plese inform the contact \"ID\""
    contact_id = gets.chomp
    puts "You have select the contact "
    Contact.find(contact_id)
    puts "Do you want to delet this contact?"
    puts "(1) Yes, delete this contatc"
    puts "(2) No, keep this contact"
    selection = gets.chomp
    case selection
    when 1 then
      @@contacts.delete(contact)
  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end
