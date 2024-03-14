import SwiftUI

struct ContentView: View {
    @State private var displayText = "0"
    @State private var divide = false
    @State private var multiply = false
    @State private var subtract = false
    @State private var add = false
    @State private var equal = false
    @State private var decimal = false
    @State private var firstNum = ""
    @State private var secondNum = ""
    
    
    @State private var buttons: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        Color.black.edgesIgnoringSafeArea(.all)
                .overlay(

                    
        VStack(spacing: 10) {
            Spacer()
            HStack {
                Spacer()
                Text(displayText)
                    .padding()
//                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    // condition that if the count of characters is above 6 then it will change the font
                    .font( displayText.count > 6 ? .system(size: 50) : .system(size: 80))
            }
//            displayText = String(format: "%9.4f", NSDecimalNumber(decimal: Decimal(Double(displayText)!)).doubleValue)
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        if ["AC", "+/-", "%", "C"].contains(button) {
                            Button(action: {
                            self.buttonPressed(button)
                            }) {
                            Text(button)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(Color(UIColor.lightGray))
                            .foregroundColor(.black)
                            .cornerRadius(50)
                                                    }
                            } 
                        else if ["%", "x", "-", "+", "="].contains(button) {
                                Button(action: {
                                self.buttonPressed(button)
                                }) {
                                Text(button)
                                .padding()
                                .frame(width: 80, height: 80)
                                .background(Color(UIColor.orange))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                }
                            } 
                        else if button == buttons[0][3]
                            {
                                Button(action: {
                                self.buttonPressed(button)
                                }) {
                                Text(button)
                                .padding()
                                .frame(width: 80, height: 80)
                                .background(Color(UIColor.orange))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                }
                            }
                        
                            else {
                                
                                if button == "0"{
                                    Button(action: {
                                        self.buttonPressed(button)
                                    }) {
                                        Text(button)
                                            .frame(width: 150, height: 50)
                                            .padding()
                                            .background(Color(UIColor.darkGray))
                                            .foregroundColor(.white)
                                            .cornerRadius(60)
                                    }
                                
                                }
                                else{
                                    Button(action: {
                                        self.buttonPressed(button)
                                    }) {
                                        Text(button)
                                            .padding()
                                            .frame(width: 80, height: 80)
                                            .background(Color(UIColor.darkGray))
                                            .foregroundColor(.white)
                                            .cornerRadius(50)
                                    }
                                }
                               
                                
                        }
                    }
                }
            }
        }
        .padding()
        )
    }
    
    func buttonPressed(_ button: String) {
        if button == "=" {
            if divide == true
            {
                if Int(firstNum) == 0 || Int(secondNum) == 0
                {
                    displayText = "error"
                    return
                }
                else
                {
                    secondNum = displayText
                    displayText = String(Double(firstNum)! / Double(secondNum)!)
                    return
                }
            }
            if multiply == true
            {
                secondNum = displayText
                displayText = String(Double(firstNum)! * Double(secondNum)!)
                return
            }
            if subtract == true
            {
                secondNum = displayText
                displayText = String(Double(firstNum)! - Double(secondNum)!)
                return
            }
            if add == true
            {
                secondNum = displayText
                displayText = String(Double(firstNum)! + Double(secondNum)!)
                return
            }
            if secondNum == ""
            {
                return
            }
            else
            {
                displayText = "error"
            }
        }
        else if button == "x" {
            if let firstNumDouble = Double(firstNum), let secondNumDouble = Double(secondNum) {
                        if secondNumDouble != 0 {
                            let result = firstNumDouble / secondNumDouble
                            displayText = String(format: "%.9f", result)
                        }
                    }
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            
            multiply = true
            firstNum = displayText
            displayText = "0"
            
        }
        else if button == "÷" 
        {
            if let firstNumDouble = Double(firstNum), let secondNumDouble = Double(secondNum) {
                        if secondNumDouble != 0 {
                            let result = firstNumDouble / secondNumDouble
                            displayText = String(format: "%.9f", result)
                        } else {
                            displayText = "Error: Division by zero"
                        }
                    }
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            
            divide = true
            firstNum = displayText
            displayText = "0"
        }
        else if button == "-"
        {
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            
            subtract = true
            firstNum = displayText
            displayText = "0"
        }
        else if button == "+"
        {
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            
            add = true
            firstNum = displayText
            displayText = "0"
        }
        else if button == "%"
        {
            displayText = String((Double(displayText)!) / 100)
        }
        else if button == "+/-"
        {
            if decimal == true
            {
                displayText = String(Double(displayText)! * -1)
            }
            if decimal == false
            {
                displayText = String(Int(displayText)! * -1)
            }
        }
        else if button == "AC" || button == "C"
        {
            displayText = "0"
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            firstNum = ""
            secondNum = ""
            buttons[0][0] = "AC"
            
        }
        else if button == "."
        {
            if decimal == false
            {
                displayText += "."
            }
            decimal = true
        }
        else
        {
            buttons[0][0] = "C"
            if displayText == "0"
            {
                displayText = ""
                displayText += button
            }else
            {
                displayText += button
            }
            
            if displayText.count > 9 {
                    if let dotIndex = displayText.firstIndex(of: ".") {
                        // If there is a decimal point, truncate the string to 9 characters including the decimal point
                        let endIndex = displayText.index(dotIndex, offsetBy: 9, limitedBy: displayText.endIndex) ?? displayText.endIndex
                        displayText = String(displayText.prefix(upTo: endIndex))
                    } else {
                        // If there is no decimal point, truncate the string to 9 characters
                        displayText = String(displayText.prefix(9))
                    }
                }
        }
    }
}


#Preview {
    ContentView()
}
