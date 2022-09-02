//
//  Urunler.swift
//  vatanBilgisayar_ui
//
//  Created by Berker Koparal on 2.09.2022.
//

import Foundation

class Urunler{
    
    var urun_resim:String?
    var urun_kod:String?
    var urun_fiyat:String?
    var urun_aciklama:String?
    var kargo_bedava:Bool?
    var urun_indirim:Bool?
    
    init(urun_resim: String, urun_kod: String, urun_fiyat: String, urun_aciklama: String, kargo_bedava: Bool, urun_indirim:Bool) {
        self.urun_resim = urun_resim
        self.urun_kod = urun_kod
        self.urun_fiyat = urun_fiyat
        self.urun_aciklama = urun_aciklama
        self.kargo_bedava = kargo_bedava
        self.urun_indirim = urun_indirim
    }
    
    init(urun_resim: String) {
        self.urun_resim = urun_resim
    }
    
}
