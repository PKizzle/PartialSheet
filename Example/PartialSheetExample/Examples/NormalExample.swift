//
//  NormalExample.swift
//  PartialSheetExample
//
//  Created by Andrea Miotto on 29/4/20.
//  Copyright © 2020 Swift. All rights reserved.
//

import SwiftUI

struct NormalExample: View {

    @EnvironmentObject var partialSheetManager : PartialSheetManager
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.partialSheetManager.showPartialSheet({
                     print("normal sheet dismissed")
                }) {
                     SheetView()
                }
            }, label: {
                Text("Display the Partial Shehet")
            })
                .padding()
            Spacer()
        }
        .navigationBarTitle("Normal Example")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

let partialSheetStyle = PartialSheetStyle(
    backgroundColor: Color(UIColor.tertiarySystemBackground),
    handlerBarColor: Color(UIColor.systemGray2),
    enableCover: false,
    coverColor: .clear,
    blurEffectStyle: nil,
    sheetBlurEffectStyle: .systemUltraThinMaterial
)

struct NormalExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NormalExample()
        }
        .addPartialSheet(style: partialSheetStyle)
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
    }
}

struct SheetView: View {
    @State private var longer: Bool = false
    @State private var text: String = "some text"

    @EnvironmentObject var partialSheetManager : PartialSheetManager

    var body: some View {
        VStack {
            Group {
                Text("Settings Panel")
                    .font(.headline)

                TextField("TextField", text: self.$text)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(UIColor.systemGray2), lineWidth: 1)
                )

                Toggle(isOn: self.$longer) {
                    Text("Advanced")
                }
            }
            .padding()
            .frame(height: 50)
            if self.longer {
                VStack {
                    Text("More settings here...")
                }
                .frame(height: 200)
                .alignmentGuide(VerticalAlignment.center) { data in
                    if self.longer {
                        DispatchQueue.main.async(qos: DispatchQoS.userInteractive) {
                            self.partialSheetManager.customOffset = data.height
                        }
                    }
                    return data[VerticalAlignment.center]
                }
                .onDisappear {
                    self.partialSheetManager.customOffset = 0
                }
            }
        }
    }
}
