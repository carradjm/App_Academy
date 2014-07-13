require 'set'

class WordChainer

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map {|x| x.chomp}
    @dictionary = Set.new

  end








end