//
//  SplashView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            Spacer()
            
            Image("icon").resizable().frame(width: 160, height: 160)
            
            
            Spacer()
            Text("Copyright © 2023 Face Prove").font(.system(size: 12)).padding(24)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    SplashView()
}
