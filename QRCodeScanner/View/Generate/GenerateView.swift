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
    
    @State private var data = ""
    @State private var uiImage: UIImage? = nil
    @State private var image: Image?
    @State private var showShareSheet = false

    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View{
        
        NavigationView {
            
            VStack {
                
                Text("view.generator.info")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Constants.Colors.Blackish)
                    .font(Font.custom(Constants.Fonts.Light, size: 16))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                
                
                Text("view.generator.info.share")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Constants.Colors.Blackish)
                    .font(Font.custom(Constants.Fonts.ExtraBold, size: 16))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                
                
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
                        self.showShareSheet = true
                        
                }
                .sheet(isPresented: self.$showShareSheet) {
                    ShareSheet(photo: self.generateQRCode(from: self.data))
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
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledQrImage = outputImage.transformed(by: transform)
            
            if let cgimg = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
}
