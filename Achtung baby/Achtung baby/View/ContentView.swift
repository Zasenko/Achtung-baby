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
                    Text("ACHTUNG\nBABY")
                        .font(.largeTitle.bold())
                        .padding()
                        .padding(.leading)
                        .onD
                    Text("Your's last achtungs:")
                        .padding(.leading)
                        .padding(.leading)
                    
                    LazyVGrid(columns: [GridItem(.fixed(UIScreen.main.bounds.width / 2)),GridItem(.fixed(UIScreen.main.bounds.width / 2))], spacing: 0){
                        ForEach(viewModel.myAchtungs.reversed()) { achtung in
                            CardView(achtung: achtung)
                        }
                    }
                    
                }
            }
            
            TextView(viewModel: viewModel, isTextViewOpen: $isSettingsOpen)
            
        }
        .background(
            Color(hex: "#EDEAE5").gradient
        )
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

