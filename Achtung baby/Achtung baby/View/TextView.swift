//
//  TextImputView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct TextView: View {
    
    @Namespace var namespace
    
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
            VStack() {
                if isTextViewOpen {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Customise your")
                                .foregroundColor(.black)
                            Text("achtung")
                                .foregroundColor(.red)
                        }
                        .font(.custom("MarvinVisions-Bold", size: 40, relativeTo: .title))
                        
                        Spacer()
                        Button {
                            withAnimation(.easeInOut) {
                                isTextViewOpen.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.secondary)
                                .matchedGeometryEffect(id: "bottom", in: namespace)
                        }
                        
                    }
                    ColorPickerView(selectedColors: $selectedColor)
                    Spacer()
                }
                
                HStack {
                    TextField("Enter something...", text: $achtungText)
                        .padding(16)
                    //  .padding(.leading, 30)
                        .background(.white)
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(.linearGradient(colors: [.white.opacity(0.7), .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        }
                    
                    if !isTextViewOpen {
                        Button {
                            withAnimation(.easeInOut) {
                                isTextViewOpen.toggle()
                            }
                        } label: {
                            
                            LinearGradient(gradient: Gradient(colors: [.red, .yellow, .purple, .red]), startPoint: .leading, endPoint: .trailing)
                                .frame(width: 40, height: 40)
                                .mask(
                                    Image(systemName: "gearshape.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .matchedGeometryEffect(id: "bottom", in: namespace)
                                )
                        }
                    }
                    Button {
                        saveInRealm()
                        withAnimation(.spring()) {
                            isAchtungShow.toggle()
                        }
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    
                }
            }
            .padding(20)
            .cornerRadius(30)
            .background(.ultraThinMaterial)
            .fullScreenCover(isPresented: $isAchtungShow) {
                achtungText = ""
                
                withAnimation(.easeInOut) {
                    isTextViewOpen = false
                }
                
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

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(viewModel: AchtungViewModel(), isTextViewOpen: .constant(true))
    }
}
