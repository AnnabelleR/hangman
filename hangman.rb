
 
words = %w"love music summer coding kitchen december london table travel yellow"
total_chances = 5
wrong_try = 0
right_guess = ''
 
hanged = <<HANG
GAME OVER, YOU ARE HANGED
HANG

survived = <<WIN
YOU WIN!! YOU ARE A STAR!
WIN
  
word = words[rand(words.length) - 1]
 
def get_hidden (sample_word, guessed_words)
  hidden = ''
  sample_word.chars { |char| 
    hidden += (guessed_words.include? char)? char : '#'
  }
 
  hidden
end
 
puts `clear`
puts 'Guess what is this word:'+ get_hidden(word, '')
 
while true
  print "Enter a letter, you have #{total_chances - wrong_try} chances left:"
 
  char = gets.chomp
  puts `clear`
  
  if word.include? char
 
    if(right_guess.include? char)
      puts "You had already entered '#{char}'."
      puts 'Have another go: ' + get_hidden(word, right_guess)
    else
      right_guess = right_guess + char
      hidden = get_hidden(word, right_guess)
 
      puts 'Well done! ' + hidden
    end
 
    unless hidden.include? '#'
      puts survived
      break
    end
  else
    puts "Nope, the word dosen't contains '#{char}'..."
    wrong_try += 1
 
    if (wrong_try == total_chances)
      puts hanged
      break
    else
      puts 'Have another go: ' + get_hidden(word, right_guess)
    end
  end
 
end