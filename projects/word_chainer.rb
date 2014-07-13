require 'set'
require 'debugger'

class WordChainer

  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines('dictionary.txt').map {|x| x.chomp}
    @dictionary = @dictionary.to_set
    @current_words = []
    @all_seen_words = {}
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
    @all_seen_words = {source => nil}


    while @current_words.empty? == false
      explore_current_words
    end

    p build_path(target)
  end

  def explore_current_words
    new_current_words = []

    @current_words.each do |word|
      new_words = adjacent_words(word)

      new_words.each do |new_word|
        next if @all_seen_words.keys.include?(new_word)

        @all_seen_words[new_word] = word
        new_current_words << new_word
      end

      # new_current_words.each do |x|
#         puts "#{x} => #{@all_seen_words[x]}"
#       end

      @current_words = new_current_words
    end

    new_current_words
  end

  def build_path(target)
    path = [target]

    while target != nil
      prev_word = @all_seen_words[target]

      path << prev_word

      target = prev_word
    end

    path.pop

    path
  end

end

words = WordChainer.new('filename')

words.run('market', 'socket')