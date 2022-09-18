//
//  AchtungView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct AchtungView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var bgTimer: Bool = false
    let text: String
    let colors: [Color]
    private let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    
    init(text: String, colors: [Color]) {
        self.text = text
        self.colors = colors
    }
    
    var body: some View {
        
        ZStack() {
            
            bgTimer ? colors[0].ignoresSafeArea() : colors[1].ignoresSafeArea()
            
            Text(text)
                .foregroundColor(bgTimer ? colors[1] : colors[0])
                .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width, alignment: .center)
                .rotationEffect(.degrees(-90))
                .multilineTextAlignment(.center)
                .font(.system(size: 1000, weight: .black))
                .minimumScaleFactor(0.01)
                .lineLimit(4)
                .onReceive(timer) { _ in
                    self.bgTimer.toggle()
                }
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.gray.opacity(0.4))
                    .padding()
            }
        }//-ZStack
    }//-body
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        AchtungView(text: "HUG ME", colors: [.red, .black])
    }
}
