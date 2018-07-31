//
//  ViewController.swift
//  TableTest2
//
//  Created by keisuke naruse on 2018/07/30.
//  Copyright © 2018年 keisuke naruse. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet var table:UITableView!
    
    var selectedImage: UIImage?
    
    let imgArray: NSArray = ["1","2","3","4","5","6","7","8"]
    
    let label2Array: NSArray = ["ベトナムの写真","早くアプリ作れるようになりたい","テーブルの機能はけっこうわかってきた","DBのきのうはFirebaseかな","文章系アプリでテーブルの次って","なんの機能を覚えるんだっけ","タップで画面が遷移する機能はいいね","Wikipediaのパクリ文章を自動更新できるといいな"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let img = UIImage(named: imgArray[indexPath.row] as! String)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        let label1 = cell.viewWithTag(2) as! UILabel
        label1.text = "No." + String(indexPath.row + 1)
        
        let label2 = cell.viewWithTag(3) as! UILabel
       label2.text = String(describing: label2Array[indexPath.row])
        //label2.text = String(description: label2Array[15])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    //Cellが選択された場合
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //[indexPath.row]から画像名を探し、UIImageを設定
        selectedImage = UIImage(named: imgArray[indexPath.row] as! String)
        
        if selectedImage != nil {
            //SubViewControllerへ遷移する為にsegueを呼び出す
            performSegue(withIdentifier: "toSubViewController", sender: nil)
        }
    }
 
    //Segueの準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSubViewController"){
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            
            //SubViewController のselectedImageに選択された画像を設定する
            subVC.selectedImg = selectedImage
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

