//
//  Ticker.swift
//  bitcoinyardimcim
//
//  Created by İsmail MARDİN on 24.03.2020.
//  Copyright © 2020 İsmail MARDİN. All rights reserved.
//
/*
 pair: bitcoin sembolü
 pairNormalized: BTC_TRY bitcoin ve para birimi
 timestamp: milisaniye cinsinden zaman
 last: son fiyat
 high: 24 saaatteki en yüksek fiyat
 low: 24 saatteki en düşük fiyat
 bid: En yüksek geçerli teklif
 ask: En düşük geçerli teklif
 open: 24 saateki açılış fiyatı
 volume: 24 saatteki toplam volüm
 average: 24 saatteki ortalama fiyat
 daily: 24 saatlik fiyat değişimi
 dailyPercent:  24 saatlik fiyat değişimi yüzdesi
 denominatorSymbol: para birimi simgesi _try
 numeratorSymbol: bitcoin birimi simgesi btc_
 
 url -> https://api.btcturk.com/api/v2/ticker
 
 */

   /*
    örnek model
    "pair": "BTCTRY",
                "pairNormalized": "BTC_TRY",
                "timestamp": 1570024156166,
                "last": 47500,
                "high": 48710,
                "low": 47000,
                "bid": 47472,
                "ask": 47670,
                "open": 47988,
                "volume": 304.41,
                "average": 47850.41,
                "daily": -318,
                "dailyPercent": -1.02,
                "denominatorSymbol": "TRY",
                "numeratorSymbol": "BTC"
    */
import Foundation
import SwiftUI


struct TickerResponse:Decodable {
   // let data:Ticker
    let data:[Ticker]
}

struct Ticker:Decodable {
    
   
    var pair: String?
         
          var pairNormalized:String?
          var timestamp:Double?
          var last:Double?
          var high:Double?
          var low:Double?
          var bid:Double?
          var ask:Double?
          var open:Double?
          var volume:Double?
          var average:Double?
          var daily:Double?
          var dailyPercent:Double?
          var denominatorSymbol:String?
          var numeratorSymbol:String?
        
        
     
    
    
    
}
