# Simple_1_Timer
シンプルなTimerを作りながら、Swiftの基礎を学ぶ

# 学んだこと
## StoryBordとコードを画面分割でどちらも表示する

option + 2画面目で開きたいコードをクリック

## ボタンのラベルをコードから変更する

### setTitleメソッドを使用する
```
ボタン参照.setTitle(文字列,書式設定)
```

### サンプル
```swift
@IBOutlet weak var btn: UIButton!

class ViewController: UIViewController
{
    btn.setTitle("設定したい文字列",for: .normal)
}
```

## タイマー処理(一定間隔で呼び出す or 一定時間後１回だけ呼び出す)

### Timerメソッドを使用する

```siwft
Timer.scheduledTimer(
    timeInterval: 1,    //  ループの場合 : タイマーの間隔 ループしない場合 : 起動までの時間
    target: self,       //  メソッドを持つメソッド
    selector: #selector(呼び出すメソッド), // 実行対象のメソッド
    userInfo: nil,      //  オブジェクトにつける値
    repeats: true       //  ループするか
)
```

### 外部からTimerを停止する

timer型の変数を作成して、停止したい時に「invalidate」メソッドを呼び出して、破棄する

再度呼び出したい場合は、「scheduledTimer」で再生成する

```siwft

var timer : Timer?  //  タイマー保存用のTimer型の変数

class ViewController: UIViewController
{
    timer = Timer.scheduledTimer(
        timeInterval: 1,    //  ループの場合 : タイマーの間隔 ループしない場合 : 起動までの時間
        target: self,       //  メソッドを持つメソッド
        selector: #selector(timerUpdate), // 実行対象のメソッド
        userInfo: nil,      //  オブジェクトにつける値
        repeats: true       //  ループするか
        )
}

@objc func timerUpdate()
{
    //  タイマーを破棄してnilを設定する(サンプルのためすぐに停止している)
    self.timer?.invalidate()
    timer = nil
}
```
