//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    var leftValue: String? = nil
    var rightValue: String? = nil
    var operation: CalculatorOperation? = nil // +, -, *, or /
    var result: Double? = nil {
        didSet {
            // update resultDisplay to show the new text
            if result != nil {
                resultDisplay.text = self.cleanValue(value: result!)
                leftValue = "\(result!)"
            } else {
                resultDisplay.text = "0"
                leftValue = nil
            }

            // update leftValue, rightValue, and operation for a possible next operation
            rightValue = nil
            operation = nil
        }
    }

    @IBOutlet weak var resultDisplay: UILabel!

    // Number button: 0, 1, 2, ...
    @IBAction func touchNumberButton(_ sender: UIButton) {
        // note: we can safely unwrap the optional b/c we are positive the button has a title in the UI
        let operationValue: String = sender.currentTitle!

        // decide how to use this number: leftValue or rightValue
        if operation == nil {
            if leftValue == nil {
                leftValue = ""
            }

            leftValue?.append(operationValue)
            resultDisplay.text = leftValue
        } else {
            if rightValue == nil {
                rightValue = ""
            }

            rightValue?.append(operationValue)
            resultDisplay.text = rightValue
        }
    }

    // Operation button: +, -, *, or /
    @IBAction func touchOperationButton(_ sender: UIButton) {
        // note: we can safely unwrap the optional b/c we are positive the button has a title in the UI
        let operationValue: String = sender.currentTitle!
        let operation: CalculatorOperation = CalculatorOperation(rawValue: operationValue)!
        self.operation = operation
    }

    // Adds '.' before the value
    @IBAction func touchDecimalButton(_ sender: UIButton) {
        if operation == nil {
            if leftValue == nil {
                leftValue = "0."
            } else {
                leftValue?.append(".")
            }
            
            resultDisplay.text = leftValue
        } else {
            if rightValue == nil {
                rightValue = "0."
            } else {
                rightValue?.append(".")
            }
            
            resultDisplay.text = rightValue
        }
    }

    @IBAction func touchResultButton(_ sender: UIButton) {
        // result button pressed, so lets do a calculation! (if possible)
        if (leftValue != nil) && (rightValue != nil) && (operation != nil) {
            // both leftValue and rightValue exist, awesome!
            let computedResult: Double = CalculatorCore.Compute(
                operation: operation!, left: Double(leftValue!)!, right: Double(rightValue!)!)
            result = computedResult
        }
    }

    @IBAction func touchClearButton(_ sender: UIButton) {
        result = nil
        leftValue = nil
        rightValue = nil
        operation = nil
    }

    // Returns a 'clean' number if the double ends in 0 (ex: 2.0),
    // otherwise, it returns the normal double as a string with a maximim
    // of 6 decimal points
    // https://stackoverflow.com/a/31390870
    func cleanValue(value: Double) -> String {
        let valueNSNumber: NSNumber = NSNumber(value: value)
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6

        return formatter.string(from: valueNSNumber)!
    }
}
