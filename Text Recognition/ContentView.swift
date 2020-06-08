//
//  ContentView.swift
//  Text Recognition
//
//  Created by admin on 13/02/2020.
//  Copyright © 2020 DenysPashkov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var isShowingScannerSheet = false
    @State private var text: String = ""
	
    private let buttonInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
     
    var body: some View {
        VStack(spacing: 32) {

            Text("Vision Kit Example")
            Button(action: openCamera) {
                Text("Scan").foregroundColor(.white)
            }.padding(buttonInsets)
                .background(Color.blue)
                .cornerRadius(3.0)
//			Resoult text
            Text(text).lineLimit(nil)
        }
//			Present the camera in a sheet
		.sheet(isPresented: self.$isShowingScannerSheet) { self.makeScannerView() }
    }
     
//    Open the camera for scan
    private func openCamera() {
        isShowingScannerSheet = true
    }
     
//	Scan View for the Sheet
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: { textPerPage in
            if let text = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                self.text = text
            }
            self.isShowingScannerSheet = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
