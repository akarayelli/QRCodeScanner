//  ScannedObject.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 31.08.2020
//  Time: 17:53

import Foundation
import SwiftUI
import SwiftyUserDefaults

class ScannedObject: Identifiable, Codable, DefaultsSerializable{
    
    var id = UUID()
    var data: String = ""
    var scanDate: String?
    var type: ObjectType?
    
    
    private enum CodingKeys: String, CodingKey {
           case data
           case scanDate
        case type
       }
    
    
    init(data: String, scanDate: String, type: ObjectType) {
        self.data = data
        self.scanDate = scanDate
        self.type = type
    }
    
 required init(from decoder:Decoder) throws {
     let values = try decoder.container(keyedBy: CodingKeys.self)
     data = try values.decode(String.self, forKey: .data)
    scanDate = try values.decode(String.self, forKey: .scanDate)

     type = try values.decode(ObjectType.self, forKey: .type)
 }

}
