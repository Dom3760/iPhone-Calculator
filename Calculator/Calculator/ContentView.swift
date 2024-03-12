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
    
    
    var buttons: [[String]] = [
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
                    .font(.system(size: 90))
            }
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        if ["AC", "+/-", "%"].contains(button) {
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
//                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
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
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
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
            if 
        }
        else if button == "x" {
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            
            multiply = true
            firstNum = displayText
            
        }
        else if button == "÷" 
        {
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
        }
        else if button == "-"
        {
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
        }
        else if button == "+"
        {
            divide = false
            multiply = false
            subtract = false
            add = false
            equal = false
            decimal = false
            
            displayText = (Int(displayText)! + secondNum)
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
            if displayText == "0"
            {
                displayText = ""
                displayText += button
            }else
            {
                displayText += button
            }
        }
        
        // Add conditions for other buttons as needed
    }
}


#Preview {
    ContentView()
}
