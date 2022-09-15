//
//  CardView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

//struct CardView: View {
//    let notice: NoticeModel
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(notice.text)
//                .padding()
//                .multilineTextAlignment(.center)
//                .font(.system(size: 1000, weight: .black))
//                .minimumScaleFactor(0.01)
//                .lineLimit(4)
//                .frame(width: UIScreen.main.bounds.width / 1.8, height: UIScreen.main.bounds.width / 3)
//                .foregroundColor(Color(hex: notice.firstColor))
//                .background(Color(hex: notice.secondColor).gradient.opacity(0.5))
//                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
//                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
//                .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                        .stroke(.linearGradient(colors: [.white.opacity(0.7), .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
//                )
//
//            HStack(alignment: .top) {
//                Image(systemName: "globe.europe.africa.fill")
//                VStack(alignment: .leading) {
//                    Text("Vienna")
//                        .font(.system(size: 14).bold())
//                    Text(notice.date.formatted(date: Date.FormatStyle.DateStyle.abbreviated, time: Date.FormatStyle.TimeStyle.shortened))
//                        .foregroundColor(.black.opacity(0.6))
//                        .font(.system(size: 10).bold())
//                    
//                }
//            }
//           .offset(x: 20)
//        }
//        .padding()
//    }
//}
//
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(notice: NoticeModel(id: UUID(), firstColor: "#000000", secondColor: "#FF00FF", text: "I REALLY LOVE YOU BOY! I reaaly love you much!", date: Date()))
//    }
//}
