//
//  ViewController.swift
//  SwiftCam
//
//  Created by 田中 賢治 on 2014/06/11.
//  Copyright (c) 2014年 com.ktanaka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(animated: Bool) {
        //カメラが使えるかチェックして、使えたらカメラを起動
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            println("カメラ取得")
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    
        //画像が選択された時に呼ばれる
        func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
            println("画像選択完了")
            
            self.dismissModalViewControllerAnimated(true)
        }
        
        func UIImageWriteToSavedPhotosAlbum(image: UIImage!, completionTarget: AnyObject!, completionSelector: Selector, contextInfo: CMutableVoidPointer){
            if completionTarget {
                // 保存失敗時
                println("保存失敗")
            }else{
                // 保存成功時
                println("保存成功")
            }
        }
        
        //画像の選択がキャンセルされた時に呼ばれる
        func imagePickerControllerDidCancel(picker: UIImagePickerController!){
            self.dismissModalViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}