
import SwiftUI

struct VerificationView: View {
    @State private var name: String = ""
    @State private var isWaiting = true

    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //details
            VStack {
                Spacer()
                Text("Verification")
                    .font(.system(size: 45 ,weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(.white)

                Text("Please ask your parent to proximity lock onto you on their Loch app")
                    .font(.system(size: 18 ,weight: .regular, design: .default))
                    .padding(.trailing)
                    .foregroundColor(.white)
                    .frame(maxWidth:250, alignment: .bottom)

                Spacer()

                if isWaiting{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(3)
                } else {
                    Image(systemName: "person.badge.shield.checkmark.fill")
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: 100, height: 100)
                }

                Spacer()

                AuthButton(todo: {isSignedOn.toggle()}, actionName: "Continue", bgColor: isWaiting ? .gray : .blue)
                Spacer()
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    VerificationView()
}
