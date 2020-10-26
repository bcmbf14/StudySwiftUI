//
//  Ch02_2_Text.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch02_2_Text: View {
    var body: some View {
        //    Example01()
        //    Example02()
        Example03()
    }
}

private extension Ch02_2_Text {
    // MARK: Example 01
    
    /// 텍스트에 제공되는 여러 가지 수식어를 이용해 쉽게 문자열을 조작할 수 있습니다.
    struct Example01: View {
        var body: some View {
            VStack(spacing: 30) {
                Text("폰트와 굵기 설정")
                    .font(.title)
                    .fontWeight(.thin)
                
                Text("글자색은 foreground, 배경은 background 입니다요. 케케케.")
                    .foregroundColor(.red)
                    .lineLimit(1)
                    .fixedSize()//adjust,,처럼 폰트가 작아지는건아닌거같네요. 화면을 넘어갑니다.
                    .padding()
                    .background(Color.blue)
                
                Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
                    .font(.custom("Menlo", size: 16))
                    .bold() //볼드
                    .italic() //이탤릭
                    .underline() //밑줄
                    .strikethrough() //취소선
                
                Text("라인 수 제한과\n텍스트 정렬 기능입니다.\n이건 안 보이죠?")
                    .lineLimit(2) //numberofLine
                    .multilineTextAlignment(.trailing) //다중행정렬
                    .fixedSize() //주어진 공간이 모자라도 텍스트 다 나오도록.
                
                (Text("자간과 기준선")
                    .kerning(-5) //자간
                    + Text(" 조정도 쉽게 가능합니다.").baselineOffset(8))
                    .font(.system(size: 16))
                
                
                Text("자간과 기준선 자간과 기준선 자간과 기준선 자간과 기준선 자간과 기준선 자간과 기준선 자간과 기준선")
                    .kerning(10)
                    .tracking(-5)
                    .lineSpacing(20) //행간?이라그러나요
            }
        }
    }
    
    
    
    
    
    
    // MARK: Example 02
    
    /// 수식어 적용 순서에 따라 사용 가능한 수식어가 달라집니다.
    struct Example02: View {
        var body: some View {
            // O.K.
            Text("SwiftUI")
                .font(.title)  // Text
                .bold()        // Text
                .padding()     // View
            
            // 오류.
            //    Text("SwiftUI")
            //      .padding()  // View
            //      .bold()     // X
            //      .font(.title)
        }
    }
    
    // MARK: Example 03
    
    /// 수식어 적용 순서에 따라 실행 결과가 크게 달라질 수 있습니다.
    struct Example03: View {
        var body: some View {
            VStack {
                Text("🐶🐱🐰🦊").font(.title)
                    .background(Color.red)
                
                Text("🐶🐱🐰🦊").font(.largeTitle)
                    .background(Color.red)
                
                Text("🐶🐱🐰🦊").font(.title)
                    .padding()
                    .background(Color.black)
                
                Text("🐶🐱🐰🦊").font(.largeTitle)
                    .padding()
                    .background(Color.yellow)
                
                Text("🐶🐱🐰🦊").font(.largeTitle)
                    .background(Color.yellow)
                    .padding()
                    .background(Color.green)
                
            }
        }
    }
}


// MARK: - Previews

struct Ch02_2_Text_Previews: PreviewProvider {
    static var previews: some View {
        Ch02_2_Text()
            .previewDisplayName("Sweet SwiftUI")
    }
}
