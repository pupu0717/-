final List<String> countries = [
  '日本',
  'タイ',
  'モルディブ',
  'フィリピン',
  'メキシコ',
  'オーストラリア',
  'ミクロネシア',
  'フランス領ポリネシア',
  'インドネシア',
  'フィジー',
  'エジプト',
  'マーシャル諸島',
  'パラオ',
  'グアム',
  'トンガ',
  'パプアニューギニア',
  'フランス',
  'スペイン',
  'イタリア',
  'ギリシャ',
  'ケニア',
  'タンザニア',
  'セーシェル',
  'モーリシャス',
  '南アフリカ',
  'ブラジル',
  'コスタリカ',
  'カリブ海',
  'ニュージーランド',
  'カナダ',
  'アイスランド',
  'ノルウェー',
  'チリ',
  'アルゼンチン',
  'オマーン',
  'アラブ首長国連邦',
  'カタール',
  'サウジアラビア',
];

final List<String> prefectures = [
  '沖縄県',
  '静岡県',
  '鹿児島県',
  '和歌山県',
  '高知県',
  '北海道',
  '宮城県',
  '山形県',
  '千葉県',
  '東京都',
  '神奈川県',
  '新潟県',
  '富山県',
  '岐阜県',
  '石川県',
  '福井県',
  '山梨県',
  '三重県',
  '滋賀県',
  '島根県',
  '山口県',
  '愛媛県',
  '福岡県',
  '長崎県',
  '熊本県',
  '宮崎県',
];

final List<String> domesticArea = [
  '支笏湖',
  '秋保大滝',
  '古座川',
  '長良川',
  '琵琶湖',
  '積丹',
  '積丹美国',
  'ローソク岩',
  '知床',
  '志津川',
  '女川',
  '庄内',
  '佐渡島',
  '柏崎',
  '番神',
  '越中宮崎',
  '能登島',
  '越前',
  '勝浦',
  '行川',
  '伊戸',
  '西川名',
  '城ヶ島',
  '三崎町諸磯',
  '三戸浜',
  '葉山',
  '逗子',
  '鎌倉沖',
  '江ノ島･エボシ岩',
  '早川',
  '石橋',
  '根府川',
  '江之浦',
  '岩',
  '伊豆山',
  '熱海',
  '初島',
  '宇佐美',
  '川奈',
  '富戸',
  '伊豆海洋公園',
  '北川',
  '熱川',
  '稲取',
  '谷津',
  '菖蒲沢',
  '獅子浜',
  '平沢',
  '大瀬崎',
  '井田',
  '土肥',
  '黄金崎･安良里',
  '田子',
  '浮島',
  '雲見',
  '須崎',
  '神子元',
  '中木',
  '本栖湖',
  '大島',
  '式根島',
  '神津島',
  '三宅島',
  '八丈島',
  '小笠原父島',
  '小笠原母島',
  '方座浦',
  '尾鷲',
  '三木浦',
  '九鬼',
  '白崎',
  'みなべ',
  '田辺',
  '白浜',
  'すさみ',
  '南紀串本',
  '島根大田',
  '山口県瀬戸内海',
  '大月･柏島',
  'うぐる島･沖ノ島',
  '竜串･足摺',
  '恋の浦',
  '志賀島',
  '糸島･玄界灘',
  '愛南',
  '延岡',
  '南郷',
  '桜島',
  '枕崎･坊津',
  '種子島',
  '屋久島',
  'トカラ列島･口之島',
  '奄美大島',
  '沖永良部島',
  '与論島',
  '天草',
  '辰口',
  '九十九島',
  '五島列島･上五島',
  '五島列島･下五島',
  '本部半島',
  '伊江島',
  '恩納村',
  '嘉手納町水釜',
  '辺戸岬',
  '砂辺',
  '南部&チービシ諸島',
  'トライアングル',
  '粟国島',
  '渡名喜島',
  '久米島',
  '慶良間諸島',
  '宮古島',
  '多良間島',
  '石垣島･八重山諸島',
  '西表島'
];

final List<String> selectcountries = [
  'ー',
  '日本',
  'タイ',
  'モルディブ',
  'フィリピン',
  'メキシコ',
  'オーストラリア',
  'ミクロネシア',
  'フランス領ポリネシア',
  'インドネシア',
  'フィジー',
  'エジプト',
  'マーシャル諸島',
  'パラオ',
  'グアム',
  'トンガ',
  'パプアニューギニア',
  'フランス',
  'スペイン',
  'イタリア',
  'ギリシャ',
  'ケニア',
  'タンザニア',
  'セーシェル',
  'モーリシャス',
  '南アフリカ',
  'ブラジル',
  'コスタリカ',
  'カリブ海',
  'ニュージーランド',
  'カナダ',
  'アイスランド',
  'ノルウェー',
  'チリ',
  'アルゼンチン',
  'オマーン',
  'アラブ首長国連邦',
  'カタール',
  'サウジアラビア',
  'その他'
];

