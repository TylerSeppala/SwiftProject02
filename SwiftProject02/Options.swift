//
//  Options.swift
//  UserInput
//
//  Created by cpsc on 2/27/21.
//

import Foundation

class Options {
    let json = JsonAccess()
    var dictionary: Dictionary<String,String> = [:]
    
    func viewAll()
    {
        dictionary = json.read()
        for key in dictionary.keys{
            print(key)
        }
        
    }
    
    func viewSingle(key: String)
    {
        dictionary = json.read()
        var val: String?
        val = dictionary[key]
        if let unwrappedVal = val {
            print(unwrappedVal)
        }
    }
    
    func addSingle(key: String, value: String)
    {
        dictionary = json.read()
        dictionary[key] = value
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
