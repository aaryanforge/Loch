//
//  Group Chat adding screen
//  Loch
//
//  Created by Mary on 04/05/2024.
//

import SwiftUI

struct VideoButton: View {
    @State private var isOn: Bool = true

    var body: some View {
        ZStack{
            Circle()
                .fill(.white)
            Image(systemName: (isOn ? "video" : "video.slash" ))
                .foregroundColor(isOn ? .green : .red)
                .scaleEffect(1.5)
        }
        .frame(maxWidth: 75)
        .padding(10)
        .onTapGesture{
            withAnimation(.easeInOut(duration: 0.3)) {
                isOn.toggle()
            }
        }
    }
    
}

struct MicButton: View {
    @State private var isOn: Bool = true

    var body: some View {
        ZStack{
            Circle()
                .fill(.white)
            Image(systemName: (isOn ? "mic" : "mic.slash" ))
                .foregroundColor(isOn ? .green : .red)
                .scaleEffect(1.5)
        }
        .frame(maxWidth: 75)
        .padding(10)
        .onTapGesture{
            withAnimation(.easeInOut(duration: 0.3)) {
                isOn.toggle()
            }
        }
    }
}

struct HangButton: View {

    var body: some View {
        ZStack{
            Circle()
                .fill(.red)
            Image(systemName: "phone.down.fill")
                .foregroundColor(.black)
                .scaleEffect(1.5)
        }
        .frame(maxWidth: 75)
        .padding(10)

    }
}

struct CallView: View {
    var body: some View{
        ZStack{
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottom)
            VStack{
                Text("Calling ...")
                    .padding(10)
                    .padding(.top, 60)
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(.white)
                
                Text("Nickname")
                    .padding(10)
                    .font(.system(size: 25, design: .default))
                    .foregroundColor(.white)
                
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(maxWidth: 105)
                    ProfilePictureCircle(size: 100, hasBorder: true)
                }
                .padding()
                
                Spacer()
                
                HStack{
                    VideoButton()
                    MicButton()
                    HangButton()
                }
                .padding(.bottom, 50)
                                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CallView()
}