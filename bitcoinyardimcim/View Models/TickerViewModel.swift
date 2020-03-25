//
//  TickerViewModel.swift
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
import Foundation
import Combine


class TickerViewModel: ObservableObject {
    
    private var tickerService:TickerService!
    
    //view modelimizden dagılacak sınıf ticker
    //apiden dönen verileri view'e aktaracağız
    @Published var ticker =  Ticker()
     
    
    @Published var coins = ["BTC","ETH","LTC","XRP","XLM","USDT","NEO","EOS","DASH","LINK","ATOM","XTZ"]
    
   
    init() {
        self.tickerService=TickerService()
    }
    
    //view'ımızın kullanacağı değerler
    
    var sembol: String{
        if let sembol=self.ticker.pair {
            return String(format:"%.0f",sembol)
        }else{
            return ""
        }
        
    }
    
   
    
    var sembolveDoviz: String{
        if let sembolveDoviz=self.ticker.pairNormalized {
            return String(format:"%.0f",sembolveDoviz)
        }else{
            return ""
        }
        
    }
    
    
    
    var sonfiyat: String{
        if let sonfiyat=self.ticker.last {
            return String(sonfiyat)
        }else{
            return ""
        }
        
    }
    
    var enyuksekFiyat: String{
           if let enyuksekFiyat=self.ticker.high {
               return String(enyuksekFiyat)
           }else{
               return ""
           }
           
       }
    
    var endusukFiyat: String{
        if let endusukFiyat=self.ticker.low {
            return String(endusukFiyat)
        }else{
            return ""
        }
        
    }
   
    
    var enyuksekTeklif: String{
        if let enyuksekteklif=self.ticker.bid {
            return String(enyuksekteklif)
        }else{
            return ""
        }
        
    }
    
    var endusukTeklif: String{
           if let endusukTeklif=self.ticker.ask {
               return String(endusukTeklif)
           }else{
               return ""
           }
           
       }
    
    
    
    var acilisFiyat: String{
             if let acilisFiyati=self.ticker.open {
                 return String(acilisFiyati)
             }else{
                 return ""
             }
             
         }
    
    var volum: String{
                if let volum=self.ticker.volume {
                    return String(volum)
                }else{
                    return ""
                }
                
            }
       
    
    
    var ortalamaFiyat: String{
                if let ortalamaFiyat=self.ticker.average {
                    return String(ortalamaFiyat)
                }else{
                    return ""
                }
                
            }
    var fiyatDegisim: String{
                  if let fiyatDegisimi=self.ticker.daily {
                      return String(fiyatDegisimi)
                  }else{
                      return ""
                  }
                  
              }
    
    var fiyatDegisimYuzde: String{
        if let fiyatDegisimi=self.ticker.dailyPercent {
            return String(fiyatDegisimi)
        }else{
            return ""
        }
        
    }
    
    var cevrilenDoviz: String{
           if let cevrilenDoviz=self.ticker.denominatorSymbol {
               return String(cevrilenDoviz)
           }else{
               return ""
           }
           
       }
    var istenenCoin: String{
              if let istenenCoin=self.ticker.numeratorSymbol {
                  return String(istenenCoin)
              }else{
                  return ""
              }
              
          }
    
    
    
     //view tarafından kullanılacak func
    var pairName:String = ""
    func search()  {
        
        if self.pairName ==  "" {
            return
        }else {
            if let _pair=self.pairName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
                        fetchSinglePair(by: _pair+"_TRY")
                       
                   }
        }
        
       
        
       
    }
    
    
    
    
    
    //viewmodel tarafından kullanılacak özel func view ulaşamaz
    private func fetchSinglePair(by pair:String) {
        
        self.tickerService.getSinglePair(pair: pair) {  ticker in
            
            if let ticker = ticker {
                
                DispatchQueue.main.async {
                    self.ticker=ticker
                }
            }
            
        }
        
    }
    
    
    
}