Map<String, List<String>> countryprefectures = {
  'ー': ['ー'],
  '日本': [
    'ー',
    '沖縄県',
    '静岡県',
    '鹿児島県',
    '和歌山県',
    '高知県',
    '北海道',
    '宮城県',
    '山形県',
    '千葉県',
    '東京都',
    '神奈川県',
    '新潟県',
    '富山県',
    '岐阜県',
    '石川県',
    '福井県',
    '山梨県',
    '三重県',
    '滋賀県',
    '島根県',
    '山口県',
    '愛媛県',
    '福岡県',
    '長崎県',
    '熊本県',
    '宮崎県',
  ],
  'タイ': ['ー', 'タイ'],
  'モルディブ': ['ー', 'モルディブ'],
  'フィリピン': ['ー', 'フィリピン'],
  'メキシコ': ['ー', 'メキシコ'],
  'オーストラリア': ['ー', 'オーストラリア'],
  'ミクロネシア': ['ー', 'ミクロネシア'],
  'フランス領ポリネシア': ['ー', 'フランス領ポリネシア'],
  'インドネシア': ['ー', 'インドネシア'],
  'フィジー': ['ー', 'フィジー'],
  'エジプト': ['ー', 'エジプト'],
  'マーシャル諸島': ['ー', 'マーシャル諸島'],
  'パラオ': ['ー', 'パラオ'],
  'グアム': ['ー', 'グアム'],
  'トンガ': ['ー', 'トンガ'],
  'パプアニューギニア': ['ー', 'パプアニューギニア'],
  'フランス': ['ー', 'フランス'],
  'スペイン': ['ー', 'スペイン'],
  'イタリア': ['ー', 'イタリア'],
  'ギリシャ': ['ー', 'ギリシャ'],
  'ケニア': ['ー', 'ケニア'],
  'タンザニア': ['ー', 'タンザニア'],
  'セーシェル': ['ー', 'セーシェル'],
  'モーリシャス': ['ー', 'モーリシャス'],
  '南アフリカ': ['ー', '南アフリカ'],
  'ブラジル': ['ー', 'ブラジル'],
  'コスタリカ': ['ー', 'コスタリカ'],
  'カリブ海': ['ー', 'カリブ海'],
  'ニュージーランド': ['ー', 'ニュージーランド'],
  'カナダ': ['ー', 'カナダ'],
  'アイスランド': ['ー', 'アイスランド'],
  'ノルウェー': ['ー', 'ノルウェー'],
  'チリ': ['ー', 'チリ'],
  'アルゼンチン': ['ー', 'アルゼンチン'],
  'オマーン': ['ー', 'オマーン'],
  'アラブ首長国連邦': ['ー', 'アラブ首長国連邦'],
  'カタール': ['ー', 'カタール'],
  'サウジアラビア': ['ー', 'サウジアラビア'],
};

