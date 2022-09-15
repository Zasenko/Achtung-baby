//
//  NoticeView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct NoticeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var bgTimer: Bool = false
    
    let text: String
    let firstColor: String
    let secondColor: String
    
    private let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            GeometryReader { geometry in
                Text(text)
                    .rotationEffect(.degrees(-90))
                    .frame(width: geometry.size.height, height: geometry.size.width, alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 1000, weight: .black))
                    .minimumScaleFactor(0.01)
                    .lineLimit(4)
                    .foregroundColor(bgTimer ? Color(hex: secondColor) : Color(hex: firstColor))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(bgTimer ? Color(hex: firstColor) : Color(hex: secondColor))
                    .onReceive(timer) { _ in
                        self.bgTimer.toggle()
                    }
                    
                
            }//-GeometryReader
            
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
        NoticeView(text: "HUG ME!", firstColor: "#d3d", secondColor: "#ffwss3")
    }
}
