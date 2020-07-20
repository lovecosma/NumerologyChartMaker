class NumerologyChart < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
attr_accessor :pythag


 PYTHAG_ALPHA = [
   ['A', 1], ['J', 10], ['S', 19],
   ['B', 2], ['K', 11], ['T', 20],
   ['C', 3], ['L', 12], ['U', 21],
   ['D', 4], ['M', 13], ['V', 22],
   ['E', 5], ['N', 14], ['W', 23],
   ['F', 6], ['O', 15], ['X', 24],
   ['G', 7], ['P', 16], ['Y', 25],
   ['H', 8], ['Q', 17], ['Z', 26],
   ['I', 9], ['R', 18]
 ]

  def birthday_number
    birthday = self.birthdate.split('/')[1].to_i
    if [11, 22].include?(birthday)
      return birthday
    else
      bday_array = birthday.to_s.chars
      birthday_number = bday_array[0].to_i + bday_array[1].to_i
      return birthday_number
    end
  end

  def lifepath_number
    birthday_array = self.birthdate.split('/').join.chars
    array_sum(array_sum(birthday_array).to_s.chars)
  end

  def soulurge_number
    @vowel_values = []
    name_vowels = full_name.chars.select {|char| vowel?(char)}
    name_vowels.each do |v|
    PYTHAG_ALPHA.each do |a|
      @vowel_values << a[1] if a[0] == v
      end
    end
    if [11, 22].include?(array_sum(@vowel_values))
      return array_sum(@vowel_values)
    else
    return array_sum(array_sum(array_sum(@vowel_values).to_s.chars).to_s.chars)
   end
  end

  def soulurge_challenge
    first_last = []
    first_last << @vowel_values.first
    first_last << @vowel_values.last
    first_last.sort do |a,b|
      a<=>b
    end
    first_last.last - first_last.first
  end

  def expression_number
    full_name_values = []
    full_name_array = full_name.chars
    full_name_array.each do |v|
    PYTHAG_ALPHA.each do |a|
      full_name_values << a[1] if a[0] == v
      end
    end
    if [11, 22].include?(array_sum(full_name_values))
      return array_sum(full_name_values)
    else
    return array_sum(array_sum(array_sum(full_name_values).to_s.chars).to_s.chars)
   end
  end

def expression_challenge
  array_sum((soulurge_challenge + personality_challenge).to_s.chars)
end

  def personality_number
    @con_values = []
    name_cons = full_name.chars.select {|char| !vowel?(char)}
    name_cons.each do |v|
    PYTHAG_ALPHA.each do |a|
      @con_values << a[1] if a[0] == v
      end
    end
    if [11, 22].include?(array_sum(@con_values))
      return array_sum(@con_values)
    else
    return array_sum(array_sum(array_sum(@con_values).to_s.chars).to_s.chars)
   end
  end

  def personality_challenge
    first_last = []
    first_last << @con_values.first
    first_last << @con_values.last
    first_last.sort do |a,b|
      a<=>b
    end
    first_last.last - first_last.first
  end

  def array_sum(array)
    sum = 0
    array.each {|x| sum += x.to_i}
    sum
  end

  def full_name
    (self.first_name + self.middle_name + self.last_name).upcase
  end

  def vowel?(char)
    ["A","E","I","O","U",'a','e','i','o','u'].include?(char)
  end
end
