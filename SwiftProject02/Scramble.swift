//
//  Scramble.swift
//  UserInput
//
//  Created by cpsc on 2/24/21.
//

import Foundation

class Scramble {
    var str = ""
    var strShift = ""
    var strReversed: [Character] = []
    lazy var shift = str.count
    
    // From https://stackoverflow.com/questions/41180292/negative-number-modulo-in-swift because
    // swift's % is evil
    func mod(_ a: Int, _ n: Int) -> Int {
        precondition(n > 0, "modulus must be positive")
        let r = a % n
        return r >= 0 ? r : r + n
    }

    
    func executeScramble(newPass: String, passPhrase: String) -> String {
        str = newPass + passPhrase
        strShift = ""
        shift = str.count
        strReversed = str.reversed()
        for letter in strReversed {
            strShift += String(translate(l: letter, trans: shift))
        }
        //print (strShift)
        return strShift
    }
    
    func undoScramble(shiftedStr: String) -> String
    {
        strShift = ""
        shift = shiftedStr.count
        for letter in shiftedStr {
            strShift += String(reverseTranslate(l: letter, trans: shift))
        }
        strReversed = strShift.reversed()
        //print (String(strReversed))
        return String(strReversed)
    }


    func translate(l: Character, trans: Int) -> Character
    {
        if let ascii = l.asciiValue
        {
            var outputInt = ascii
            if ascii >= 97 && ascii <= 122
            {
                outputInt = ((ascii - 97 + UInt8(trans)) % 26) + 97
            }
            else if (ascii >= 65 && ascii <= 90)
            {
                outputInt = ((ascii - 65 + UInt8(trans)) % 26) + 65
            }
            
            return Character(UnicodeScalar(outputInt))
        }
        
        return Character("")
    }
    
    func reverseTranslate(l: Character, trans: Int) -> Character
    {
        if let ascii = l.asciiValue
        {
            var outputInt = ascii
            if ascii >= 97 && ascii <= 122
            {
                outputInt = UInt8(mod((Int(ascii) - 97 - Int(trans)), 26) + 97)
            }
            else if (ascii >= 65 && ascii <= 90)
            {
                outputInt = UInt8(mod((Int(ascii) - 65 - Int(trans)), 26) + 65)
            }
            
            return Character(UnicodeScalar(outputInt))
        }
        
        return Character("")
    }

}
