//
//  TextImputView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct TextImputView: View {
    
    @Binding var noticeText: String
    @Binding var isSettingsOpen: Bool
    
    var body: some View {
        VStack {
            if !isSettingsOpen {
                Spacer()
            }
            
            VStack(alignment: .leading) {
                
                if isSettingsOpen {
                    HStack {
                        Text("Customise your achtung:")
                            .font(.largeTitle)
                        Spacer()
                        Button {
                            withAnimation(.spring()) {
                                isSettingsOpen.toggle()
                            }
                        } label: {
                            Image(systemName: "heart")
                            
                        }

                    }
                }

                HStack {
                    TextField("Create ACHTUNG", text: $noticeText)
                        .padding(16)
                        .padding(.leading, 30)
                        .background(.white)
                        .mask(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke()
                                .fill(.black.opacity(0.3))
                        }
                        .overlay {
                            Image(systemName: "arrow.right.circle.fill")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 15)
                                .foregroundColor(.gray)
                        }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                }
                
                Button {
                    withAnimation(.spring()) {
                        isSettingsOpen.toggle()
                    }
                    
                } label: {
                    HStack{
                        Text("Customise")
                        Image(systemName: "gearshape")
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                }
               
                
                if isSettingsOpen {
                    Spacer()
                }
            }
            .padding(20)
            .cornerRadius(30)
            .background(.ultraThinMaterial)
        }
    }
    
}

struct TextImputView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
