//
//  SideMenu.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI


struct SideMenu: View {
    
    @Binding var clickable: Bool
    @Binding var showSideBar: Bool
    @Environment(\.isPresented) var isPresented
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(.black.opacity(1))
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Button(action: {
                            showSideBar = false
                            clickable = true
                        }, label: {
                            Image(systemName: "xmark").foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing)
                                .frame(width: 40, height: 40)
                        })
                    }
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        NavigationLink {
                            
                        } label: {
                            VStack {
                                Text("Subscription").foregroundColor(.white)
                            }
                        }.simultaneousGesture(TapGesture().onEnded{
                            openURL(URL(string: "https://pphamster.com/subscription")!)
                            clickable = true
                            
                        })
                        .padding(.leading)
                        
                        NavigationLink {
                            
                        } label: {
                            VStack {
                                Text("Support Center").foregroundColor(.white)
                            }
                        }.simultaneousGesture(TapGesture().onEnded{
                            openURL(URL(string: "https://pphamster.com/contactus")!)
                            clickable = true
                        })
                        .padding(.leading)
                        .padding(.top)
                        
                        NavigationLink {
                            
                        } label: {
                            VStack {
                                Text("FAQ").foregroundColor(.white)
                            }
                        }.simultaneousGesture(TapGesture().onEnded{
                            openURL(URL(string: "https://www.pphamster.com")!)
                            clickable = true
                        })
                        .padding(.leading)
                        .padding(.top)
                        
                        NavigationLink {
                            
                        } label: {
                            VStack {
                                Text("About us").foregroundColor(.white)
                            }
                        }.simultaneousGesture(TapGesture().onEnded{
                            openURL(URL(string: "https://www.pphamster.com")!)
                            clickable = true
                        })
                        .padding(.leading)
                        .padding(.top)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
            )
            .onAppear() {
                clickable = false
            }
        
    }
    
    
}

#Preview {
    SideMenu(clickable: .constant(false), showSideBar: .constant(true))
}