Map<String, List<String>> prefectureLocations = {
  'ー': ['ー'],
  '北海道': ['ー', '積丹', '積丹美国', 'ローソク岩', '知床', '支笏湖'],
  '宮城県': ['ー', '志津川', '女川', '秋保大滝'],
  '山形県': ['ー', '庄内'],
  '新潟県': ['ー', '佐渡島', '柏崎', '番神'],
  '富山県': ['ー', '越中宮崎'],
  '石川県': ['ー', '能登島'],
  '福井県': ['ー', '越前'],
  '千葉県': ['ー', '勝浦', '行川', '伊戸', '西川名'],
  '神奈川県': [
    'ー',
    '城ヶ島',
    '三崎町諸磯',
    '三戸浜',
    '葉山',
    '逗子',
    '鎌倉沖',
    '江ノ島･エボシ岩',
    '早川',
    '石橋',
    '根府川',
    '江之浦',
    '岩'
  ],
  '静岡県': [
    'ー',
    '伊豆山',
    '熱海',
    '初島',
    '宇佐美',
    '川奈',
    '富戸',
    '伊豆海洋公園',
    '北川',
    '熱川',
    '稲取',
    '谷津',
    '菖蒲沢',
    '獅子浜',
    '平沢',
    '大瀬崎',
    '井田',
    '土肥',
    '黄金崎･安良里',
    '田子',
    '浮島',
    '雲見',
    '須崎',
    '神子元',
    '中木'
  ],
  '山梨県': ['ー', '本栖湖'],
  '東京都': ['ー', '大島', '式根島', '神津島', '三宅島', '八丈島', '小笠原父島', '小笠原母島'],
  '岐阜県': ['ー', '長良川'],
  '三重県': ['ー', '方座浦', '尾鷲', '三木浦', '九鬼'],
  '和歌山県': ['ー', '白崎', 'みなべ', '田辺', '白浜', 'すさみ', '南紀串本', '古座川'],
  '滋賀県': ['ー', '琵琶湖'],
  '島根県': ['ー', '島根大田'],
  '山口県': ['ー', '山口県瀬戸内海'],
  '愛媛県': ['ー', '愛南'],
  '高知県': ['ー', '大月･柏島', 'うぐる島･沖ノ島', '竜串･足摺'],
  '福岡県': ['ー', '恋の浦', '志賀島', '糸島･玄界灘'],
  '宮崎県': ['ー', '延岡', '南郷'],
  '鹿児島県': [
    'ー',
    '桜島',
    '枕崎･坊津',
    '種子島',
    '屋久島',
    'トカラ列島･口之島',
    '奄美大島',
    '沖永良部島',
    '与論島'
  ],
  '熊本県': ['ー', '天草'],
  '長崎県': ['ー', '辰口', '九十九島', '五島列島･上五島', '五島列島･下五島'],
  '沖縄県': [
    'ー',
    '本部半島',
    '伊江島',
    '恩納村',
    '嘉手納町水釜',
    '砂辺',
    '辺戸岬',
    '南部&チービシ諸島',
    'トライアングル',
    '粟国島',
    '渡名喜島',
    '久米島',
    '慶良間諸島',
    '宮古島',
    '多良間島',
    '石垣島･八重山諸島',
    '西表島'
  ],
  'タイ': [
    'シミラン諸島',
    'スリン諸島',
    'リチェリューロック',
    'プーケット',
    'コ・ピピ',
    'コ・タオ',
    'コ・サムイ',
    'コ・パンガン',
    'ターチャイ島',
    'ヒン・デン・ヒン・ムアン',
  ],
  'モルディブ': [
    '北アリ',
    '南アリ',
    '北マーレ',
    '南マーレ',
    'ラヴィヤニ',
    'バア',
    'ラーム',
    'ガーフアリフ',
    'アッドゥ',
    'フヴァーミュラ'
  ],
  'フィリピン': [
    'プエルトガレラ',
    'アニラオ',
    'タバタハリーフ',
    'セブ',
    'ドゥマゲテ',
    'ボホール',
    'コロン・パラワン',
    'エルニド',
    'サマール',
    'ボラカイ島',
    'スービック湾',
    'レイテ島',
    'パンガシナン',
    'モアルボアル',
  ],
  'メキシコ': [
    'コスメル島',
    'カンクン',
    'プラヤ・デル・カルメン',
    'タンクス・バー',
    'イスラ・ムヘーレス',
    'カボ・サン・ルーカス',
    'ラ・パス',
    'ソコロ諸島',
    'グアダルーペ島',
    'マリンパークロスアトロス',
    'サリーナス・デ・パツクアロ',
    'メデロス・アイランド',
  ],
  'オーストラリア': [
    'グレートバリアリーフ',
    'ニンガルーリーフ',
    'ロード・ハウ島',
    'タスマニア',
    'ケアンズ',
    'ポートダグラス',
    'サウス・ウェストロックス',
    'バイロンベイ',
    'マンリー',
    'ジュルング',
    'エクスマウス',
    'ノーフォーク島',
    'ロットネスト島',
    'ダーウィン',
  ],
  'ミクロネシア': [
    'チュークラグーン',
    'ポンペイ',
    'ヤップ',
    'コスラエ',
    'カピンガマランギ環礁',
    'プルワト環礁',
    'ノモイ環礁',
    'ウライ島',
    'サタワル島',
    'ラム島',
  ],
  'フランス領ポリネシア': [
    'タヒチ',
    'モーレア島',
    'ボラボラ島',
    'ランギロア環礁',
    'ファカラヴァ環礁',
    'ティケハウ環礁',
    'マウピティ島',
    'フアヒネ島',
    'マルケサス諸島',
    'タハア島',
    'ライアテア島',
  ],
  'インドネシア': [
    'バリ島',
    'コモド島',
    'ラジャアンパット',
    'アルノク島',
    'スラウェシ',
    'アンボン',
    'ニューギニア',
    'アラフラ海',
    'マルク諸島',
  ],
  'フィジー': [
    'ビチレブ島',
    'ヴァヌアレヴ島',
    'トヴァ島',
    'ナンディ島',
    'ヌクアロファ島',
    'カビカビ島',
    'シンビ島',
    'マスカリン環礁',
  ],
  'エジプト': [
    '紅海',
  ],
  'マーシャル諸島': [
    'マジュロ環礁',
    'アリノ環礁',
    'キリリ環礁',
    'エビ環礁',
    'ヒル環礁',
    'ジャルート環礁',
    'ヌクラト環礁',
  ],
  'パラオ': [
    'ブルーコーナー',
    'ブルーホール',
    'ジャーマンチャネル',
    'ニュードロップオフ',
    'ペリリュー',
    'シャークシティ',
    'チェルビスリーフ',
    'カープアイランド',
    'ソフトコーラルアーチ',
    'イエローウォール',
  ],
  'グアム': [
    'ブルーホール',
    'アプラハーバー',
    'ハプピーポイント',
    'ザ・ケーブス',
    'シャークピット',
    'フリーダムビーチ',
    'タモンベイ',
    'リティディアンポイント',
    'ピティボムホールズ',
    'アガットポイント',
  ],
  'トンガ': [
    'エオア島',
    'ハアパイ群島',
    'ヴァヴァウ群島',
    'ナイア',
    'タポナア島',
    'コロヴァイヴァイ島',
    'パングアイ島',
    'トンガタプ',
    'エウア',
    'タフィシア島',
  ],
  'パプアニューギニア': [
    'ラバウル',
    'ウォンディアイランド',
    'キムベイ湾',
    'タウニ島',
    'マダン',
    'アルトゥリ',
    'ロロエイア',
    'ツィクリク湾',
    'ミルネベイ',
    'ヌマヌマ',
  ],
  'フランス': [
    'ニース',
    'カサス',
    'カルヴィ',
    'マルセイユ',
    'アジャクシオ',
    'ブレスト',
    'サントロペ',
    'アンティーブ',
    'ロワイヤン',
    'サン・マルタン島',
  ],
  'スペイン': [
    'マヨルカ島',
    'カナリア諸島',
    'コスタブラバ',
    'カラブリッジ',
    'カブレーラ',
    'エル・イエロ',
    'ラ・ゴメラ',
    'ランサローテ島',
    'グラン・カナリア',
    'テネリフェ島',
  ],
  'イタリア': [
    'シチリア島',
    'サルデーニャ島',
    'ポルトフィーノ',
    'トレミティ諸島',
    'エオリエ諸島',
    'リーパリ島',
    'パンテレリア島',
    'シラクーサ',
    'タオルミーナ',
    'カプリ島',
  ],
  'ギリシャ': [
    'クレタ島',
    'コス島',
    'ロードス島',
    'サントリーニ島',
    'カリムノス島',
    'パロス島',
    'ナクソス島',
    'レフカダ',
    'スコペロス島',
    'メティオラ',
  ],
  'ケニア': [
    'モンバサ',
    'ディアニビーチ',
    'ワタム',
    'リッケウェイ',
    'キシテマリンパーク',
    'マリンディ',
    'シャングララ',
    'ジルジバ',
    'キラフィビーチ',
    'ヴァスビビーチ',
  ],
  'タンザニア': [
    'ザンジバル',
    'ペンバ島',
    'マフィア島',
    'バガモヨ',
    'ダルエスサラーム',
    'キゴンゴ',
    'トゥンバトゥ',
    'チュマ湾',
    'クルティー湾',
    'ムニャ湾',
  ],
  'セーシェル': [
    'マヘ島',
    'ラディーグ島',
    'プララン島',
    'シルエット島',
    'アウドリティアイランド',
    'デロッシュ島',
    'フェリシテ島',
    'フリゲート島',
    'セントアン島',
    'アルダブラ環礁',
  ],
  'モーリシャス': [
    'ファリネス',
    'トルオーシェ',
    'グランベ',
    'ブルーベイ',
    'サントラン',
    'シルビウス',
    'トゥルトゥ',
    'モントリオリス',
    'アンバーバリ',
    'モネ湾',
  ],
  '南アフリカ': [
    'アリワルショール',
    'ソドワナベイ',
    'ケープタウン',
    'ポートエリザベス',
    'ムズンギ',
    'イーストロンドン',
    'ダーバン',
    'モーセルベイ',
    'ヘルマナス',
    'プリンスエドワード諸島',
  ],
  'ブラジル': [
    'フェルナンド・デ・ノローニャ',
    'アバロニ',
    'パリアバ',
    'トランコーゾ',
    'イリャ・グランデ',
    'アルレアル',
    'グアナバラ湾',
    'サンタカタリーナ',
    'アングラ・ドス・レイス',
    'バイア',
  ],
  'コスタリカ': [
    'ココス島',
    'ケポス',
    'カリビアンコースト',
    'プンタアリーナス',
    'ドレイクベイ',
    'グルフォ・ドルセ',
    'オサ半島',
    'カノアイランド',
    'サンタローサ国立公園',
    'ゴルフィト',
  ],
  'カリブ海': [
    'コスメル島',
    'ベリーズバリアリーフ',
    'タークス・カイコス諸島',
    'ケイマン諸島',
    'バハマ',
    'キューバ',
    'ジャマイカ',
    'ドミニカ共和国',
    'グアドループ',
    'アンティグアバーブーダ',
  ],
  'ニュージーランド': [
    'プア島',
    'ロトルア',
    'オークランド',
    'ウェリントン',
    'スティーブンスアイランド',
    'カイコウラ',
    'クック海峡',
    'フィヨルドランド',
    'パナウイラ',
    'レイクロトティティ',
  ],
  'カナダ': [
    'ブリティッシュコロンビア',
    'バンクーバー島',
    'ノバスコシア',
    'ニューファンドランド',
    'トバモリ',
    'セントローレンス湾',
    'プリンスエドワード島',
    'ハリファックス',
    'カーボットトレイル',
    'クライドリバー',
  ],
  'アイスランド': [
    'シルフラ',
    'ストラタバルナフィヨルド',
    'ウェストフィヨルド',
    'ソルタンス',
    'スカラフィヨルド',
    'ホンフィヨルド',
    'ダルビク',
    'レイクミーヴァトン',
    'リョゥテヴィーク',
    'ヴァトナルスビョルグ',
  ],
  'ノルウェー': [
    'ロフォテン諸島',
    'ソグネフィヨルド',
    'トロンハイム',
    'オスロフィヨルド',
    'ベルゲン',
    'ノールカップ',
    'ハンメルフェスト',
    'トロムセ',
    'バレンツバーグ',
    'ロストバーデン',
  ],
  'チリ': [
    'イースター島',
    'フアンフェルナンデス諸島',
    'バルディビア',
    'ロスリオス',
    'アタカマ',
    'プンタアレーナス',
    'ティエラ・デル・フエゴ',
    'サンティアゴ',
    'バルパライソ',
    'アンフォラ',
  ],
  'アルゼンチン': [
    'プエルトマドリン',
    'バルデス半島',
    'ウシュアイア',
    'サンティアゴデルエステロ',
    'トレレウ',
    'マルデルプラタ',
    'サンタクルス',
    'バリローチェ',
    'サンタフェ',
    'ティエラ・デル・フエゴ',
  ],
  'オマーン': [
    'マスカット',
    'マスンダム',
    'ダムニヤート諸島',
    'ミルバート',
    'ハラニヤット諸島',
    'サラーラ',
    'クーラマト',
    'サムバラク',
    'アレサカ',
    'クハル',
  ],
  'アラブ首長国連邦': [
    'フジャイラ',
    'ドバイ',
    'アブダビ',
    'シャールジャ',
    'ラアスアルカイマ',
    'ウムアルカイワイン',
    'アルアイン',
    'アルファジャイラ',
    'カイオル',
    'サクリー',
  ],
  'カタール': [
    'ドーハ',
    'アルワクラ',
    'アルコル',
    'アッシャハニヤ',
    'ドハマダム',
    'アルガリヤ',
    'ジュマイリア',
    'アルルワイス',
    'マディーナカリファ',
    'アッシャニヤ',
  ],
  'サウジアラビア': [
    'ジッダ',
    'ヤンブー',
    'ファラサン諸島',
    'アルワジュ',
    'タブーク',
    'カシム',
    'ダンナ',
    'アルコバール',
    'ジザン',
    'タイフ',
  ],
};

