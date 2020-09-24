//  ScannerResultView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 16:54

import Foundation
import SwiftUI
import FirebaseAnalytics

struct ScannerResultView: View {
    
    var scannedObject: ScannedObject
    var parentView: ScannerView
    var copyDataByDefault: Bool
    var browseByDefault: Bool
    
    @State private var showingAlert = false
    @State private var alertMsg = ""
    @State private var showBrowseButton = false

    
    var body: some View{
        
        VStack{
            
            Text("view.scanner.scanning.result.info")
                .frame(maxWidth: .infinity, alignment: .top)
                .foregroundColor(Constants.Colors.Blackish)
                .font(Font.custom(Constants.Fonts.Regular, size: 15))
                .padding(30)
                .multilineTextAlignment(.center)
            
            VStack{
                
                HStack{
                    
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            self.parentView.scannedObject = nil
                    }
                    
                    Spacer()
                    
                    Text(scannedObject.scanDate!)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.white)
                        .font(Font.custom(Constants.Fonts.ExtraBold, size: 15))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    
                }.padding(20)
                
                
                
                Image((scannedObject.type == .url) ? "url" : "text")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                
                Text(scannedObject.data)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .font(Font.custom(Constants.Fonts.Regular, size: 20))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    .minimumScaleFactor(0.5)
                    
                
                
                HStack{
                    
                    if self.showBrowseButton{
                        
                        Image("www")
                            .frame(width: 40, height: 40, alignment: .center)
                            .onTapGesture {
                                print("Browse button was tapped")
                                if let url = URL(string: self.scannedObject.data){
                                    UIApplication.shared.open(url)
                                }
                        }
                    }
                    
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
                
                Analytics.logEvent("Scanned", parameters: ["data": self.scannedObject.data])

                if self.scannedObject.data.isValidURL(){
                    self.showBrowseButton = true
                }
                
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
}

struct ScannerResultView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}
