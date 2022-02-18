//
//  ViewController.swift
//  Vagulapuram_Calculator
//
//  Created by Vagulapuram,Satish on 2/16/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    var number1 = ""
    var number2 = ""
    var output = ""
    var operation = ""
    var currentNumber = ""
    var updated = false
    var mode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func buttonAC(_ sender: UIButton) {
        clearAll()
    }
    
    func clearAll(){
        number1 = ""
        number2 = ""
        updated = false
        operation = ""
        currentNumber = ""
        displayLabel.text = ""
        mode = false
    }
    
    func setData(_ number: String){
        if displayLabel.text == "0"{
            displayLabel.text = ""
        }
        else{
            if !updated{
                displayLabel.text! += number
                number1 += number
            }
            else{
                if !mode{
                    displayLabel.text! += number
                    number2 += number
                }
                else{
                    displayLabel.text = ""
                    displayLabel.text! += number
                    number2 += number
                }
            }
        }
    }
    
        func calTemp(_ operation:String)->String {
            if number1 != "" && number2 != ""{
                if operation == "+"{
                    number1 = String(Double(number1)! + Double(number2)!)
                    currentNumber = number2
                    number2 = ""
                    return String(number1)
                }
                if operation == "-"{
                    number1 = String(Double(number1)! - Double(number2)!)
                    currentNumber = number2
                    number2 = ""
                    return String(number1)
                }
                if operation == "*"{
                    number1 = String(Double(number1)! * Double(number2)!)
                    currentNumber = number2
                    number2 = ""
                    return String(number1)
                }
                if operation == "/"{
                    number1 = String(Double(number1)! / Double(number2)!)
                    currentNumber = number2
                    number2 = ""
                    return String(number1)
                }
                if operation == "%" {
                    let s1 = Double(number1)!
                    let s2 = Double(number2)!
                    var r = s1.remainder(dividingBy: s2)
                    number1 = String(r)
                    currentNumber = number2
                    number2 = ""
                    return String(number1)
                }
            }
            return ""
        }
        
        func outputFormatter(_ output:String)->String {
            let value = Double(output)!
            var outputStr = String(round(value * 100000) / 100000.0)
            if outputStr.contains(".0"){
                outputStr.removeSubrange(outputStr.index(outputStr.endIndex, offsetBy: -2)..<outputStr.endIndex)
            }
            return outputStr
        }
        
        
    @IBAction func buttonC(_ sender: UIButton) {
        number2 = ""
        displayLabel.text = ""
    }
    
    @IBAction func buttonChangeSign(_ sender: UIButton) {
        if number1 == ""{
            displayLabel.text = "-" + displayLabel.text!
            number1 = "\(displayLabel.text!)"
        }
        else{
            displayLabel.text = "-" + displayLabel.text!
            number2 = "\(displayLabel.text!)"
        }
    }
    
    @IBAction func buttonDivideSign(_ sender: UIButton) {
        let temp = calTemp(operation)
        operation = "/"
        displayLabel.text = (temp != "") ? outputFormatter(temp) : ""
        if temp != "" {
            // mode = true
            if number2 != ""{
                mode = true
                if updated {
                    output = String(Double(temp)! / Double(number2)!)
                    print(output)
                    if output == "inf"{
                        displayLabel.text! = "Error"
                    }
                    else{
                        displayLabel.text! = outputFormatter(output)
                    }
                }
            }
        }
        updated = true
    }
    
    @IBAction func button7(_ sender: UIButton) {
        setData("7")
    }
    
    @IBAction func button8(_ sender: UIButton) {
        setData("8")
    }
    
    @IBAction func button9(_ sender: UIButton) {
        setData("9")
    }
    
    @IBAction func buttonMultiplicationSign(_ sender: UIButton) {
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "*"
        currentNumber=""
        displayLabel.text = (temp != "") ? outputFormatter(temp) : ""
        updated = true
    }
    
    @IBAction func button4(_ sender: UIButton) {
        setData("4")
    }
    
    @IBAction func button5(_ sender: UIButton) {
        setData("5")
    }
    
    @IBAction func button6(_ sender: UIButton) {
        setData("6")
    }
    
    @IBAction func buttonSubtractSign(_ sender: UIButton) {
        if(number1 == ""){
           number1 = "0"
        }
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "-"
        currentNumber=""
        displayLabel.text = (temp != "") ? outputFormatter(temp) : ""
        updated = true
    }
    
    @IBAction func button1(_ sender: UIButton) {
        setData("1")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        setData("2")
    }
    
    @IBAction func button3(_ sender: UIButton) {
        setData("3")
    }
    
    @IBAction func buttonAdditionSign(_ sender: UIButton) {
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "+"
        currentNumber=""
        displayLabel.text = (temp != "") ? outputFormatter(temp) : ""
        updated = true
    }
    
    @IBAction func button0(_ sender: UIButton) {
        setData("0")
    }
    
    @IBAction func buttonDotSign(_ sender: UIButton) {
        setData(".")
    }

    @IBAction func buttonModSign(_ sender: UIButton) {
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "%"
        currentNumber=""
        displayLabel.text = (temp != "") ? outputFormatter(temp) : ""
        updated = true
    }
    
    @IBAction func buttonEqualsSign(_ sender: UIButton) {
        var res = ""
        switch operation {
            case "+":
            if currentNumber != "" {
                res = String(Double(number1)! + Double(currentNumber)!)
                displayLabel.text = outputFormatter(res)
                number2 = currentNumber
            }
            else{
                res = String(Double(number1)! + Double(number2)!)
                displayLabel.text = outputFormatter(res)
            }
            number1 = res
            break
            case "*":
            if currentNumber != "" {
                res = String(Double(number1)! * Double(currentNumber)!)
                displayLabel.text = outputFormatter(res)
            }
            else{
                res = String(Double(number1)! * Double(number2)!)
                displayLabel.text = outputFormatter(res)
            }
            number1 = res
            break
            case "-":
            if currentNumber != "" {
                res = String(Double(number1)! - Double(currentNumber)!)
                displayLabel.text = outputFormatter(res)
            }
            else {
                res = String(Double(number1)! - Double(number2)!)
                displayLabel.text = outputFormatter(res)
            }
            number1 = res
            break
            case "/":
            if displayLabel.text == "Error"{
                clearAll()
            }
            else {
                if currentNumber != "" {
                    res = String(Double(number1)! / Double(currentNumber)!)
                    if res == "inf"{
                        displayLabel.text! = "Error"
                        return
                    }
                    else {
                        displayLabel.text = outputFormatter(res)
                    }
                }
                else {
                    res = String(Double(number1)! / Double(number2)!)
                    if res == "inf"{
                        displayLabel.text! = "Error"
                        return
                    }
                    else {
                        displayLabel.text = outputFormatter(res)
                    }
                }
                number1 = res
            }
            break
            case "%":
            if currentNumber != "" {
                displayLabel.text = outputFormatter(res)
                let s1 = Double(number1)!
                let s2 = Double(currentNumber)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                number2 = currentNumber
            }
            else {
                let s1 = Double(number1)!
                let s2 = Double(number2)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                displayLabel.text = outputFormatter(res)
            }
            number1 = res
            break
        default:
            print("IOS")
        }
    }
}
