//  ScannerResultView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 16:54

import Foundation
import SwiftUI

struct ScannerResultView: View {
    
    var scannedObject: ScannedObject
    var parentView: ScannerView
    var copyDataByDefault: Bool
    var browseByDefault: Bool

    @State private var showingAlert = false
    @State private var alertMsg = ""
    
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                Image("close")
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        self.parentView.scannedObject = nil
                }
                
                Spacer()
                
            }.padding(20)
            
            
            Text(scannedObject.scanDate!)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .font(Font.custom(Constants.Fonts.ExtraBold, size: 15))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            
            Image((scannedObject.type == .url) ? "url" : "text")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            
            Text(scannedObject.data)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .font(Font.custom(Constants.Fonts.Regular, size: 16))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                .minimumScaleFactor(0.5)
                .onTapGesture {
                    if let url = URL(string: self.scannedObject.data){
                        UIApplication.shared.open(url)
                    }else{
                        
                    }
            }
            
            
            HStack{
                Image("share")
                    .frame(width: 40, height: 40, alignment: .center)
                    .onTapGesture {
                        print("Share button was tapped")
                        self.scannedObject.data.actionSheet()
                }
                
                Image("copy")
                    .frame(width: 40, height: 40, alignment: .center)
                    .onTapGesture {
                        
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = self.scannedObject.data
                        
                        self.alertMsg = "view.alert.msg.copy.success".localized
                        self.showingAlert = true
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            

        }.background(Constants.Colors.Main)
            .cornerRadius(20)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .alert(isPresented: $showingAlert){
                Alert(title: Text("view.alert.title.success"), message: Text(self.alertMsg), dismissButton: .default(Text("ok")))
                
        }
        .onAppear(){
            
            if self.copyDataByDefault{
                let pasteboard = UIPasteboard.general
                pasteboard.string = self.scannedObject.data
            }
            
            if self.browseByDefault{
                if let url = URL(string: self.scannedObject.data){
                    UIApplication.shared.open(url)
                }
            }
            
        }
    }
}

struct ScannerResultView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}
