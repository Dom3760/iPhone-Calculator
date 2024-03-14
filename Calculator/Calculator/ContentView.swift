import SwiftUI
struct ContentView: View {
    //makeing varibales that will store many booleans, and text boxes for the calculator to work
    @State private var displayText = "0"
    @State private var divide = false
    @State private var multiply = false
    @State private var subtract = false
    @State private var add = false
    @State private var equal = false
    @State private var decimal = false
    @State private var firstNum = ""
    @State private var secondNum = ""
    
    // makes a 2d array to simplify adding the buttons to the calculator.
    @State private var buttons: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        // chat gpt told me lol, but this appearently selects the background and makes an overlay that is colored black
        Color.black.edgesIgnoringSafeArea(.all)
                .overlay(

        //makes a vstack that will space everything apart
        VStack(spacing: 10) {
            //adds a space between the HStacks and the VStacks
            Spacer()
            //HStack that puts the text/ buttons on top of one another
            HStack {
                Spacer()
                //makes the text for the display
                Text(displayText)
                    //makes padding for the display to stay away from buttons.
                    .padding()
                    // makes the text have white color, rounded corners(?), and that the font size will change
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    // condition that if the count of characters is above 6 then it will change the font size
                    .font( displayText.count > 6 ? .system(size: 50) : .system(size: 80))
            }
            // makes a for each loop for each array in the button array.
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    // for each loop for the array's in the buttons array
                    ForEach(row, id: \.self) { button in
                        // if the symboles are "AC", "+/-", "%", or "C" then it will make a button with the symbole
                        if ["AC", "+/-", "%", "C"].contains(button) {
                            Button(action: {
                            // if the button is pressed it will launch the button pressed function
                            self.buttonPressed(button)
                            }) {
                            //makes the text the current button it is on, adds padding, height, and width, background color,text color, and rounds the corners
                            Text(button)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(Color(UIColor.lightGray))
                            .foregroundColor(.black)
                            .cornerRadius(50)
                                                    }
                            }
                        // if the symboles are "%", "x", "-", "+", "=" then it will make a button with the symbole
                        else if ["%", "x", "-", "+", "="].contains(button) {
                                Button(action: {
                                // if the button is pressed it will launch the button pressed function
                                self.buttonPressed(button)
                                }) {
                                Text(button)
                                //makes the text the current button it is on, adds padding, height, and width, background color,text color, and rounds the corners
                                .padding()
                                .frame(width: 80, height: 80)
                                .background(Color(UIColor.orange))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                }
                            } 
                        // if it is the "%" then it will make a button with the symbole
                        else if button == buttons[0][3]
                            {
                                Button(action: {
                                // if the button is pressed it will launch the button pressed function
                                self.buttonPressed(button)
                                }) {
                                //makes the text the current button it is on, adds padding, height, and width, background color,text color, and rounds the corners
                                Text(button)
                                .padding()
                                .frame(width: 80, height: 80)
                                .background(Color(UIColor.orange))
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                }
                            }
                            // if no other conditions above are met then it will assume that it is a number
                            else {
                                // if it is the "0" then it will make a button with the symbole
                                if button == "0"{
                                    Button(action: {
                                        // if the button is pressed it will launch the button pressed function
                                        self.buttonPressed(button)
                                    }) {
                                        //makes the text the current button it is on, adds padding, height, and width, background color,text color, and rounds the corners
                                        Text(button)
                                            .frame(width: 150, height: 50)
                                            .padding()
                                            .background(Color(UIColor.darkGray))
                                            .foregroundColor(.white)
                                            .cornerRadius(60)
                                    }
                                }
                                // the number that is pressed will trigger the buttonpressed function
                                else{
                                    Button(action: {
                                        self.buttonPressed(button)
                                    }) {
                                        //adds the numebr to button, adds padding, height, and width, background color,text color, and rounds the corners
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
        // adds padding to somthing lol
        .padding()
        )
    }
    //button pressed function that will accept the parameter that is the button pressed.
    func buttonPressed(_ button: String) {
        //if the = button is pressed it will do the oporaters
        if button == "=" {
            //if the divide button is pressed then it set divide to true and then divide the two numbers that were entered.
            if divide == true
            {
                // if the second number is zero then it will say error.
                if Int(secondNum) == 0
                {
                    // will display error and return so it will not do the next case
                    displayText = "error"
                    return
                }
                // otherwise it will bind the second numer to the display number, and will divide them, then return
                else
                {
                    secondNum = displayText
                    displayText = String(Double(firstNum)! / Double(secondNum)!)
                    return
                }
            }
            // if multiply is pressed then it will swich var to true and then do this
            if multiply == true
            {
                // it will bind thte second number to the display
                secondNum = displayText
                // it will then multiply the first and second number together and return.
                displayText = String(Double(firstNum)! * Double(secondNum)!)
                return
            }
            // if subtract is pressed then it will swich var to true and then do this
            if subtract == true
            {
                secondNum = displayText
                // it will then subtract the first and second number together and return.
                displayText = String(Double(firstNum)! - Double(secondNum)!)
                return
            }
            // if add is pressed then it will swich var to true and then do this
            if add == true
            {
                secondNum = displayText
                // it will then add the first and second number together and return.
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
        // if multiply button is pressed then it will launch this.
        else if button == "x" {
            // looked this part up. this appearently checks if the second number is 0 if not it will let the result be be the two divided numbers and then limit it to 9 characters (supposivly)
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
