//
//  TickerService.swift
//  bitcoinyardimcim
//
//  Created by İsmail MARDİN on 24.03.2020.
//  Copyright © 2020 İsmail MARDİN. All rights reserved.
//
//url -> https://api.btcturk.com/api/v2/ticker
// url -> https://api.btcturk.com/api/v2/ticker?pairSymbol=BTC_TRY

import Foundation

class TickerService {
    
    //pair:BTCTRY
    //herkese açık api key istemiyor sınırlı
    func getSinglePair(pair:String, completion:@escaping(Ticker?) -> ()){
        
        guard let url = URL(string: "https://api.btcturk.com/api/v2/ticker?pairSymbol=\(pair)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            
            //gelen datayı kontrol ediyoruz
            guard let data=data, error == nil else {
                
                completion(nil)
                return
            }
           
             
            
            let tickerResponse = try? JSONDecoder().decode(TickerResponse.self, from: data)
           
            if let tickerResponse = tickerResponse{
                
                let ticker = tickerResponse.data[0]
                
                
                completion(ticker)
                
            }else{
                completion(nil)
                
            }
            
            
            
        }.resume()
        
        
    }
    
    
    
    
    
}
