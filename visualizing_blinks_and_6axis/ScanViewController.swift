//
//  ScanViewController.swift
//  sdk-liveview-ios
//
//  Created by JINS MEME on 2016/11/01.
//  Copyright © 2016 JINS CO.,LTD. All rights reserved.
//

import UIKit
import MEMELib

class ScanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MEMELibDelegate {
    
    var peripherals: [CBPeripheral] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MEMELib.sharedInstance().delegate = self
    }
    

    /*
     // MARK: - UITableViewDataSource
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let peripheral = peripherals[indexPath.row]
        cell.textLabel?.text = peripheral.identifier.uuidString
        return cell
    }
    
    
    /*
     // MARK: - UITableViewDelegate
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //接続処理
        let peripheral = peripherals[indexPath.row]
        MEMELib.sharedInstance().connect(peripheral)
    }
    
    
    /*
     // MARK: - MEMELibDelegate
     */
    func memePeripheralFound(_ peripheral: CBPeripheral!, withDeviceAddress address: String!) {
        //新しいperipheralが見つかった場合、テーブルに表示
        if peripherals.contains(peripheral) == false {
            peripherals.append(peripheral)
            tableView.reloadData()
        }
    }
    
    func memePeripheralConnected(_ peripheral: CBPeripheral!) {
        //接続されたら閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Button
     */
    @IBAction func scanButtonPressed(_ sender: Any) {
        //スキャン開始
        MEMELib.sharedInstance().startScanningPeripherals()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
