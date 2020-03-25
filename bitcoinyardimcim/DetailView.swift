//
//  DetailView.swift
//  bitcoinyardimcim
//
//  Created by İsmail MARDİN on 25.03.2020.
//  Copyright © 2020 İsmail MARDİN. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var tickervm : TickerViewModel
    init() {
      //  tickervm.search()
    }
       
    var body: some View {
        VStack{
            Form{
                
                Section(header: Text(tickervm.istenenCoin)) {
                       HStack{
                           Image(tickervm.istenenCoin)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 64, height: 64).padding(8)
                                          
                       
                        
                        Text(self.tickervm.pairName).fontWeight(.bold).font(.largeTitle)
                            
                        Text(self.tickervm.cevrilenDoviz).fontWeight(.bold).font(.largeTitle)
                            
                            Spacer()
                      
                                 
                        
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(12)
                                        
                     
                }
                Section{
                    Button(action: {
                        self.tickervm.search()
                    }) {
                        Text("Yenile")
                         
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

                Section(header: Text("Anlık ")){
                    HStack{
                       Text("Son Fiyat :").fontWeight(.medium).foregroundColor(.black)
                        
                        
                        Text(tickervm.sonfiyat).font(.body).foregroundColor(.gray)
                        
                        Text(self.tickervm.cevrilenDoviz).font(.caption)
                        
                        
                      
                        
                        
                    }
                    
                    HStack{
                                           Text("En iyi Satış Fiyat :").fontWeight(.medium).foregroundColor(.black)
                        Text(tickervm.endusukTeklif).foregroundColor(.gray)
                                Text(self.tickervm.cevrilenDoviz).font(.caption)
                    
                    }
                    HStack{
                                           Text("En iyi Alış Fiyat :").fontWeight(.medium).foregroundColor(.black)
                        Text(tickervm.enyuksekTeklif).foregroundColor(.gray)
                                
                    Text(self.tickervm.cevrilenDoviz).font(.caption)
                    }
                    
                    HStack{
                                           Text("Değişim Fiyat :").fontWeight(.medium).foregroundColor(.black)
                        Text(tickervm.fiyatDegisim ).foregroundColor(.gray)

                        Text(self.tickervm.cevrilenDoviz).font(.caption)
                        Text("% " + tickervm.fiyatDegisimYuzde).foregroundColor(.gray)
                    }
                                       
                }

                
                
                Section(header: Text("24 Saatlik ")) {
                    
                    
                    HStack{
                        Text("Hacim :").fontWeight(.medium).foregroundColor(.black)
                                              
                                              
                                              Text(tickervm.volum).font(.body).foregroundColor(.gray)
                                              
                                              Text(self.tickervm.istenenCoin).font(.caption)
                    }
                    
                    
                    
                    
                       HStack{

                                            Text("En Yüksek Satış Fiyat :").fontWeight(.medium).foregroundColor(.black)
                         Text(tickervm.enyuksekFiyat).foregroundColor(.gray)
                                 Text(self.tickervm.cevrilenDoviz).font(.caption)
                                           
                     
                }
                    
                    
                    HStack{

                                                               Text("En Düşük Satış Fiyat :").fontWeight(.medium).foregroundColor(.black)
                                            Text(tickervm.endusukFiyat).foregroundColor(.gray)
                                                    Text(self.tickervm.cevrilenDoviz).font(.caption)
                                                              
                                        
                                   }
                    
                    HStack{

                                                                               Text("Ortalama Fiyat :").fontWeight(.medium).foregroundColor(.black)
                                                            Text(tickervm.ortalamaFiyat).foregroundColor(.gray)
                                                                    Text(self.tickervm.cevrilenDoviz).font(.caption)
                                                                              
                                                        
                                                   }
                    
                }
                
                
                
                }//form
        }.transition(AnyTransition.opacity.combined(with: .slide))
        .onAppear {
            self.tickervm.search()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
