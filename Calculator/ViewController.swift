//
//  ViewController.swift
//  Calculator
//
//  Created by Dan Navarro on 1/28/16.
//  Copyright © 2016 Dan Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    var operandStack = [Double]()
    
    @IBAction func digitPressed(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        let operand = displayValue
        operandStack.append(operand)
    }
    
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        let operation = sender.currentTitle!
        switch operation {
        case "×":
            performOperation {$0 * $1}
        case "÷":
            performOperation {$1 / $0}
        case "+":
            performOperation {$0 + $1}
        case "-":
            performOperation {$1 - $0}
        case "√":
            performSingleOperation {sqrt($0)}
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),  operandStack.removeLast())
            enter()
        }
    }
    
    func performSingleOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            print("operandStack= \(operandStack)")
        }
    }
}

