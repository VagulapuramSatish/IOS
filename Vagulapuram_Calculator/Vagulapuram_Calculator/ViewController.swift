//
//  ViewController.swift
//  Vagulapuram_Calculator
//
//  Created by Vagulapuram,Satish on 2/16/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var displayLabel: UILabel!
    
    var num1 = ""
    var num2 = ""
    var result = ""
    var operation = ""
    var curNum = ""
    var opChange = false
    var inChainMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func buttonAC(_ sender: UIButton) {
        clearAll()
    }
    
    func clearAll(){
        num1 = ""
        num2 = ""
        opChange = false
        operation = ""
        curNum = ""
        displayLabel.text = ""
        inChainMode = false
    }
    
    func setData(_ number: String){
        if displayLabel.text == "0"{
            displayLabel.text = ""
        }
        else{
            if !opChange{
                displayLabel.text! += number
                num1 += number
            }
            else{
                if !inChainMode{
                    displayLabel.text! += number
                    num2 += number
                }
                else{
                    displayLabel.text = ""
                    displayLabel.text! += number
                    num2 += number
                }
            }
        }
    }
    
        func calTemp(_ operation:String)->String {
            if num1 != "" && num2 != ""{
                if operation == "+"{
                    num1 = String(Double(num1)! + Double(num2)!)
                    curNum = num2
                    num2 = ""
                    return String(num1)
                }
                if operation == "-"{
                    num1 = String(Double(num1)! - Double(num2)!)
                    curNum = num2
                    num2 = ""
                    return String(num1)
                }
                if operation == "*"{
                    num1 = String(Double(num1)! * Double(num2)!)
                    curNum = num2
                    num2 = ""
                    return String(num1)
                }
                if operation == "/"{
                    num1 = String(Double(num1)! / Double(num2)!)
                    curNum = num2
                    num2 = ""
                    return String(num1)
                }
                if operation == "%" {
                    let s1 = Double(num1)!
                    let s2 = Double(num2)!
                    var r = s1.remainder(dividingBy: s2)
                    num1 = String(r)
                    curNum = num2
                    num2 = ""
                    return String(num1)
                }
            }
            return ""
        }
        
        func resultFormatter(_ result:String)->String {
            let value = Double(result)!
            var resultStr = String(round(value * 100000) / 100000.0)
            if resultStr.contains(".0"){
                resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
            }
            return resultStr
        }
        
        
    @IBAction func buttonC(_ sender: UIButton) {
        num2 = ""
        displayLabel.text = ""
    }
    
    @IBAction func buttonChangeSign(_ sender: UIButton) {
        if num1 == ""{
            displayLabel.text = "-" + displayLabel.text!
            num1 = "\(displayLabel.text!)"
        }
        else{
            displayLabel.text = "-" + displayLabel.text!
            num2 = "\(displayLabel.text!)"
        }
    }
    
    @IBAction func buttonDivideSign(_ sender: UIButton) {
        let temp = calTemp(operation)
        operation = "/"
        displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
        if temp != "" {
            // inChainmode = true
            if num2 != ""{
                inChainMode = true
                if opChange {
                    result = String(Double(temp)! / Double(num2)!)
                    print(result)
                    if result == "inf"{
                        displayLabel.text! = "Error"
                    }
                    else{
                        displayLabel.text! = resultFormatter(result)
                    }
                }
            }
        }
        opChange = true
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
        curNum=""
        displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
        opChange = true
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
        if(num1 == ""){
           num1 = "0"
        }
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "-"
        curNum=""
        displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
        opChange = true
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
        curNum=""
        displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
        opChange = true
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
        curNum=""
        displayLabel.text = (temp != "") ? resultFormatter(temp) : ""
        opChange = true
    }
    
    @IBAction func buttonEqualsSign(_ sender: UIButton) {
        var res = ""
        switch operation {
            case "+":
            if curNum != "" {
                res = String(Double(num1)! + Double(curNum)!)
                displayLabel.text = resultFormatter(res)
                num2 = curNum
            }
            else{
                res = String(Double(num1)! + Double(num2)!)
                displayLabel.text = resultFormatter(res)
            }
            num1 = res
            break
            case "*":
            if curNum != "" {
                res = String(Double(num1)! * Double(curNum)!)
                displayLabel.text = resultFormatter(res)
            }
            else{
                res = String(Double(num1)! * Double(num2)!)
                displayLabel.text = resultFormatter(res)
            }
            num1 = res
            break
            case "-":
            if curNum != "" {
                res = String(Double(num1)! - Double(curNum)!)
                displayLabel.text = resultFormatter(res)
            }
            else {
                res = String(Double(num1)! - Double(num2)!)
                displayLabel.text = resultFormatter(res)
            }
            num1 = res
            break
            case "/":
            if displayLabel.text == "Error"{
                clearAll()
            }
            else {
                if curNum != "" {
                    res = String(Double(num1)! / Double(curNum)!)
                    if res == "inf"{
                        displayLabel.text! = "Error"
                        return
                    }
                    else {
                        displayLabel.text = resultFormatter(res)
                    }
                }
                else {
                    res = String(Double(num1)! / Double(num2)!)
                    if res == "inf"{
                        displayLabel.text! = "Error"
                        return
                    }
                    else {
                        displayLabel.text = resultFormatter(res)
                    }
                }
                num1 = res
            }
            break
            case "%":
            if curNum != "" {
                displayLabel.text = resultFormatter(res)
                let s1 = Double(num1)!
                let s2 = Double(curNum)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                num2 = curNum
            }
            else {
                let s1 = Double(num1)!
                let s2 = Double(num2)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                displayLabel.text = resultFormatter(res)
            }
            num1 = res
            break
        default:
            print("IOS")
        }
    }
}
