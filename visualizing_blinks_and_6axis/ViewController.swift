//
//  ViewController.swift
//  sdk-liveview-ios
//
//  Created by JINS MEME on 2016/11/07.
//  Copyright © 2016 JINS CO.,LTD. All rights reserved.
//

import UIKit
import MEMELib


class ViewController: UIViewController, MEMELibDelegate {

    @IBOutlet weak var eyeImageView: UIImageView!
    @IBOutlet weak var bodyImageView: UIImageView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var connectionStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //瞬き用の画像設定
        var blinkImages: [UIImage] = []
        for i in 0...15 {
            let imageName = "blink_" + String(format: "%05d", i)
            let image = UIImage(named: imageName)
            blinkImages.append(image!)
        }
        eyeImageView.animationImages = blinkImages
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if MEMELib.sharedInstance().isConnected {
            //接続されている場合はデータ受信を始める
            MEMELib.sharedInstance().delegate = self
            MEMELib.sharedInstance().startDataReport()
        }
        updateView()
    }
    
    
    /*
     // MARK: - Update view
     */
    func updateView() {
        if MEMELib.sharedInstance().isConnected {
            //接続されている場合
            connectionStatusLabel.text = "Connected"
            connectionStatusLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            connectButton.setTitle("Disconnect", for: .normal)
            
            eyeImageView.alpha = 1.0
            bodyImageView.alpha = 1.0
        } else {
            //接続されていない場合
            connectionStatusLabel.text = "Not connected"
            connectionStatusLabel.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0, blue: 0.1411764706, alpha: 1)
            
            connectButton.setTitle("Connect", for: .normal)
            
            eyeImageView.alpha = 0.2
            bodyImageView.alpha = 0.2
        }
    }


    /*
     // MARK: - MEMELibDelegate
     */
    func memeRealTimeModeDataReceived(_ data: MEMERealTimeData!) {
        
        //瞬き
        print("blinkStrength:\(data.blinkStrength)")
        if data.blinkStrength > 0 {
            let speed = Double(data.blinkSpeed) / 1000.0 //瞬きのスピード
            eyeImageView.animationDuration = speed
            eyeImageView.animationRepeatCount = 1
            eyeImageView.startAnimating()
        }
        
        //傾き
        let angle = CGFloat(Double(data.roll) * M_PI / 180.0)
        bodyImageView.transform = CGAffineTransform(rotationAngle: -angle)
    }
    
    func memePeripheralDisconnected(_ peripheral: CBPeripheral!) {
        //切断された場合の処理
        
        updateView()
        
        let alertController = UIAlertController(title: "DISCONNECTED", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler:nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Button
     */
    @IBAction func connectButtonPressed(_ sender: Any) {
        if MEMELib.sharedInstance().isConnected {
            //接続されいる場合は切断処理
            MEMELib.sharedInstance().disconnectPeripheral()
        } else {
            //接続されていない場合はスキャン画面表示
            self.performSegue(withIdentifier: "ScanSegue", sender: self)
        }
    }
    
    
}
