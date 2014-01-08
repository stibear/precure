(in-package :precure)

(cl-syntax:use-syntax :annot)

(defvar *precures*
    '(("" "ふたりはプリキュア" ("2004-02-01" "2005-01-30"))
      ("maxheart" "ふたりはプリキュア Max Heart" ("2005-02-06" "2006-1-29"))
      ("splashstar" "ふたりはプリキュア Splash Star" ("2006-02-05" "2007-01-28"))
      ("yes" "Yes!プリキュア5" ("2007-02-04" "2008-01-27"))
      ("gogo" "Yes!プリキュア5GoGo!" ("2008-02-03" "2009-01-25"))
      ("fresh" "フレッシュプリキュア!" ("2009-02-01" "2010-01-31"))
      ("heartcatch" "ハートキャッチプリキュア!" ("2010-02-07" "2011-01-30"))
      ("suite" "スイートプリキュア♪" ("2011-02-06" "2012-01-29"))
      ("smile" "スマイルプリキュア!" ("2012-02-05" "2013-01-27"))
      ("dokidoki" "ドキドキ!プリキュア" ("2013-02-03" "2099-12-13"))))

(defvar *first-girls*
    (macrolet ((fm (&rest strings)
		 `(format nil "~{~A~^~%~}" ',strings)))
      `(("" "美墨なぎさ" ("キュアブラック")
	    ,(fm "デュアル・オーロラ・ウェイブ！"
		 "光の使者、キュアブラック！"
		 "光の使者、キュアホワイト！"
		 "ふたりはプリキュア！"
		 "闇の力のしもべ達よ！"
		 "とっととお家に帰りなさい！"))
	("" "雪城ほのか" ("キュアホワイト")
	    ,(fm "デュアル・オーロラ・ウェイブ！"
		 "光の使者、キュアブラック！"
		 "光の使者、キュアホワイト！"
		 "ふたりはプリキュア！"
		 "闇の力のしもべ達よ！"
		 "とっととお家に帰りなさい！")))))

(defvar *girls*
    (macrolet ((fm (&rest strings)
		 `(format nil "~{~A~^~%~}" ',strings)))
      `(("maxheart" "九条ひかり" ("シャイニールミナス")
		    ,(fm "ルミナス・シャイニングストリーム！"
			 "輝く命、シャイニールミナス！"
			 "光の心と光の意志、すべてを一つにするために！"))
	("splashstar" "日向咲" ("キュアブルーム" "キュアブライト")
		      ,(fm "デュアル・スピリチュアル・パワー！"
			   "花開け大地に！"
			   "輝く金の花！ キュアブルーム！"
			   "ふたりはプリキュア！"
			   "聖なる泉を汚す者よ！"
			   "阿漕な真似はお止めなさい！"))
	("splashstar" "美翔舞" ("キュアイーグレット" "キュアウィンディ")
		      ,(fm "デュアル・スピリチュアル・パワー！"
			   "羽ばたけ空に！"
			   "煌めく銀の翼！ キュアイーグレット！"
			   "ふたりはプリキュア！"
			   "聖なる泉を汚す者よ！"
			   "阿漕な真似はお止めなさい！"))
	("yes" "夢原のぞみ" ("キュアドリーム")
	       ,(fm
		 "プリキュア！メタモルフォーゼ！"
		 "大いなる希望の力、キュアドリーム！"
		 "希望の力と未来の光！"
		 "華麗に羽ばたく5つの心！"
		 "Yes！プリキュア5！"))
	("yes" "夏木りん" ("キュアルージュ")
	       ,(fm
		 "プリキュア！メタモルフォーゼ！"
		 "情熱の赤い炎、キュアルージュ！"
		 "希望の力と未来の光！"
		 "華麗に羽ばたく5つの心！"
		 "Yes！プリキュア5！"))
	("yes" "春日野うらら" ("キュアレモネード")
	       ,(fm
		 "プリキュア！メタモルフォーゼ！"
		 "はじけるレモンの香り、キュアレモネード！"
		 "希望の力と未来の光！"
		 "華麗に羽ばたく5つの心！"
		 "Yes！プリキュア5！"))
	("yes" "秋元こまち" ("キュアミント")
	       ,(fm
		 "プリキュア！メタモルフォーゼ！"
		 "安らぎの緑の大地、キュアミント！"
		 "希望の力と未来の光！"
		 "華麗に羽ばたく5つの心！"
		 "Yes！プリキュア5！"))
	("yes" "水無月かれん" ("キュアアクア")
	       ,(fm
		 "プリキュア！メタモルフォーゼ！"
		 "知性の青き泉、キュアアクア！"
		 "希望の力と未来の光！"
		 "華麗に羽ばたく5つの心！"
		 "Yes！プリキュア5！"))
	("gogo" "美々野くるみ" ("ミルキィローズ")
		,(fm
		  "スカイローズ・トランスレイト！"
		  "青いバラは秘密のしるし！ ミルキィローズ！"))
	("fresh" "桃園ラブ" ("キュアピーチ" "キュアエンジェルピーチ")
		 ,(fm
		   "チェインジ！プリキュア・ビートアップ！"
		   "ピンクのハートは愛あるしるし！"
		   "もぎたてフレッシュ、キュアピーチ！"
		   "レッツプリキュア！"))
	("fresh" "蒼乃美希" ("キュアベリー" "キュアエンジェルベリー")
		 ,(fm
		   "チェインジ！プリキュア・ビートアップ！"
		   "ブルーのハートは希望のしるし！"
		   "つみたてフレッシュ、キュアベリー！"
		   "レッツプリキュア！"))
	("fresh" "山吹祈里" ("キュアパイン" "キュアエンジェルパイン")
		 ,(fm
		   "チェインジ！プリキュア・ビートアップ！"
		   "イエローハートは祈りのしるし！"
		   "とれたてフレッシュ、キュアパイン！"
		   "レッツプリキュア！"))
	("fresh" "東せつな" ("キュアパッション" "キュアエンジェルパッション")
		 ,(fm
		   "チェインジ！プリキュア・ビートアップ！"
		   "真っ赤なハートは幸せの証！"
		   "熟れたてフレッシュ、キュアパッション！"
		   "レッツプリキュア！"))
	("heartcatch" "花咲つぼみ" ("キュアブロッサム" "スーパーキュアブロッサム")
		      ,(fm
			"(プリキュアの種、いくですぅ！)"
			"プリキュア！オープンマイハート！"
			"大地に咲く一輪の花！ キュアブロッサム！"
			"ハートキャッチ、プリキュア！"))
	("heartcatch" "来海えりか" ("キュアマリン" "スーパーキュアマリン")
		      ,(fm
			"(プリキュアの種、いくですぅ！)"
			"プリキュア！オープンマイハート！"
			"海風に揺れる一輪の花！ キュアマリン！"
			"ハートキャッチ、プリキュア！"))
	("heartcatch" "明堂院いつき" ("キュアサンシャイン" "スーパーキュアサンシャイン")
		      ,(fm
			"(プリキュアの種、いくですぅ！)"
			"プリキュア！オープンマイハート！"
			"陽の光浴びる一輪の花！ キュアサンシャイン！"
			"ハートキャッチ、プリキュア！"))
	("heartcatch" "月影ゆり" ("キュアムーンライト" "スーパーキュアムーンライト")
		      ,(fm
			"(プリキュアの種、いくですぅ！)"
			"プリキュア！オープンマイハート！"
			"月光に冴える一輪の花 キュアムーンライト！"
			"ハートキャッチ、プリキュア！"))
	("heartcatch" "花咲薫子" ("キュアフラワー")
		      ,(fm
			"(プリキュアの種、いくですぅ！)"
			"プリキュア！オープンマイハート！"
			"聖なる光に輝く一輪の花 キュアフラワー！"
			"ハートキャッチ、プリキュア！"))
	("suite" "北条響" ("キュアメロディ" "クレッシェンドメロディ")
		 ,(fm
		   "レッツプレイ！プリキュアモジュレーション！！"
		   "爪弾くは荒ぶる調べ！ キュアメロディ！"
		   "響け4人の組曲！スイートプリキュア！"))
	("suite" "南野奏" ("キュアリズム" "クレッシェンドリズム")
		 ,(fm
		   "レッツプレイ！プリキュアモジュレーション！！"
		   "爪弾くはたおやかな調べ！ キュアリズム！"
		   "響け4人の組曲！スイートプリキュア！"))
	("suite" "黒川エレン" ("キュアビート" "クレッシェンドビート")
		 ,(fm
		   "レッツプレイ！プリキュアモジュレーション！！"
		   "爪弾くは魂の調べ！ キュアビート！"
		   "響け4人の組曲！スイートプリキュア！"))
	("suite" "調辺アコ" ("キュアミューズ" "クレッシェンドミューズ")
		 ,(fm
		   "レッツプレイ！プリキュアモジュレーション！！"
		   "爪弾くは女神の調べ！ キュアミューズ！"
		   "響け4人の組曲！スイートプリキュア！"))
	("smile" "星空みゆき" ("キュアハッピー" "プリンセスハッピー" "ウルトラハッピー")
		 ,(fm
		   "(レディ？)"
		   "プリキュア・スマイルチャージ！"
		   "(ゴー！ゴー！レッツ・ゴー！ハッピー！！)"
		   "キラキラ輝く未来の光！ キュアハッピー！"
		   "5つの光が導く未来！"
		   "輝け！スマイルプリキュア！"))
	("smile" "日野あかね" ("キュアサニー" "プリンセスサニー" "ウルトラサニー")
		 ,(fm
		   "(レディ？)"
		   "プリキュア・スマイルチャージ！"
		   "(ゴー！ゴー！レッツ・ゴー！ハッピー！！)"
		   "太陽サンサン熱血パワー！ キュアサニー！"
		   "5つの光が導く未来！"
		   "輝け！スマイルプリキュア！"))
	("smile" "黄瀬やよい" ("キュアピース" "プリンセスピース" "ウルトラピース")
		 ,(fm
		   "(レディ？)"
		   "プリキュア・スマイルチャージ！"
		   "(ゴー！ゴー！レッツ・ゴー！ハッピー！！)"
		   "ピカピカピカリンジャンケンポン！ キュアピース！"
		   "5つの光が導く未来！"
		   "輝け！スマイルプリキュア！"))
	("smile" "緑川なお" ("キュアマーチ" "プリンセスマーチ" "ウルトラマーチ")
		 ,(fm
		   "(レディ？)"
		   "プリキュア・スマイルチャージ！"
		   "(ゴー！ゴー！レッツ・ゴー！ハッピー！！)"
		   "勇気リンリン直球勝負！ キュアマーチ！"
		   "5つの光が導く未来！"
		   "輝け！スマイルプリキュア！"))
	("smile" "青木れいか" ("キュアビューティ" "プリンセスビューティ" "ウルトラビューティ")
		 ,(fm
		   "(レディ？)"
		   "プリキュア・スマイルチャージ！"
		   "(ゴー！ゴー！レッツ・ゴー！ハッピー！！)"
		   "しんしんと降り積もる清き心！ キュアビューティ！"
		   "5つの光が導く未来！"
		   "輝け！スマイルプリキュア！"))
	("dokidoki" "相田マナ" ("キュアハート" "キュアハート・エンゲージモード")
		    ,(fm
		      "プリキュアラブリンク！"
		      "L! O! V! E!"
		      "みなぎる愛！ キュアハート！"
		      "愛を無くした悲しいジコチューさん、"
		      "このキュアハートがあなたのドキドキ取り戻してみせる！"))
	("dokidoki" "菱川六花" ("キュアダイヤモンド")
		    ,(fm
		      "プリキュアラブリンク！"
		      "L! O! V! E!"
		      "英知の光！ キュアダイヤモンド！"
		      "人の思いを踏みにじるなんて許せない、"
		      "このキュアダイヤモンドがあなたの頭を冷やしてあげる！"))
	("dokidoki" "四葉ありす" ("キュアロゼッタ")
		    ,(fm
		      "プリキュアラブリンク！"
		      "L! O! V! E!"
		      "ひだまりポカポカ キュアロゼッタ！"
		      "世界を制するのは愛だけです、"
		      "さぁ、あなたも私と愛を育んでくださいな"))
	("dokidoki" "剣崎真琴" ("キュアソード")
		    ,(fm
		      "プリキュアラブリンク！"
		      "L! O! V! E!"
		      "勇気の刃！ キュアソード！"
		      "このキュアソードが愛の剣で"
		      "あなたの野望を断ち切ってみせる！"))
	("dokidoki" "円亜久里" ("キュアエース")
		    ,(fm
		      "プリキュアラブリンク！"
		      "L! O! V! E!"
		      "愛の切り札！ キュアエース！"
		      "美しさは正義の証し、ウインク一つで、"
		      "あなたのハートを射抜いて差し上げますわ")))))
