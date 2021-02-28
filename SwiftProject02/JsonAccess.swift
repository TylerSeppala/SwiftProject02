//
//  JsonAccess.swift
//  UserInput
//
//  Created by cpsc on 2/25/21.
//

import Foundation

class JsonAccess {
    var dictionary: [String:String] = [:]
    func write(dict: Dictionary<String,String>)
    {
        // create/write
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask,
                     appropriateFor: nil, create: true)
                .appendingPathComponent("mybadpasswords.json")

            try JSONSerialization.data(withJSONObject: dict)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
    
    func read() -> Dictionary<String,String>
    {
        // read
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask,
                     appropriateFor: nil, create: false)
                .appendingPathComponent("mybadpasswords.json")
            //print(fileURL)
            
            let data = try Data(contentsOf: fileURL)
            let dictionary = try JSONSerialization.jsonObject(with: data)
            if let jsonResult = dictionary as? Dictionary<String, String> {
                return jsonResult
            }
            else {
                return [:]
            }
            //print(dictionary)
            
        } catch {
            print(error)
            return [:]
        }
    }
}


