//
//  CalculatorCore.swift
//  Calculator
//

class CalculatorCore {
    static func Compute(operation: CalculatorOperation, left: Double, right: Double) -> Double {
        switch operation {
            case .add:
                return left + right
            case .subtract:
                return left - right
            case .multiply:
                return left * right
            case .divide:
                if right == 0 {
                    return 0.0
                }
                return left / right
        }
    }
}
