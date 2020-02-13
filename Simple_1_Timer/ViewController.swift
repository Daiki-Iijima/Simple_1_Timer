//
//  ViewController.swift
//  Simple_1_Timer
//
//  Created by 飯島大樹 on 2020/02/13.
//  Copyright © 2020 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimerText: UILabel!
    
    @IBAction func OnInputButton(_ sender: Any) {
        
        if(timer != nil)
        {
            self.timer?.invalidate()
            timer = nil
            TimerButton.setTitle(startText, for: .normal)
        }
        else
        {
            TimerButton.setTitle(stopText, for: .normal)
            //  タイマーを作成、起動
            timer = Timer.scheduledTimer(
                timeInterval: 1,    //  ループの場合 : タイマーの間隔 ループしない場合 : 起動までの時間
                target: self,       //  メソッドを持つメソッド
                selector: #selector(ViewController.timerUpdate), // 実行対象のメソッド
                userInfo: nil,      //  オブジェクトにつける値
                repeats: true       //  ループするか
            )
            
            
        }
        
        
    }
    @IBAction func OnResetButton(_ sender: Any) {
       self.timer?.invalidate()
        timer = nil
        TimerButton.setTitle(startText, for: .normal)
        time = 0;
        TimerText.text = String(time)
    }
    
    @IBOutlet weak var TimerButton: UIButton!
    
    var timer : Timer?
    private var time = 0
    
    private var startText = "スタート"
    private var stopText = "ストップ"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func timerUpdate() {
        
        time += 1
        
        TimerText.text = String(time)
    }

}

