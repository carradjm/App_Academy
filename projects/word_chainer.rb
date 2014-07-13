require 'set'
require 'debugger'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines('dictionary.txt').map {|x| x.chomp}
    @dictionary = @dictionary.to_set
    @current_words = []
    @all_seen_words = []
  end

  def adjacent_words(word)
    alphabet = ('a'..'z').to_a

    adjacent_words = []

    (0..(word.length-1)).each do |x|
      alphabet.each do |y|
        word_dup = word.dup
        next if word_dup[x] == y

        word_dup[x] = y
        if dictionary.include?(word_dup)
          adjacent_words << word_dup
          end
        end

      end

    adjacent_words
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]

  end

end

words = WordChainer.new('filename')

puts words.adjacent_words("ball")