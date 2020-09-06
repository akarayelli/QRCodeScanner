//  GenerateView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 6.09.2020
//  Time: 20:23

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins
import LinkPresentation

struct GenerateView: View {
    
    @State private var data = "Enter text to generate"
    @State private var uiImage: UIImage? = nil

    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View{
        
        NavigationView {
            
            VStack {
                
                Text("view.generator.info")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Constants.Colors.Blackish)
                    .font(Font.custom(Constants.Fonts.Light, size: 16))
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                /*
                Text("view.generator.info.share")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Constants.Colors.Blackish)
                    .font(Font.custom(Constants.Fonts.ExtraBold, size: 16))
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                */
                
                TextField("view.generator.input.placeholder", text: $data)
                    .font(Font.custom(Constants.Fonts.ExtraBold, size: 12))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                
                Image(uiImage: self.generateQRCode(from: self.data))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200 ,height: 200)
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    .onTapGesture {
                        print("QR code tapped.")
                }
                
                

                Spacer()
                
            }
            .navigationBarTitle("view.generator.button.generate")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
}
