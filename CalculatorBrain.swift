//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Dan Navarro on 2/2/16.
//  Copyright © 2016 Dan Navarro. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    var opStack = [Op]()
    
    enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String) {
        
    }
}