Map<String, List<double>> locationcoodinate = {
  'ー': [35.67, 139.76],
  '本部半島': [26.67, 127.87],
  '伊江島': [26.72, 127.79],
  '恩納村': [26.50, 127.86],
  '嘉手納町水釜': [26.35, 127.73],
  '砂辺': [26.33, 127.74],
  '南部＆チービシ諸島': [26.25, 127.55],
  'トライアングル': [26.04, 127.63],
  '粟国島': [26.56, 127.20],
  '渡名喜島': [26.35, 127.17],
  '久米島': [26.32, 126.81],
  '慶良間諸島': [26.19, 127.33],
  '宮古島': [24.82, 125.2],
  '多良間島': [24.66, 124.69],
  '石垣島･八重山諸島': [24.38, 124.08],
  '西表島': [24.24, 123.79],
  '積丹': [43.331667, 140.207222],
  '積丹美国': [43.309722, 140.194722],
  'ローソク岩': [43.291111, 140.153056],
  '知床': [44.021944, 145.123611],
  '志津川': [38.681389, 141.451944],
  '女川': [38.439722, 141.438056],
  '庄内': [38.916667, 139.833333],
  '佐渡島': [38.024444, 138.374444],
  '柏崎': [37.366667, 138.55],
  '番神': [37.366667, 138.55],
  '越中宮崎': [36.816667, 137.866667],
  '能登島': [37.166667, 136.966667],
  '越前': [35.9, 136.183333],
  '勝浦': [35.149167, 140.318611],
  '行川': [35.153889, 140.298889],
  '伊戸': [35.138333, 139.8275],
  '西川名': [35.122222, 139.8125],
  '城ヶ島': [35.128611, 139.619722],
  '三崎町諸磯': [35.134167, 139.624167],
  '三戸浜': [35.151389, 139.631944],
  '葉山': [35.275, 139.578333],
  '逗子': [35.294444, 139.566667],
  '鎌倉沖': [35.32, 139.551667],
  '江ノ島･エボシ岩': [35.301944, 139.48],
  '早川': [35.221944, 139.1625],
  '石橋': [35.193611, 139.179722],
  '根府川': [35.209167, 139.118889],
  '江之浦': [35.192222, 139.137222],
  '岩': [35.203056, 139.16],
  '伊豆山': [35.1, 139.070833],
  '熱海': [35.088611, 139.070833],
  '初島': [35.0225, 139.158333],
  '宇佐美': [35.032222, 139.105833],
  '川奈': [34.975, 139.100833],
  '富戸': [34.960833, 139.110833],
  '伊豆海洋公園': [34.9575, 139.126389],
  '北川': [34.931389, 139.114722],
  '熱川': [34.900278, 139.071667],
  '稲取': [34.867778, 139.0325],
  '谷津': [34.814167, 138.96],
  '菖蒲沢': [34.795, 138.954722],
  '獅子浜': [34.742778, 138.9475],
  '平沢': [34.703889, 138.914167],
  '大瀬崎': [34.74, 138.811111],
  '井田': [34.708333, 138.788611],
  '土肥': [34.758333, 138.773333],
  '黄金崎･安良里': [34.735278, 138.771111],
  '田子': [34.670278, 138.75],
  '浮島': [34.641111, 138.746667],
  '雲見': [34.621111, 138.75],
  '須崎': [34.611667, 138.76],
  '神子元': [34.589167, 138.825556],
  '中木': [34.569444, 138.859444],
  '本栖湖': [35.467778, 138.585278],
  '大島': [34.75, 139.366667],
  '式根島': [34.316667, 139.216667],
  '神津島': [34.2, 139.15],
  '三宅島': [34.075, 139.5],
  '八丈島': [33.116667, 139.8],
  '小笠原父島': [27.095, 142.189444],
  '小笠原母島': [26.659167, 142.177222],
  '方座浦': [34.3, 136.85],
  '尾鷲': [34.066667, 136.2],
  '三木浦': [34.1, 136.2],
  '九鬼': [34.05, 136.183333],
  '白崎': [33.916667, 135.166667],
  'みなべ': [33.733333, 135.333333],
  '田辺': [33.716667, 135.366667],
  '白浜': [33.676944, 135.348611],
  'すさみ': [33.55, 135.366667],
  '南紀串本': [33.466667, 135.783333],
  '島根大田': [35.193056, 132.506944],
  '山口県瀬戸内海': [34.0625, 131.498611],
  '大月･柏島': [32.773889, 132.978611],
  'うぐる島･沖ノ島': [32.833333, 132.733333],
  '竜串･足摺': [32.716667, 132.966667],
  '恋の浦': [33.6625, 130.3725],
  '志賀島': [33.707778, 130.333056],
  '糸島･玄界灘': [33.553889, 130.276111],
  '延岡': [32.5825, 131.669444],
  '南郷': [31.596667, 131.4325],
  '桜島': [31.585, 130.6575],
  '枕崎･坊津': [31.275, 130.316667],
  '種子島': [30.716667, 131],
  '屋久島': [30.37, 130.497222],
  'トカラ列島･口之島': [29.072222, 129.479167],
  '奄美大島': [28.383333, 129.5],
  '沖永良部島': [27.384722, 128.556944],
  '与論島': [27.041667, 128.401389],
  '天草': [32.466667, 130.2],
  '辰口': [32.833333, 129.8],
  '九十九島': [32.785556, 129.614444],
  '五島列島･上五島': [32.966667, 129.066667],
  '五島列島･下五島': [32.683333, 128.333333],
  '愛南': [33.225, 132.021],
  '支笏湖': [42.847, 141.391],
  '秋保大滝': [38.264, 140.916],
  '琵琶湖': [35.233, 136.073],
  '長良川': [35.423, 136.719],
  '古座川': [33.541, 135.800],
  '辺戸岬': [26.87, 128.26],
  'シミラン諸島': [8.67, 97.63],
  'スリン諸島': [9.27, 97.87],
  'リチェリューロック': [9.08, 98.32],
  'プーケット': [7.88, 98.39],
  'コ・ピピ': [7.74, 98.77],
  'コ・タオ': [10.10, 99.84],
  'コ・サムイ': [9.50, 100.00],
  'コ・パンガン': [9.73, 99.98],
  'ターチャイ島': [8.35, 97.82],
  'ヒン・デン・ヒン・ムアン': [7.31, 99.18],
  '北アリ': [4.20, 72.78],
  '南アリ': [3.55, 72.77],
  '北マーレ': [4.20, 73.50],
  '南マーレ': [3.94, 73.45],
  'ラヴィヤニ': [5.30, 73.50],
  'バア': [5.27, 73.00],
  'ラーム': [2.30, 73.60],
  'ガーフアリフ': [0.63, 73.25],
  'アッドゥ': [-0.60, 73.10],
  'プエルトガレラ': [13.50, 120.97],
  'アニラオ': [13.72, 120.88],
  'タバタハリーフ': [8.82, 119.92],
  'セブ': [10.31, 123.89],
  'ドゥマゲテ': [9.31, 123.31],
  'ボホール': [9.85, 124.18],
  'コロン・パラワン': [11.99, 120.20],
  'エルニド': [11.20, 119.39],
  'サマール': [11.88, 125.00],
  'ボラカイ島': [11.97, 121.92],
  'スービック湾': [14.83, 120.28],
  'レイテ島': [10.70, 124.90],
  'パンガシナン': [15.93, 120.33],
  'モアルボアル': [9.95, 123.39],
  'コスメル島': [20.42, -86.92],
  'カンクン': [21.17, -86.85],
  'プラヤ・デル・カルメン': [20.63, -87.07],
  'タンクス・バー': [21.15, -86.83],
  'イスラ・ムヘーレス': [21.20, -86.72],
  'カボ・サン・ルーカス': [22.89, -109.91],
  'ラ・パス': [24.14, -110.31],
  'ソコロ諸島': [18.78, -110.95],
  'グアダルーペ島': [29.03, -118.27],
  'マリンパークロスアトロス': [19.31, -99.18],
  'サリーナス・デ・パツクアロ': [19.40, -99.18],
  'メデロス・アイランド': [19.17, -99.13],
  'グレートバリアリーフ': [-18.29, 147.70],
  'ニンガルーリーフ': [-21.90, 113.93],
  'ロード・ハウ島': [-31.55, 159.08],
  'タスマニア': [-41.64, 146.32],
  'ケアンズ': [-16.92, 145.77],
  'ポートダグラス': [-16.48, 145.47],
  'サウス・ウェストロックス': [-30.88, 153.04],
  'バイロンベイ': [-28.64, 153.61],
  'マンリー': [-33.80, 151.29],
  'ジュルング': [-27.38, 153.11],
  'エクスマウス': [-21.93, 114.13],
  'ノーフォーク島': [-29.03, 167.95],
  'ロットネスト島': [-32.00, 115.52],
  'ダーウィン': [-12.46, 130.84],
  'チュークラグーン': [7.43, 151.78],
  'ポンペイ': [6.92, 158.16],
  'ヤップ': [9.54, 138.12],
  'コスラエ': [5.35, 162.96],
  'カピンガマランギ環礁': [-1.83, 154.73],
  'プルワト環礁': [7.62, 151.81],
  'ノモイ環礁': [5.89, 153.91],
  'ウライ島': [6.92, 158.27],
  'サタワル島': [7.38, 147.03],
  'ラム島': [5.38, 162.98],
  'タヒチ': [-17.65, -149.43],
  'モーレア島': [-17.53, -149.83],
  'ボラボラ島': [-16.50, -151.74],
  'ランギロア環礁': [-14.97, -147.62],
  'ファカラヴァ環礁': [-16.33, -145.63],
  'ティケハウ環礁': [-15.01, -148.12],
  'マウピティ島': [-16.45, -152.24],
  'フアヒネ島': [-16.71, -151.03],
  'マルケサス諸島': [-9.45, -139.49],
  'タハア島': [-16.62, -151.49],
  'ライアテア島': [-16.82, -151.44],
  'バリ島': [-8.34, 115.09],
  'コモド島': [-8.57, 119.48],
  'ラジャアンパット': [-0.21, 130.52],
  'アルノク島': [1.40, 125.12],
  'スラウェシ': [-1.43, 119.95],
  'アンボン': [-3.70, 128.17],
  'ニューギニア': [-6.25, 147.09],
  'アラフラ海': [-10.66, 141.54],
  'マルク諸島': [-3.30, 128.48],
  'ビチレブ島': [-17.70, 177.98],
  'ヴァヌアレヴ島': [-16.58, 179.33],
  'トヴァ島': [-16.73, 179.38],
  'ナンディ島': [-17.76, 177.44],
  'ヌクアロファ島': [-21.14, -175.22],
  'カビカビ島': [-16.63, -179.84],
  'シンビ島': [-16.33, -179.58],
  'マスカリン環礁': [-21.43, 70.23],
  '紅海': [22.34, 38.51],
  'マジュロ環礁': [7.11, 171.38],
  'アリノ環礁': [10.31, 169.99],
  'キリリ環礁': [9.16, 171.31],
  'エビ環礁': [8.76, 171.15],
  'ヒル環礁': [7.46, 170.70],
  'ジャルート環礁': [8.14, 167.20],
  'ヌクラト環礁': [5.89, 169.78],
  'ブルーコーナー': [7.06, 134.26],
  'ブルーホール': [7.11, 134.31],
  'ジャーマンチャネル': [7.12, 134.33],
  'ニュードロップオフ': [7.14, 134.32],
  'ペリリュー': [6.89, 134.23],
  'シャークシティ': [7.00, 134.30],
  'チェルビスリーフ': [7.17, 134.35],
  'カープアイランド': [7.04, 134.26],
  'ソフトコーラルアーチ': [7.18, 134.34],
  'イエローウォール': [7.08, 134.31],
  'アプラハーバー': [13.45, 144.65],
  'ハプピーポイント': [13.42, 144.66],
  'ザ・ケーブス': [13.47, 144.66],
  'シャークピット': [13.48, 144.66],
  'フリーダムビーチ': [13.44, 144.64],
  'タモンベイ': [13.52, 144.81],
  'リティディアンポイント': [13.61, 144.84],
  'ピティボムホールズ': [13.49, 144.72],
  'アガットポイント': [13.39, 144.66],
  'エオア島': [-21.38, -174.96],
  'ハアパイ群島': [-19.75, -174.35],
  'ヴァヴァウ群島': [-18.65, -173.98],
  'ナイア': [-18.63, -173.96],
  'タポナア島': [-18.63, -173.95],
  'コロヴァイヴァイ島': [-18.65, -173.97],
  'パングアイ島': [-19.80, -174.35],
  'トンガタプ': [-21.13, -175.20],
  'エウア': [-21.38, -174.95],
  'タフィシア島': [-21.12, -175.18],
  'ラバウル': [-4.20, 152.17],
  'ウォンディアイランド': [-2.31, 147.32],
  'キムベイ湾': [-5.53, 150.07],
  'タウニ島': [-2.68, 150.77],
  'マダン': [-5.22, 145.80],
  'アルトゥリ': [-2.02, 147.27],
  'ロロエイア': [-1.96, 145.77],
  'ツィクリク湾': [-5.55, 150.07],
  'ミルネベイ': [-10.31, 150.45],
  'ヌマヌマ': [-6.05, 155.61],
  'ニース': [43.70, 7.27],
  'カサス': [43.55, 7.02],
  'カルヴィ': [42.57, 8.76],
  'マルセイユ': [43.30, 5.37],
  'アジャクシオ': [41.92, 8.73],
  'ブレスト': [48.39, -4.49],
  'サントロペ': [43.27, 6.64],
  'アンティーブ': [43.58, 7.12],
  'ロワイヤン': [45.63, -1.03],
  'サン・マルタン島': [18.07, -63.05],
  'マヨルカ島': [39.61, 2.96],
  'カナリア諸島': [28.29, -16.62],
  'コスタブラバ': [41.78, 3.03],
  'カラブリッジ': [40.12, -3.68],
  'カブレーラ': [39.15, 2.93],
  'エル・イエロ': [27.74, -18.00],
  'ラ・ゴメラ': [28.10, -17.11],
  'ランサローテ島': [29.04, -13.64],
  'グラン・カナリア': [27.95, -15.58],
  'テネリフェ島': [28.27, -16.61],
  'シチリア島': [37.60, 14.02],
  'サルデーニャ島': [40.12, 9.01],
  'ポルトフィーノ': [44.30, 9.21],
  'トレミティ諸島': [42.12, 15.51],
  'エオリエ諸島': [38.52, 14.94],
  'リーパリ島': [38.48, 14.95],
  'パンテレリア島': [36.84, 11.96],
  'シラクーサ': [37.07, 15.29],
  'タオルミーナ': [37.85, 15.29],
  'カプリ島': [40.55, 14.23],
  'クレタ島': [35.24, 24.81],
  'コス島': [36.89, 27.29],
  'ロードス島': [36.43, 28.22],
  'サントリーニ島': [36.40, 25.46],
  'カリムノス島': [36.96, 26.98],
  'パロス島': [37.08, 25.15],
  'ナクソス島': [37.10, 25.37],
  'レフカダ': [38.83, 20.70],
  'スコペロス島': [39.12, 23.68],
  'メティオラ': [39.71, 21.63],
  'モンバサ': [-4.04, 39.67],
  'ディアニビーチ': [-4.31, 39.58],
  'ワタム': [-3.35, 40.02],
  'リッケウェイ': [-3.24, 39.65],
  'キシテマリンパーク': [-4.01, 39.60],
  'マリンディ': [-3.22, 40.12],
  'シャングララ': [-3.23, 40.12],
  'ジルジバ': [-4.06, 39.65],
  'キラフィビーチ': [-3.29, 40.01],
  'ヴァスビビーチ': [-4.05, 39.68],
  'ザンジバル': [-6.17, 39.20],
  'ペンバ島': [-5.23, 39.77],
  'マフィア島': [-7.60, 39.76],
  'バガモヨ': [-6.45, 38.90],
  'ダルエスサラーム': [-6.79, 39.20],
  'キゴンゴ': [-6.84, 39.20],
  'トゥンバトゥ': [-5.38, 39.62],
  'チュマ湾': [-6.29, 39.46],
  'クルティー湾': [-5.86, 39.55],
  'ムニャ湾': [-7.01, 39.75],
  'マヘ島': [-4.67, 55.47],
  'ラディーグ島': [-4.34, 55.83],
  'プララン島': [-4.32, 55.74],
  'シルエット島': [-4.48, 55.25],
  'アウドリティアイランド': [-4.98, 55.33],
  'デロッシュ島': [-5.95, 53.62],
  'フェリシテ島': [-4.35, 55.84],
  'フリゲート島': [-4.59, 55.94],
  'セントアン島': [-4.62, 55.53],
  'アルダブラ環礁': [-9.42, 46.34],
  'ファリネス': [-20.30, 57.55],
  'トルオーシェ': [-20.16, 57.50],
  'グランベ': [-20.01, 57.66],
  'ブルーベイ': [-20.44, 57.72],
  'サントラン': [-20.21, 57.53],
  'シルビウス': [-20.18, 57.51],
  'トゥルトゥ': [-20.16, 57.47],
  'モントリオリス': [-20.16, 57.55],
  'アンバーバリ': [-20.26, 57.72],
  'モネ湾': [-20.18, 57.49],
  'アリワルショール': [-30.28, 30.82],
  'ソドワナベイ': [-27.52, 32.67],
  'ケープタウン': [-33.92, 18.42],
  'ポートエリザベス': [-33.96, 25.60],
  'ムズンギ': [-28.20, 32.52],
  'イーストロンドン': [-33.02, 27.90],
  'ダーバン': [-29.86, 31.02],
  'モーセルベイ': [-34.18, 22.13],
  'ヘルマナス': [-34.42, 19.24],
  'プリンスエドワード諸島': [-46.64, 37.94],
  'フェルナンド・デ・ノローニャ': [-3.85, -32.42],
  'アバロニ': [-22.90, -43.19],
  'パリアバ': [-22.82, -43.10],
  'トランコーゾ': [-16.59, -39.11],
  'イリャ・グランデ': [-23.14, -44.16],
  'アルレアル': [-22.77, -42.52],
  'グアナバラ湾': [-22.88, -43.17],
  'サンタカタリーナ': [-27.33, -48.52],
  'アングラ・ドス・レイス': [-23.00, -44.32],
  'バイア': [-12.97, -38.50],
  'ココス島': [5.53, -87.06],
  'ケポス': [9.43, -84.16],
  'カリビアンコースト': [10.30, -83.35],
  'プンタアリーナス': [9.98, -84.82],
  'ドレイクベイ': [8.70, -83.66],
  'グルフォ・ドルセ': [8.62, -83.15],
  'オサ半島': [8.56, -83.49],
  'カノアイランド': [8.83, -83.63],
  'サンタローサ国立公園': [10.83, -85.62],
  'ゴルフィト': [8.64, -83.15],
  'ベリーズバリアリーフ': [17.73, -88.03],
  'タークス・カイコス諸島': [21.75, -71.58],
  'ケイマン諸島': [19.30, -81.24],
  'バハマ': [25.03, -77.40],
  'キューバ': [23.13, -82.38],
  'ジャマイカ': [18.00, -77.50],
  'ドミニカ共和国': [18.74, -70.16],
  'グアドループ': [16.27, -61.55],
  'アンティグアバーブーダ': [17.12, -61.85],
  'プア島': [-33.58, 174.20],
  'ロトルア': [-38.14, 176.25],
  'オークランド': [-36.85, 174.76],
  'ウェリントン': [-41.29, 174.78],
  'スティーブンスアイランド': [-40.66, 174.00],
  'カイコウラ': [-42.41, 173.68],
  'クック海峡': [-41.32, 174.10],
  'フィヨルドランド': [-45.41, 167.72],
  'パナウイラ': [-36.36, 174.65],
  'レイクロトティティ': [-41.77, 172.86],
  'ブリティッシュコロンビア': [53.73, -127.65],
  'バンクーバー島': [49.65, -125.45],
  'ノバスコシア': [45.00, -62.99],
  'ニューファンドランド': [48.94, -54.11],
  'トバモリ': [45.25, -81.67],
  'セントローレンス湾': [47.83, -69.55],
  'プリンスエドワード島': [46.25, -63.13],
  'ハリファックス': [44.64, -63.57],
  'カーボットトレイル': [46.68, -60.86],
  'クライドリバー': [70.48, -68.61],
  'シルフラ': [64.25, -21.00],
  'ストラタバルナフィヨルド': [66.02, -23.18],
  'ウェストフィヨルド': [66.12, -23.40],
  'ソルタンス': [66.27, -23.70],
  'スカラフィヨルド': [66.33, -24.00],
  'ホンフィヨルド': [65.67, -23.90],
  'ダルビク': [65.97, -18.53],
  'レイクミーヴァトン': [65.61, -17.00],
  'リョゥテヴィーク': [66.27, -15.60],
  'ヴァトナルスビョルグ': [64.63, -14.90],
  'ロフォテン諸島': [68.22, 14.58],
  'ソグネフィヨルド': [61.23, 7.12],
  'トロンハイム': [63.43, 10.39],
  'オスロフィヨルド': [59.08, 10.73],
  'ベルゲン': [60.39, 5.32],
  'ノールカップ': [71.17, 25.78],
  'ハンメルフェスト': [70.66, 23.69],
  'トロムセ': [69.65, 18.96],
  'バレンツバーグ': [78.07, 14.22],
  'ロストバーデン': [68.23, 13.93],
  'イースター島': [-27.12, -109.37],
  'フアンフェルナンデス諸島': [-33.61, -78.84],
  'バルディビア': [-39.82, -73.24],
  'ロスリオス': [-39.82, -73.24],
  'アタカマ': [-23.43, -69.39],
  'プンタアレーナス': [-53.15, -70.91],
  'ティエラ・デル・フエゴ': [-54.31, -68.31],
  'サンティアゴ': [-33.45, -70.66],
  'バルパライソ': [-33.05, -71.63],
  'アンフォラ': [-33.45, -70.66],
  'プエルトマドリン': [-42.77, -65.04],
  'バルデス半島': [-42.53, -64.31],
  'ウシュアイア': [-54.80, -68.30],
  'サンティアゴデルエステロ': [-27.79, -64.26],
  'トレレウ': [-43.25, -65.31],
  'マルデルプラタ': [-38.00, -57.55],
  'サンタクルス': [-50.00, -70.00],
  'バリローチェ': [-41.13, -71.30],
  'サンタフェ': [-31.63, -60.70],
  'マスカット': [23.61, 58.59],
  'マスンダム': [26.26, 56.25],
  'ダムニヤート諸島': [23.87, 58.12],
  'ミルバート': [16.99, 54.69],
  'ハラニヤット諸島': [17.25, 56.10],
  'サラーラ': [17.02, 54.09],
  'クーラマト': [17.06, 54.11],
  'サムバラク': [17.03, 54.11],
  'アレサカ': [17.03, 54.12],
  'クハル': [17.03, 54.13],
  'フジャイラ': [25.12, 56.33],
  'ドバイ': [25.27, 55.30],
  'アブダビ': [24.47, 54.37],
  'シャールジャ': [25.34, 55.41],
  'ラアスアルカイマ': [25.79, 55.94],
  'ウムアルカイワイン': [25.57, 55.55],
  'アルアイン': [24.19, 55.76],
  'アルファジャイラ': [25.14, 56.33],
  'カイオル': [25.66, 55.80],
  'サクリー': [25.75, 55.88],
  'ドーハ': [25.29, 51.53],
  'アルワクラ': [25.17, 51.60],
  'アルコル': [25.68, 51.51],
  'アッシャハニヤ': [25.34, 51.26],
  'ドハマダム': [25.20, 51.32],
  'アルガリヤ': [25.38, 51.41],
  'ジュマイリア': [25.51, 51.13],
  'アルルワイス': [25.92, 51.08],
  'マディーナカリファ': [25.28, 51.44],
  'アッシャニヤ': [25.34, 51.27],
  'ジッダ': [21.49, 39.19],
  'ヤンブー': [24.08, 38.06],
  'ファラサン諸島': [16.68, 42.10],
  'アルワジュ': [26.25, 36.48],
  'タブーク': [28.38, 36.58],
  'カシム': [26.18, 43.97],
  'ダンナ': [26.37, 50.11],
  'アルコバール': [26.31, 50.21],
  'ジザン': [16.89, 42.55],
  'タイフ': [21.26, 40.41],
};

final List<String> tanklist = [
  '10Lスチール',
  '10Lアルミ',
  'エンリッチ',
  '12Lスチール',
  '14Lスチール'
];

final List<String> sortlist = [
  '日付降順',
  '日付昇順',
  '最大深度降順',
  '最大深度昇順',
  '平均深度降順',
  '平均深度昇順',
  '潜水時間降順',
  '潜水時間昇順',
  '水温降順',
  '水温昇順'
];
