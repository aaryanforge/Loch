
import SwiftUI

struct SingupView1: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //details
            VStack {
                Spacer()
                Text("Welcome to Loch!")
                    .font(.system(size: 45 ,weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(.white)
                
                Spacer()
                
                TextField(
                    "Username", 
                    text: $username,
                    prompt: Text("Username...")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)

                Text("This needs to be unique")
                    .font(.system(size: 12 ,weight: .regular, design: .default))
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .frame(alignment: .bottom)

                SecureField(
                    "Password", 
                    text: $password,
                    prompt: Text("Password...")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)

                SecureField(
                    "Password", 
                    text: $confirmPassword,
                    prompt: Text("confirm Password")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)

                Text("You need at least 8 characters\nAt least 1 alphanumeric character\nAt least 1 number ")
                    .font(.system(size: 12 ,weight: .regular, design: .default))
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .frame(alignment: .bottom)

                AuthButton(todo: {isSignedOn.toggle()}, actionName: "Continue", bgColor: .blue)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SingupView1()
}
