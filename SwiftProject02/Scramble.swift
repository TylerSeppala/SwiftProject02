//
//  Scramble.swift
//  UserInput
//
//  Created by cpsc on 2/27/21.
//

import Foundation

class Scramble {
    var str = "Yo what's up home slice!"
    var strShift = ""
    var strReversed: [Character] = []
    lazy var shift = str.count
    
    func executeScramble(newPass: String, passPhrase: String) -> String {
        str = newPass + passPhrase
        strReversed = str.reversed()
        for letter in strReversed {
            strShift += String(translate(l: letter, trans: shift))
        }
        print (strShift)
        return strShift
    }


    func translate(l: Character, trans: Int) -> Character
    {
        if let ascii = l.asciiValue
        {
            var outputInt = ascii
            if ascii >= 97 && ascii <= 122
            {
                // a = 97
                // 97 - 97 = 0
                // 0 + 27 = 27
                // 27 % 26 = 1
                // 1 + 97 = 98 (b)
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

}
