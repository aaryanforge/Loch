
import SwiftUI

struct SingupView2: View {
    @State private var name: String = ""
    @State private var nickname: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //details
            VStack {
                Spacer()
                Text("What do we call you?")
                    .font(.system(size: 45 ,weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(.white)
                
                Spacer()
                
                TextField(
                    "Name", 
                    text: $name,
                    prompt: Text("Name...")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)

                Text("Please enter your real name")
                    .font(.system(size: 12 ,weight: .regular, design: .default))
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .frame(alignment: .bottom)

                TextField(
                    "Nickname", 
                    text: $nickname,
                    prompt: Text("Nickname...")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)

                Text("You can change this later")
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
    SingupView2()
}
