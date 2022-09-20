//
//  CardView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI
import RealmSwift

struct CardView: View {
    @ObservedRealmObject var achtung: AchtungRealm
    var colors: [Color] = [.black, .white]
    @State private var isAchtungShow = false
    
    init(achtung: AchtungRealm) {
        self.achtung = achtung
        guard let colors: PickerColors = PickerColors.enumValueFromString(string: achtung.colors) else { return }
        self.colors = colors.getColors(pickerColors: colors)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(achtung.text)
                .padding()
                .multilineTextAlignment(.center)
                .font(.custom("MarvinVisions-Bold", size: 1000))
                .minimumScaleFactor(0.01)
                .lineLimit(4)
                .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 4)
                .foregroundColor(colors[0])
                .background(colors[1].gradient)//.opacity(0.5))
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(.linearGradient(colors: [.white.opacity(0.7), .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
        }
        .padding()
        .onTapGesture {
            withAnimation(.spring()) {
                isAchtungShow.toggle()
            }
        }
        .fullScreenCover(isPresented: $isAchtungShow) {
            isAchtungShow = false
        } content: {
            AchtungView(text: achtung.text, colors: colors)
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(achtung: AchtungRealm())
    }
}
