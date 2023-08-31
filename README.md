# FantasyWizard2D
## 作成者	
佐生絢弥

## 所属 
バンタンゲームアカデミー大阪校ゲームプログラム総合

|開発の詳細||
----|----
|製作期間|48日(240時間)|
|制作時期|2年5月開始|
|制作人数|1人|
|ジャンル|2Dシューティング|
|プレイ人数|1人|
|プレイ時間想定|30分|
|プラットフォーム|PC|

## 開発環境　　　　　　
　　Microsoft Visual Studio 
　　OpenGL
  
## 製作意図
　　OpenGLでのゲームを作るにあたって自分の作成したプログラムの土台で動くゲームを作りたかったため作成しました。

## アプリケーションの内容
　　トップビューの2Dシューティングゲームでステージは1~5迄あり5面のボスを倒すとクリアします。
  　タイムに合ったスコアが出てくるので高得点を目指しましょう。   
<img src="https://github.com/june-mare/FantasyWizard2D/blob/master/FantasyWizard%20Play.png" alt="Play" title="Play" width="500" height="340">
### その他のルール
- フィールド上の建物や敵を倒すことで回復アイテムが低確率で落ちHPを増量できます。
- フィールド上の宝箱のオブジェクトを壊すことで武器がドロップし、取得すると攻撃の種類が変わり、強化されます。

   <img src="https://github.com/june-mare/FantasyWizard2D/blob/master/FantasyWizard%20Drop.png" alt="Drop" title="Drop" width="500" height="340">

## 起動方法
　　OpenGLGame.exeを起動してください。

## 操作方法
- W.A.S.Dを押して 移動
- 左シフトor右シフトを押している間　向いてる方向の固定
- Spaceキー　魔法の発射(攻撃)
- Enterキー　次に進むために押すボタン

## 終了方法
Escapキーを押して終了してください。

## 工夫した点
- 背景レイヤーとフィールド上の建物などの動きを合わせて作るのではなく別々に作った為、他のステージの作成とフィールドに置かれる建物の変更をやりやすくしました。
- CSVの読み込みに挑戦しチームとして制作したときにマージなどの作業がしやすいように作成しました。※画1
- コンポーネント指向をもとに作成したため、敵の行動の制御や追加がしやすくなり、早く作ることが出来ました。※画2
- タイトル画面ではわかりやすい動きをつけて、よりゲームらしさを出しました。※画3

※画1　
<img src="https://github.com/june-mare/FantasyWizard2D/blob/master/FantasyWizardCsv.png" alt="Csv" title="Csv" width="500" height="340">

※画2
<img src="https://github.com/june-mare/FantasyWizard2D/blob/master/FantasyWizardComponent.png" alt="Component" title="Component" width="500" height="340">

※画3
<img src="https://github.com/june-mare/FantasyWizard2D/blob/master/FantasyWizard%20Title.png" alt="Title" title="Title" width="500" height="340">

## 自分がどのように頑張ったか
この作品ではプログラムをやりやすくするためにデバッグ用のシーンを用意して、ImGuiから何が起きているのかや、どのような値が入っているかなどを細かく確認し作成することが出来ました。
<img src="https://github.com/june-mare/FantasyWizard2D/blob/master/FantasyWizard%20Debug.png" alt="Debug" title="Debug" width="500" height="340">

