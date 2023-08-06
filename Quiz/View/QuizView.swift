//
//  QuizView.swift
//  Quiz
//
//  Created by YA on 2023/8/3.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: - Typealias
    
    typealias dic = [String: String]
    
    // MARK: - Property Wrapper
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var name: String
    @State var isPresentAlert: Bool = false
    @State var answers: [String] = Array(repeating: "", count: 9)
    @State var index: Int = 0
    
    // MARK: - Property
    
    let questions: [String] = [
        "劉最喜歡的樂團是？（10分）",
        "Telecaster長什麼樣子？（10分）",
        "他是誰？（10分）",
        "導因於帝國主義在亞洲的侵略，而爆發的衝突（甲）鴉片戰爭（乙）英法聯軍（丙）清法戰爭（丁）甲午戰爭（戊）八國聯軍。正確的是？（10分）",
        "以下哪個不是高雄景點？（10分）",
        "圖中的柴犬拒絕做什麼？（10分）",
        "地球上有一條重要的緯線通過臺灣，就是北回歸線，在臺灣某些有北回歸線通過的縣市，特地設立地標，讓民眾認識這一條重要的界線，如下圖。請問：此處可能為選項中哪一個縣市？（10分）",
        "此張照片的攝影地點為何？（10分）",
        "尼康株式會社（日語：株式会社ニコン，英語：Nikon），是一家日本大型光學儀器製造商，也是三菱集團的關係企業之一。「Nikon」此企業名稱，為原始之商號「日本光學工業」（NIPPON KOGAKU K.K.）各取前段日文發音的略縮語。\n尼康一直致力於光學和影像產品的研究開發，其產品包括照相機、相機鏡頭、積體電路製造裝置、液晶製造裝置、望遠鏡、顯微鏡、投影機、眼鏡和測量儀器。到2013年3月為止，公司共有24,047名雇員。公司總部位於日本東京港區港南，而照相機相關業務與服務中心位於日本東京品川區西大井。/n尼康建立於1917年，當時原名日本光學工業株式會社（日本光学工業株式会社）。1988年該公司根據旗下暢銷照相機品牌「尼康」（Nikon），更改為目前名稱。「尼康」這名稱，是日本光學於1946年為配合當時新上市的眼鏡鏡片產品系列Pointar（ポインタール）而開始使用的，主要是取「日本光學」的日文羅馬字母拼音「Nippon Kōgaku」之字首縮寫。\n日本軍方在二十世紀初使用的光學裝置都要購自歐美國家，尤其是向德國購入，因為光學器材對觀測和瞄準極為重要，直接影響情報收集及射擊精確度，所以日本軍方希望光學裝置和器材可在國內生產，避免日後和歐美國家交惡後受到牽制。為響應日本政府希望光學器材國產化，時任三菱集團社長岩崎小彌太於1917年出資成立日本光學工業公司，成為三菱集團的關係企業，尼康之名也就是「日本光學」的日語拼音。從1932年起，尼康將旗下的鏡頭產品以Nikkor為品牌，成為著名的尼克爾鏡頭。尼康在成立後即成為日本的主要軍工企業，為帝國海軍及陸軍生過戰鬥機和轟炸機的瞄準具，軍艦的測距儀，潛艇的潛望鏡等軍工產品。日本戰敗後，三菱財閥被美國為首的盟軍政府肢解分拆，尼康改為主力生產望遠鏡、顯微鏡、投影機、眼鏡鏡片等民用產品。\n因為尼康的光學技術精良，戰後的尼康仍然是世界的軍用光學器材生產商，尼康的光學瞄準具廣泛被使用在日本及美國的主力戰車、軍艦和航空太空領域。在朝鮮戰場上，交戰雙方中國人民志願軍和聯合國軍均在使用由尼康生產的火炮測距儀和望遠鏡。由於尼康對日本光學工作的巨大貢獻，位於西大井的尼康相機部門門前的馬路，被命名為「光學大街」（光学通り）。\n尼康的業務隨著日本戰後經濟的復興而高速發展，由於日本國民收入在1960年代後快速增長，居民消費的能力明顯增加，加上日本人對攝影的愛好，都大幅帶動尼康的相機業務。到1980年代，尼康與佳能、賓得士成為日本三大攝影器材供應商，同時成功打入國際市場，在專業攝影佔有重要席位，成為世界上相機的領導性生產商之一。數位攝影在2000年後的興起，對傳統攝影市場帶來衝擊，具有先進電子技術的廠家如索尼和三星電子開始跨入攝影市場，加劇攝影器材市場的競爭，尼康憑多年累積的光學技術及專業品牌優勢，成功轉型為數位攝影器材的主要供應商，仍能與佳能瓜分攝影器材的市場。部分相機生產商如松下及奧林巴斯在單眼相機不敵尼康及佳能後，於是發展較單反輕巧的微單相機切入可換鏡頭數位相機市場並取得先機，尼康雖然發展Nikon 1系列微單相機迎戰，但限於失去先機及規格限制而未能成功。智慧型手機的發展及手機拍攝品質的改善，在2010年後開始尼康的卡片相機業務造成嚴重衝擊，尼康在中國無錫的大型相機廠因產量持續縮減而被關閉。由於專業應用以外的相機市場有被智慧型手機取代趨勢，尼康在2017年計劃將業務重心逐漸轉移往半導體生產裝置及醫療器材的發展。\n\n以上為尼康的介紹，試問，圖中紅色框框中的富士數位相機型號為？（10分）",
        "以後繼續一起拍照嗎？（100分）"
    ]
    let questionsImage: [String] = [
        "",
        "",
        "Mr. Donothing",
        "",
        "",
        "柴",
        "北回歸線",
        "腳",
        "X-T5"
    ]
    let optionsMark: [String] = ["A", "B", "C", "D"]
    let options: [[String: [String]]] = [
        ["optionText": ["Yogee New Waves", "傷心欲絕", "落日飛車", "椅子樂團"]],
        ["optionImage": ["Telecaster", "Stratocaster", "Jazzmaster", "Jazz"]],
        ["optionText": ["Mr. Donething", "Mr. Doanything", "Mr. Domothing", "Mr. Donothing"]],
        ["optionText": ["甲乙丙戊", "甲乙丁戊", "乙丙丁戊", "以上皆是"]],
        ["optionImage": ["高雄1", "高雄2", "高雄3", "臺北1"]],
        ["optionText": ["工作", "微笑", "吃飯", "撒嬌"]],
        ["optionText": ["桃園市", "臺中市", "花蓮縣", "屏東縣"]],
        ["optionText": ["再見八六六", "再見八八六", "再見捌陸陸", "再見捌捌陸"]],
        ["optionText": ["FUJIFILM X-T3", "FUJIFILM X-T4", "FUJIFILM X-T5", "FUJIFILM X-T6"]]
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text("\(index + 1). \(questions[index])")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                if index != 9 {
                    if questionsImage[index] != "" {
                        HStack(alignment: .center) {
                            Image(questionsImage[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300, alignment: .center)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                    ForEach(0..<optionsMark.count, id: \.self) { optionIndex in
                        FormOptionView(selectedAnswer: $answers[index], option: optionsMark[optionIndex], optionText: options[index]["optionText"]?[optionIndex], optionImage: options[index]["optionImage"]?[optionIndex])
                    }
                } else {
                    Text("（簡答題）")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack(alignment: .center, spacing: 10) {
                    Button {
                        if index == 0 {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            index -= 1
                        }
                    } label: {
                        Text(index == 0 ? "返回" : "上一題")
                            .font(.headline)
                            .fontDesign(.rounded)
                            .fontWeight(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.large)
                    .tint(.pink)
                    
                    if index != 9 {
                        Button {
                            index += 1
                        } label: {
                            Text(index != 9 ? "下一題" : "完成作答")
                                .font(.headline)
                                .fontDesign(.rounded)
                                .fontWeight(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.large)
                        .tint(.pink)
                    } else {
                        NavigationLink {
                            ResultView(name: $name, answers: $answers)
                        } label: {
                            Text("完成作答")
                                .font(.headline)
                                .fontDesign(.rounded)
                                .fontWeight(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.large)
                        .tint(.pink)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("第一屆知識問答大賽")
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            if name == "" {
                isPresentAlert = true
            }
        }
        .alert(isPresented: $isPresentAlert) {
            Alert(title: Text("注意！"), message: Text("填名字😡😡😡"), dismissButton: .default(Text("好喔")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(name: .constant(""))
    }
}
