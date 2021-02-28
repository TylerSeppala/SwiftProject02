//
//  main.swift
//  Project 01
//  I would like to use one of my late days on this.
//
//  Created by cpsc on 2/24/21.
//

import Foundation

class Program
{
    init()
    {
        let ops = Options()
        let passphrase = "yolo"
        var prompt = ""
        var reply = ""
        var keepRunning = true
        
        while keepRunning
        {
            //Ask a question
            //Act on the question
            //Check if we should keep running
            //If nort, change keepRunning to false
            print("Welcome to your password manager.")
            print("----------------------------------")
            print()
            prompt = Ask.AskQuestion(questionText: "What would you like to do?\n1 - View All\n2 - View Single\n3 - Add Single\n4 - Delete Single", acceptableReplies: ["1", "2", "3", "4"])
            print()
            
            switch prompt {
            case "1":
                print("Viewing all...")
                ops.viewAll()
            case "2":
                print("Viewing single...")
                prompt = Ask.AskQuestion(questionText: "Enter your passphrase. ", acceptableReplies: [passphrase])
                prompt = Ask.AskQuestion(questionText: "Enter the name of the password you want to view. ", acceptableReplies: Array(ops.dictionary.keys))
                ops.viewSingle(key: prompt)
            case "3":
                print("Adding single...")
                print("Enter the name of the new password. ")
                let name = readLine()
                print("Enter the new password. ")
                let pwd = readLine()
                ops.addSingle(key: name!, value: pwd!)
                
            case "4":
                print("Deleting single...")
                prompt = Ask.AskQuestion(questionText: "Enter the name of the password you want to delete. ", acceptableReplies: Array(ops.dictionary.keys))
                ops.deleteSingle(key: prompt)
                
            default:
                print("Viewing all...")
            }
            
            reply = Ask.AskQuestion(questionText: "Do you want to keep running?", acceptableReplies: ["no", "yes"])
            if reply == "no"
            {
                keepRunning = false
            }
        }
    }
}

class Ask
{
    static func AskQuestion(questionText output: String, acceptableReplies inputArr: [String], caseSensitive: Bool = false) -> String
    {
        print(output) // Ask our questrion
        
        //Handle response
        guard let response = readLine() else{
            // They didn't type anything
            print("Invlaid input")
            return AskQuestion(questionText: output, acceptableReplies: inputArr)
        }
        //They typed a valid response
        //verify the response is acceptable
        //or that we don't care what the response is
        if (inputArr.contains(response) || inputArr.isEmpty)
        {
            return response
        }
        else
        {
            print("Invalid input")
            return AskQuestion(questionText: output, acceptableReplies: inputArr)
        }
    }
}

let yeet = Program()



