# BijinTokeiClone
*美人時計のクローンです。*

## 特徴
任意の画像リソースを登録するだけで誰でも美人画像的な時計アプリを用意することができます。

## 機能
分単位で時刻を表示するデジタル時計です。  
表示する時分に対応する画像を表示します。  
画像と重ね合わせて現在の時刻を表示します。

## 表示する画像
時刻と画像の対応はファイル名で行います。  
画像ファイル名は「hhmm.png」の形式でリソースに登録しておきます。  
対応する画像が存在しない場合は代替画像を順番に表示します。  
代替画像の命名規則は「base00.png」です。（00からインクリメント）

## 時刻表示
組み込みフォントではDB LCD Temp Blackがデジタル時計に近いのですが  
等幅フォントであるCourier Boldにしています。  
レイアウトを頑張ればプロポーショナルフォントでもいけるかも…。

## 画像切替エフェクト
transitionFromView:toView:duration:options:completion:  
のメソッドによりエフェクトを行っています。
* UIViewAnimationOptionTransitionFlipFromLeft
* UIViewAnimationOptionTransitionFlipFromRight
* UIViewAnimationOptionTransitionCurlUp
* UIViewAnimationOptionTransitionCurlDown
の中からランダムに適用されます。

## ライセンス
基本的には◯◯時計を作りたい人に提供する目的で制作しました。  
特に制約はありませんので、自由にご利用ください。