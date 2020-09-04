//  QRService.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 31.08.2020
//  Time: 17:57

import Foundation

protocol QRService {
    
    //Scanned object list
    func recentObjects() -> [ScannedObject]

 
}
