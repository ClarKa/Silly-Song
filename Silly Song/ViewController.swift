//
//  ViewController.swift
//  Silly Song
//
//  Created by Kaifu Wang on 9/14/17.
//  Copyright © 2017 kaifuw. All rights reserved.
//

import UIKit

func shortNameFromName(name: String) -> String {
    let set = CharacterSet(charactersIn: "aiueo")
    let firstVowel = name.rangeOfCharacter(from: set)
    
    return name.substring(from: (firstVowel?.lowerBound)!)
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let capName = fullName.capitalized
    let shortName = shortNameFromName(name: fullName)
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: capName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        if (nameField.text == "") {
            return
        }
        
        let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        
        lyricsView.text = lyrics
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

