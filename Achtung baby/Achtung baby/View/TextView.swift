//
//  TextImputView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct TextView: View {
    
    @ObservedObject var viewModel: AchtungViewModel
    @Binding var isTextViewOpen: Bool
    
    @State private var achtungText: String = ""
    @State private var selectedColor: PickerColors = .blackWhite
    @State private var isAchtungShow: Bool = false
    
    var body: some View {
        VStack {
            if !isTextViewOpen {
                Spacer()
            }
            VStack(alignment: .leading) {
                if isTextViewOpen {
                    HStack {
                        Text("Customise your achtung:")
                            .font(.largeTitle)
                        Spacer()
                        Button {
                            withAnimation(.spring()) {
                                isTextViewOpen.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                        
                    }
                    ColorPickerView(selectedColors: $selectedColor)
                    Spacer()
                }
                HStack {
                    TextField("Create ACHTUNG", text: $achtungText)
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
                        saveInRealm()
                        withAnimation(.spring()) {
                            isAchtungShow.toggle()
                        }
                        
                        
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                }
                
                Button {
                    withAnimation(.spring()) {
                        isTextViewOpen.toggle()
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
                
            }
            .padding(20)
            .cornerRadius(30)
            .background(.ultraThinMaterial)
            .fullScreenCover(isPresented: $isAchtungShow) {
                achtungText = ""
                isTextViewOpen = false
            } content: {
                AchtungView(text: achtungText, colors: selectedColor.getColors(pickerColors: selectedColor))
            }

        }
    }
    
    private func saveInRealm() {
        let achtungRealm = AchtungRealm()
        achtungRealm.colors = selectedColor.rawValue
        achtungRealm.text = achtungText
        viewModel.$myAchtungs.append(achtungRealm)
    }
}

//struct TextImputView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
