//
//  ContentView.swift
//  bitcoinyardimcim
//
//  Created by İsmail MARDİN on 24.03.2020.
//  Copyright © 2020 İsmail MARDİN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tickervm:TickerViewModel
    @State private var selectedcoin = 1
    @State private var coinname = ""
    @State var presentingModal = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                
              

                
                
                Form{
                    
                    
                    Section{
                        HStack{
                            Spacer()
                            Text("Görüntülemek istediğiniz Bitcoin Seçiniz")
                            Spacer()
                        }
                        VStack{
                            Picker("",selection: $selectedcoin ) {
                                ForEach(0 ..< self.tickervm.coins.count) {
                                    Text(self.tickervm.coins[$0])
                                }
                                
                            }.labelsHidden()
                             .pickerStyle(WheelPickerStyle())
                                .onReceive([self.selectedcoin].publisher.first()) { (value) in
                               self.tickervm.pairName = self.tickervm.coins[self.selectedcoin]
                                
                            }
                        }.frame( width:UIScreen.main.bounds.width)
                        
                        
                        
                        
                    }
                    
                    Section{
                        HStack{
                            NavigationLink(destination: DetailView() ) {
                                    Text("Görüntüle").foregroundColor(.gray).font(.largeTitle)
                                         
                                
                            }
                             
                        }
                          }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                  
                
                
                 
                
                
                }
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
