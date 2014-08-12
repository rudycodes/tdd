class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :comapny_name, :email
  
  has_many :notes
  def self.merge(winner_obj,looser_obj)
    if !winner_obj.notes.nil? && !looser_obj.notes.nil? 
      winner_obj.email = looser_obj.email unless winner_obj.email.nil?
      winner_obj.notes<<looser_obj.notes
      looser_obj.delete
      winner_obj
    end
  end

  def duplicates?(dup_obj)
    if dup_obj==nil
      false
    elsif dup_obj.first_name == self.first_name && 
      dup_obj.last_name ==self.last_name && 
      dup_obj.email = self.email
      true
    else
      false 
    end  
  end
end