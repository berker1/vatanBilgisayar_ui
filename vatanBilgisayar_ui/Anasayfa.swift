//
//  ViewController.swift
//  vatanBilgisayar_ui
//
//  Created by Berker Koparal on 2.09.2022.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var myPage: UIPageControl!
    @IBOutlet weak var firsatlarColectionView: UICollectionView!
    @IBOutlet weak var gunlukUrunlerCV: UICollectionView!
    @IBOutlet weak var tf_search_bar: UITextField!
    
    var urunlerListesi = [Urunler]()
    var gunlukUurnlerListesi = [Urunler]()
    //var currentPage:Int = 0
    let myCustomRGBColor = UIColor(red: 0.0/255.0, green: 30.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBarIcon()
        setFirsaturunleri()
        setGunlukurunler()
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let width = gunlukUrunlerCV.frame.size.width
        let itemWidth = (width - 30) / 2
        tasarim.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.7)
        gunlukUrunlerCV.collectionViewLayout = tasarim
        
        firsatlarColectionView.delegate = self
        firsatlarColectionView.dataSource = self
        
        gunlukUrunlerCV.delegate = self
        gunlukUrunlerCV.dataSource = self
        
        let apperance = UITabBarAppearance()
        apperance.backgroundColor = UIColor.white
        
        changeTabBarColor(itemAppearance: apperance.stackedLayoutAppearance)
        changeTabBarColor(itemAppearance: apperance.inlineLayoutAppearance)
        changeTabBarColor(itemAppearance: apperance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = apperance
        tabBarController?.tabBar.scrollEdgeAppearance = apperance
        
        if let tabItems = tabBarController?.tabBar.items {
            let item1 = tabItems[2]
            item1.badgeValue = "2"
        }
        
    
    }
    
    func changeTabBarColor(itemAppearance:UITabBarItemAppearance){
        //chosen
        itemAppearance.selected.iconColor = myCustomRGBColor
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: myCustomRGBColor]
        itemAppearance.selected.badgeBackgroundColor = myCustomRGBColor
        
        //not chosen
        itemAppearance.normal.iconColor = UIColor.lightGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        itemAppearance.normal.badgeBackgroundColor = myCustomRGBColor
    }
    
    func setFirsaturunleri() {
        let u1 = Urunler(urun_resim: "vatan_firsat1")
        let u2 = Urunler(urun_resim: "vatan_firsat2")
        let u3 = Urunler(urun_resim: "vatan_firsat3")
        let u4 = Urunler(urun_resim: "vatan_firsat4")
        let u5 = Urunler(urun_resim: "vatan_firsat5")
        let u6 = Urunler(urun_resim: "vatan_firsat6")
        let u7 = Urunler(urun_resim: "vatan_firsat7")
        let u8 = Urunler(urun_resim: "vatan_firsat8")
        let u9 = Urunler(urun_resim: "vatan_firsat9")
        let u10 = Urunler(urun_resim: "vatan_firsat10")
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        urunlerListesi.append(u8)
        urunlerListesi.append(u9)
        urunlerListesi.append(u10)
        
        myPage.currentPage = 1
        myPage.numberOfPages = urunlerListesi.count
    }
    
    func setGunlukurunler(){
        let gu1 = Urunler(urun_resim: "vatan_ssd", urun_kod: "CT2K8G4SFRA32A", urun_fiyat: "1.158", urun_aciklama: "Crucial 16GB (2x8GB) DDR4 3200MHz CL22 1.2V", kargo_bedava: true, urun_indirim: false)
        let gu2 = Urunler(urun_resim: "vatan_pc", urun_kod: "VG277Q1A", urun_fiyat: "3.800", urun_aciklama: "ASUS 27\" VG277Q1A 1MS(MPRT) 165HZ FullHD", kargo_bedava: true, urun_indirim: false)
        let gu3 = Urunler(urun_resim: "vatan_saat", urun_kod: "SM-R910NZAATUR", urun_fiyat: "4.999", urun_aciklama: "SAMSUNG GALAXY WATCH 5 44 MM GRAPHİTE", kargo_bedava: true, urun_indirim: false)
        let gu4 = Urunler(urun_resim: "vatan_telefon", urun_kod: "CPH2363_Turuncu", urun_fiyat: "9.299", urun_aciklama: "OPPO Reno7 (8GB+128GB) Akıllı Telefon Günbatımı Turuncusu", kargo_bedava: true, urun_indirim: false)
        
        gunlukUurnlerListesi.append(gu1)
        gunlukUurnlerListesi.append(gu2)
        gunlukUurnlerListesi.append(gu3)
        gunlukUurnlerListesi.append(gu4)
    }
    
    func setSearchBarIcon(){
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "search_icon")
        imageIcon.tintColor = .systemGray
        
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search_icon")!.size.width, height: UIImage(named: "search_icon")!.size.height)
        
        imageIcon.frame = CGRect(x: 12, y: 0, width: UIImage(named: "search_icon")!.size.width, height: UIImage(named: "search_icon")!.size.height)
        
        tf_search_bar.leftView = contentView
        tf_search_bar.leftViewMode = .always
        tf_search_bar.clearButtonMode = .whileEditing
    }
    
    func setKargoIcon(textField: UITextField) -> UITextField{
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "shipping_free")
        imageIcon.tintColor = myCustomRGBColor
        
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "shipping_free")!.size.width, height: UIImage(named: "shipping_free")!.size.height)
        
        imageIcon.frame = CGRect(x: 15, y: 0, width: UIImage(named: "shipping_free")!.size.width, height: UIImage(named: "shipping_free")!.size.height)
        
        textField.leftView = contentView
        textField.leftViewMode = .always
        textField.isEnabled = false
        textField.text = "KARGO BEDAVA"
        
        return textField
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.row
        
    }


}

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.firsatlarColectionView{
            return urunlerListesi.count
        }else{
            return gunlukUurnlerListesi.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.firsatlarColectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FirsatlarCollectionViewCell
            
            let urun = urunlerListesi[indexPath.row]
            
            cell.firsatImageView.image = UIImage(named: urun.urun_resim!)
            
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_gunluk", for: indexPath) as! GunlukUrunlerCollectionViewCell
            
            let urun = gunlukUurnlerListesi[indexPath.row]
            
            cell.image_urun.image = UIImage(named: urun.urun_resim!)
            cell.label_urun_kod.text = urun.urun_kod
            cell.label_fiyat.text = "\(urun.urun_fiyat!) TL"
            cell.label_aciklama.text = urun.urun_aciklama
            cell.tf_kargo_ucretsiz = setKargoIcon(textField: cell.tf_kargo_ucretsiz)
            if urun.urun_indirim == true {
                cell.label_indirim.isHidden = false
            }else{
                cell.label_indirim.isHidden = true
            }
            
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.3
            cell.layer.cornerRadius = 10
            
            return cell
        }
        
    }
    
    
}


