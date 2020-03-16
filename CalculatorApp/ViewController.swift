//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Likhit Garimella on 07/04/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false      //Initialising from scratch
    var operation = 0;              // 0 performed operations
    
    @IBOutlet weak var label: UILabel!      //Label for output
    
    @IBAction func numbers(_ sender: UIButton) //Input buttons from 0 to 9
    {
        if performingMath == true           //Starting operation
        {
            label.text = String(sender.tag-1)    //Displays text in label
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)      //Arithmetic operation buttons declared by tags
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!   //Previous number required to perform operation along with number on screen
            
            if sender.tag == 12     //Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13    //Multiply
            {
                label.text = "x";
            }
            else if sender.tag == 14    // Minus
            {
                label.text = "-";
            }
            else if sender.tag == 15    //Plus
            {
                label.text = "+";
            }
            
            operation = sender.tag  //Assigned tags will do the operations
            performingMath = true;  //Operation done; returns true
        }
        else if sender.tag == 16    //When pressed = (tag 16), respective operations will give the respective results
        {
            if operation == 12      //Divide
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13     //Multiply
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14     // Minus
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15     //Plus
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11    //All clear
        {
            label.text = "" //Displays no text in label when pressed clear
            previousNumber = 0;
            numberOnScreen = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

