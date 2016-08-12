//
//  ViewController.swift
//  Silly Song
//
//  Created by Kevin Kim on 8/10/16.
//  Copyright © 2016 Udacity & Kevinlabs. All rights reserved.
//
//  Udacity - Student Signature.
//  Code Signature.
//  3960c466b6e28ebeeaf7d8bbfb464ecf

import UIKit

//Variables-------
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")
//----------------

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    //Outlets----------------
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    //-----------------------
    
    
    //Actions----------------
    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(sender: AnyObject) {
        lyricsView.text! = lyricsForName(bananaFanaTemplate, fullName: nameField.text!)
        
    }
    //-----------------------


    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
} //Class--------------------


//--Func-------------
//PURE FUNCTIONS!
func shortNameForName(fullName: String) -> String {
    let lowerFullName = fullName.lowercaseString
    let vowelSet = NSCharacterSet(charactersInString:"aeiou")
    
    if let firstVowelRange = lowerFullName.rangeOfCharacterFromSet(vowelSet, options: .CaseInsensitiveSearch) {
        return lowerFullName.substringFromIndex(firstVowelRange.startIndex)
    }
    
    // No vowels - returning the full name.
    return lowerFullName
}

//PURE FUNCTIONS!
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(fullName)
    
    return lyricsTemplate.stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName).stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
}
//------------------