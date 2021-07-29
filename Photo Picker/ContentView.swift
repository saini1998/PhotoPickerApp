//
//  ContentView.swift
//  Photo Picker
//
//  Created by Aaryaman Saini on 29/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage = UIImage(named: "accountIcon")!
    
    var body: some View {
        
        VStack(spacing: 60){
            
            Spacer()
            
            Text("Profile")
                .font(.system(size: 50))
                .bold()
                .gradientForeground(colors: [.green, .yellow])
            
//            Spacer()

            Image(uiImage: avatarImage)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding()
                .onTapGesture {
                    isShowingPhotoPicker = true
                }
            
            Spacer()
            
        }
        .sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(avatarImage: $avatarImage)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    public func gradientForeground(colors: [Color]) -> some View{
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
