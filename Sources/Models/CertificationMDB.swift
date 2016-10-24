////
////  CertificationMDB.swift
////  TMDBSwift
////
////  Created by George Kye on 2016-06-07.
////  Copyright © 2016 George Kye. All rights reserved.
////
//
//import Foundation
//
//
//public struct Certification: ArrayObject{
//  public var certification: String!
//  public var meaning: String!
//  public var order: Int!
//  
//  init(results: JSON){
//    certification = results["certification"].string
//    meaning = results["meaning"].string
//    order = results["order"].int
//  }
//}
//
// struct TVCertifications{
//  
//  public var RU: [Certification]!
//  public var US: [Certification]!
//  public var CA: [Certification]!
//  public var AU: [Certification]!
//  public var FR: [Certification]!
//  public var DE: [Certification]!
//  public var TH: [Certification]!
//  public var KR: [Certification]!
//  public var GB: [Certification]!
//  public var BR: [Certification]!
//  
//  init(json: JSON){
//    RU = Certification.initialize(json: json["RU"])
//    US = Certification.initialize(json: json["US"])
//    CA = Certification.initialize(json: json["CA"])
//    AU = Certification.initialize(json: json["AU"])
//    FR = Certification.initialize(json: json["FR"])
//    DE = Certification.initialize(json: json["DE"])
//    TH = Certification.initialize(json: json["TH"])
//    KR = Certification.initialize(json: json["KR"])
//    GB = Certification.initialize(json: json["GB"])
//    BR = Certification.initialize(json: json["BR"])
//  }
//}
//
//public struct MovieCertifications{
//  
//  public var US: [Certification]!
//  public var CA: [Certification]!
//  public var AU: [Certification]!
//  public var DE: [Certification]!
//  public var FR: [Certification]!
//  public var NZ: [Certification]!
//  public var NI: [Certification]!
//
//  public var TH: [Certification]!
//  public var KR: [Certification]!
//  public var GB: [Certification]!
//  public var BR: [Certification]!
//  
//  init(json: JSON){
//    US = Certification.initialize(json: json["US"])
//    CA = Certification.initialize(json: json["CA"])
//    AU = Certification.initialize(json: json["AU"])
//    DE = Certification.initialize(json: json["DE"])
//    FR = Certification.initialize(json: json["FR"])
//    NZ = Certification.initialize(json: json["NZ"])
//    NZ = Certification.initialize(json: json["NZ"])
//
//
//    TH = Certification.initialize(json: json["TH"])
//    KR = Certification.initialize(json: json["KR"])
//    GB = Certification.initialize(json: json["GB"])
//    BR = Certification.initialize(json: json["BR"])
//  }
//}
//
//public struct CertificationsMDB{
//  
//  
////  Get the list of supported certifications for movies. These can be used in conjunction with the certification_country and certification.lte parameters when using discover.
//  
//  ///Get the list of supported certifications for tv shows.
//  public static func tv(apiKey: String, completionHandler: (clientReturn: ClientReturn, data: TVCertifications) -> ()) -> Void{
//    Client.Certification(apiKey, listType: "tv"){
//      data in
//      let certs = TVCertifications.init(json: "certifications")
//      completionHandler(clientReturn: data, data: certs)
//    }
//  }
//  
//}
