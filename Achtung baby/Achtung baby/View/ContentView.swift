//
//  ContentView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct ContentView: View {
    @State private var isSettingsOpen: Bool = false
    @StateObject var viewModel = AchtungViewModel()
        
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    VStack{
                        Text("ACHTUNG")
                        Text("BABY")
                            .offset(y: -50)
                            .foregroundColor(.yellow)
                    }
                    .font(.custom("MarvinVisions-Bold", size: 70, relativeTo: .largeTitle))
                    .background {
                        Color.black.opacity(0.5)
                            .clipShape(Circle())
                            .blur(radius: 70)
                            .offset(y: -20)
                    }
                    Text("Last achtungs:")
                        .font(.custom("MarvinVisions-Bold", size: 20, relativeTo: .headline))
                        .padding(.leading)
                        .padding(.leading)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center) {
                        ForEach(viewModel.myAchtungs.reversed()) { achtung in
                            VStack {
                                CardView(achtung: achtung)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                
            }
            
            TextView(viewModel: viewModel, isTextViewOpen: $isSettingsOpen)
        }
        .background(
            Color.white.gradient
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

