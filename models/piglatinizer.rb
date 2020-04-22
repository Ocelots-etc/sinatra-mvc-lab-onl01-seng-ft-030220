class PigLatinizer
    attr_reader :words
   
    def initialize
      @words = words
    end

    def piglatinize(words)
      if words.strip.include? " "
        piglatinize_sentence(words)
      else
        piglatinize_word(words)
      end
    end

    def piglatinize_word(words)
      first_letter = words[0].downcase
        if ["a", "e", "i", "o", "u"].include?(first_letter)
            # piglatinize word that starts with a vowel
            "#{words}way"
        else
            # piglatinize word that starts with a consonant
            consonants = []
            consonants << words[0]
              if ["a", "e", "i", "o", "u"].include?(words[1]) == false
                consonants << words[1]
                if ["a", "e", "i", "o", "u"].include?(words[2]) == false
                  consonants << words[2]
                end
              end
            "#{words[consonants.length..-1] + consonants.join + "ay"}"
        end
    end

    def piglatinize_sentence(words)
        phrase_split = words.split(" ")
        each_word_array = phrase_split.map {|word| piglatinize_word(word)}
        each_word_array.join(" ") 
    end
end
