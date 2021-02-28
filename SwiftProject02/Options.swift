//
//  Options.swift
//  UserInput
//
//  Created by cpsc on 2/27/21.
//

import Foundation

class Options {
    let json = JsonAccess()
    let scram = Scramble()
    var dictionary: Dictionary<String,String> = [:]
    
    func viewAll()
    {
        dictionary = json.read()
        for key in dictionary.keys{
            print(key)
        }
        
    }
    
    func viewSingle(pass: String, key: String)
    {
        dictionary = json.read()
        var val: String?
        val = dictionary[key]
        if let unwrappedVal = val {
            let result = scram.undoScramble(shiftedStr: unwrappedVal)
            var index = result.index(result.endIndex, offsetBy: -pass.count)
            if result[index...] == pass
            {
                index = result.index(result.endIndex, offsetBy: (-pass.count - 1))
                print(result[result.startIndex...index])
                //print(result)
            }
            else
            {
                //print(result)
                print("Incorrect passphrase")
            }
        }
    }
    
    func addSingle(phrase: String, key: String, value: String)
    {
        dictionary = json.read()
        let passAltered = scram.executeScramble(newPass: value, passPhrase: phrase)
        dictionary[key] = passAltered
        json.write(dict: dictionary)
    }
    
    func deleteSingle(key: String)
    {
        dictionary = json.read()
        var dict: Dictionary<String,String>?
        dict = dictionary
        if var unwrappedDict = dict {
            unwrappedDict.removeValue(forKey: key)
            json.write(dict: unwrappedDict)
        }
        
    }
}
