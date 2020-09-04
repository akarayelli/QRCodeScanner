//  ScannerView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 11:28

import Foundation
import SwiftUI

struct ScannerView: View{
    
    @State var scannedObject: ScannedObject?
    
    @ObservedObject var scannerViewModel = ScannerViewModel()
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 0) {
                
                if self.scannedObject != nil {
                    
                    ScannerResultView(scannedObject: self.scannedObject!,
                                      parentView: self,
                                      copyDataByDefault: self.scannerViewModel.checkIfCopyByDefault(),
                                      browseByDefault: self.scannerViewModel.checkIfBrowseByDefault())
                    
                }else{
                    self.scannerSheet
                }
                
            }
            .navigationBarTitle((self.scannedObject == nil) ? "view.scanner.scanning" : "view.scanner.scanning.result", displayMode: .inline)
        }
        
    }
    
    
    var scannerSheet : some View {
        
        ZStack{
            
            ZStack(alignment: .top) {
                Color.clear
                Text("view.scanner.scanning.info")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(Font.custom(Constants.Fonts.ExtraBold, size: 16))
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                
            }.zIndex(40)
                .padding(20)
            
            
            
            
            if self.scannerViewModel.flashOn{
                Image("flashOn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .topLeading)
                    .zIndex(20)
                    .onTapGesture {
                        print("Flash is ON")
                        self.scannerViewModel.toggleTorch(on: false)
                        
                }
            }else{
                Image("flashOff")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .topLeading)
                    .zIndex(20)
                    .onTapGesture {
                        print("Flash is OFF")
                        self.scannerViewModel.toggleTorch(on: true)
                        
                }
            }
            
            GeometryReader { metrics in
                Image("frame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: metrics.size.width * 0.7 ,height: metrics.size.width * 0.7)
                
            }.zIndex(10)
            
            CodeScannerView(
                codeTypes: [.qr],
                simulatedData: "Sample read QR CODE",
                vibrate: self.scannerViewModel.checkIfVibrate(),
                playSound: self.scannerViewModel.checkIfBeepSound(),
                completion: { result in
                    if case let .success(code) = result {
                        
                        let scannedObject = ScannedObject(data: code, scanDate: Date().toString(format: Constants.DateFormat.dd_mm_yyyy_hh_ss), type: code.verifyUrl() ? .url : .text)
                        
                        if self.scannerViewModel.checkIfSaveToRecentList(){
                            self.scannerViewModel.addToRecentList(scannedObject: scannedObject, removeDuplicate: self.scannerViewModel.checkIfRemoveDuplicate())
                        }
                        
                        self.scannedObject = scannedObject
                    }
            }
            )
        }
    }
}


struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
