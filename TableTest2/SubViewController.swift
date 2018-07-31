//
//  SubViewController.swift
//  TableTest2
//
//  Created by keisuke naruse on 2018/07/31.
//  Copyright © 2018年 keisuke naruse. All rights reserved.
//

import Foundation
import UIKit

class SubViewController: UIViewController{
    
   
    @IBOutlet weak var imageView: UIImageView!
    // @IBOutlet var imageView: UIImage!
    var selectedImg: UIImage!
    
    //戻るボタンはセグエで繋げているのでこちらのファイルにプログラムはない
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        imageView.image = selectedImg
        
        //画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
    }
    
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        
    }
}
