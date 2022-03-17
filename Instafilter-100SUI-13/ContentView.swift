//
//  ContentView.swift
//  Instafilter-100SUI-13
//
//  Created by Duncan Kent on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedImage: Image?
    @State private var inputImage: UIImage?
    @State private var showingPickerView = false
    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingPickerView = true
            }
        }
        .sheet(isPresented: $showingPickerView) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        selectedImage = Image(uiImage: inputImage)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
