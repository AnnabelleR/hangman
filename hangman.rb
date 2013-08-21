word = %w(january sunday cat book map table dog december music love coding argentina).sample

def get_letter 
    return gets.chomp
end

print "Welcome to the hangman game! Please enter a letter"
    letter = get_letter


def get_display(word)

    disp=''
    for i in 0...word.length
        disp=disp+'-'
    end
    return disp
end


def is_letter_in_word(word,letter)
    if (word == nil)
        return false
    else
        if(word.index(letter)!=nil)
            return true
        else
            return false
        end
    end
end


def get_letter(word,letter,display)

    if (word == nil)
        return
    else
        while(word.index(letter)!=nil)
            index=word.index(letter)
            display = display[0,index] + letter + display[index + 1,display.length]
            word = word[0,index] + '-' + word[index + 1, word.length]
        end
    end
    return display;

end


def is_finished(word, display, left)
    if(left!=0)
        if(word==display)
            return 'finished'
        else
            return 'continue'
        end
    else
        return 'lose'
    end
    
end

is_finished(get_letter(is_letter_in_word(get_display(word),letter),letter,display),left)