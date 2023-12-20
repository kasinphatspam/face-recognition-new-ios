//
//  SideMenu.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI


struct SideMenu: View {
    
    @Binding var ignore: Bool
    @Binding var showSideBar: Bool
    @Environment(\.isPresented) var isPresented
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(.black)
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Button(action: {
                            showSideBar = false
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
                            ignore = true
                            
                        })
                        .padding(.leading)
                        
                        NavigationLink {
                            
                        } label: {
                            VStack {
                                Text("Support Center").foregroundColor(.white)
                            }
                        }.simultaneousGesture(TapGesture().onEnded{
                            openURL(URL(string: "https://pphamster.com/contactus")!)
                            ignore = true
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
                            ignore = true
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
                            ignore = true
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
                ignore = false
            }
        
    }
    
    
}

#Preview {
    SideMenu(ignore: .constant(false), showSideBar: .constant(true))
}

