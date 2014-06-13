//
//  ViewController.swift
//  SwiftCam
//
//  Created by 田中 賢治 on 2014/06/11.
//  Copyright (c) 2014年 com.ktanaka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //UIImagePickerControllerはviewDidLoadの中では書けないらしい
    override func viewDidAppear(animated: Bool) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    //UIImagePickerControllerのデリゲートメソッド
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        UIImageWriteToSavedPhotosAlbum(image, self, "imageDidFinishSavingWithErrorContextInfo:error:contextInfo:", nil)
        self.dismissModalViewControllerAnimated(true)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) -> Void {
        NSLog("Canceled")
        self.dismissModalViewControllerAnimated(true)
    }
    
    //UIImageWriteToSavedPhotosAlbumのcompletionメソッド
    func imageDidFinishSavingWithErrorContextInfo(image: UIImage!, error: NSErrorPointer, contextInfo: CMutableVoidPointer){
        if error {
            NSLog("ImageSaving Failed")
        }else{
            NSLog("ImageSaving Succeeded")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}