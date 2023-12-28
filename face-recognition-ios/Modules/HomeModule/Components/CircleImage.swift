//
//  Circle.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct SmallCircleImage: View {
    
    private let url: String
    
    init(image: String) {
        self.url = image
    }
    var body: some View {
        AsyncImageHack(url: URL(string: url)
        ) {
            phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 32, height: 32)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 32, height: 32)
                case .failure(let error):
                    if error.localizedDescription == "cancelled" {
                        SmallCircleImage(image: url)
                    } else {
                        Image(uiImage: UIImage(named: "default")!)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
        }
    }
}

struct CircleImage: View {
    
    private let url: String
    
    init(image: String) {
        self.url = image
    }
    var body: some View {
        AsyncImageHack(url: URL(string: url)
        ) {
            phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 36, height: 36)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 36, height: 36)
                case .failure(let error):
                    if error.localizedDescription == "cancelled" {
                        CircleImage(image: url)
                    } else {
                        Image(uiImage: UIImage(named: "default")!)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                            .frame(width: 36, height: 36)
                    }
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
        }
    }
}

struct ProfileCircleImage: View {
    
    private let url: String
    
    init(image: String) {
        self.url = image
    }
    var body: some View {
        AsyncImageHack(url: URL(string: url)
        ) {
            phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 40, height: 40)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                case .failure(let error):
                    if error.localizedDescription == "cancelled" {
                        ProfileCircleImage(image: url)
                    } else {
                        Image(uiImage: UIImage(named: "default")!)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                            .frame(width: 40, height: 40)
                    }
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
        }
    }
}

struct LargeProfileCircleImage: View {
    
    private let url: String
    
    init(image: String) {
        self.url = image
    }
    var body: some View {
        AsyncImageHack(url: URL(string: url)
        ) {
            phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 120)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                case .failure(let error):
                    if error.localizedDescription == "cancelled" {
                        LargeProfileCircleImage(image: url)
                    } else {
                        Image(uiImage: UIImage(named: "default")!)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                            .frame(width: 120, height: 120)
                    }
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
        }
    }
}

struct AsyncImageHack<Content> : View where Content : View {

    let url: URL?
    @ViewBuilder let content: (AsyncImagePhase) -> Content

    @State private var currentUrl: URL?
    
    var body: some View {
        AsyncImage(url: currentUrl, content: content)
        .onAppear {
            if currentUrl == nil {
                DispatchQueue.main.async {
                    currentUrl = url
                }
            }
        }
    }
}

#Preview {
    CircleImage(image: "")
}
