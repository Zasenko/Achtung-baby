//
//  ContentView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var noticeText: String = ""
    @State private var isSettingsOpen: Bool = false
   //RoundPicker var notices: [NoticeModel] = [NoticeModel(id: UUID(), firstColor: "#000000", secondColor: "#FF00FF", text: "I REALLY LOVE YOU BOY! I reaaly love you much!", date: Date()), NoticeModel(id: UUID(), firstColor: "#7CFC00", secondColor: "#007dff", text: "bla BLA bla", date: Date()), NoticeModel(id: UUID(), firstColor: "#007dff", secondColor: "#FFFF00", text: "HUG ME", date: Date()), NoticeModel(id: UUID(), firstColor: "#000000", secondColor: "#00FF00", text: "I love you!", date: Date()), NoticeModel(id: UUID(), firstColor: "#000000", secondColor: "#FF00FF", text: "ALEXEI", date: Date())]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading) {
                Group {
                    Text("ACHTUNG\nBABY")
                }
                .font(.largeTitle.bold())
                .padding()
                .padding(.leading)
                
                Group {
                    Text("Your's last achtungs:")
                        .padding(.leading)
                        .padding(.leading)
                    ScrollView(.horizontal ,showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 1.5))], alignment: .top, spacing: 0){
//                            ForEach(notices) { notice in
//                                CardView(notice: notice)
//                            }
                        }
                    }
                }
                
                Group {
                    Text("World's achtungs:")
                        .padding(.leading)
                        .padding(.leading)
                    ScrollView(.horizontal ,showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 1.8))], alignment: .top, spacing: 0){
                            
//                            ForEach(notices) { notice in
//                                CardView(notice: notice)
//                            }
                        }
                    }
                }
            }
            
            TextImputView(noticeText: $noticeText, isSettingsOpen: $isSettingsOpen)
        }
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

