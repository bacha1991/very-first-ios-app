//
//  CalcBrain.swift
//  test
//
//  Created by Maksym Bachynskyi on 16.11.2019.
//  Copyright © 2019 Maksym Bachynskyi. All rights reserved.
//

import Foundation

struct CalBrain {
    
    private var accum: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation(((Double, Double) -> Double))
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "±": Operation.unaryOperation({ -$0 }),
        "*": Operation.binaryOperation({ $0 * $1 }),
        "/": Operation.binaryOperation({ $0 / $1 }),
        "-": Operation.binaryOperation({ $0 - $1 }),
        "+": Operation.binaryOperation({ $0 + $1 }),
        "=": Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let constant = operations[symbol] {
            switch constant {
                case .constant(let value):
                    accum = value
                    break
                case .unaryOperation(let function):
                    if accum != nil {
                        accum = function(accum!)
                    }
                    break
                case .binaryOperation(let function):
                    if accum != nil {
                        pbo = PendingBinaryOperation(function: function, firtstOperand: accum!)
                        accum = nil
                    }
                    break
                case .equals:
                    performBinOperation()
            }
        }
    }
    
    private mutating func performBinOperation() {
        if pbo != nil && accum != nil {
            accum = pbo!.perform(accum!)
        }
    }
    
    private var pbo: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firtstOperand: Double
        
        func perform(_ secondOprand: Double) -> Double {
            return function(firtstOperand, secondOprand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accum = operand
    }
    
    var result: Double? {
        get {
            return accum
        }
    }
    
    mutating func addUnaryOperator(named symbol: String, _ operation: @escaping (Double) -> Double) {
        operations[symbol] = Operation.unaryOperation(operation)
    }
}
