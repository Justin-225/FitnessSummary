import SwiftUI

/// 所有卡片共用的外框：標題 + 右上角圓形箭頭 + 內容
struct CardContainer<Content: View>: View {
    let title: String
    let showsChevron: Bool
    let content: Content

    // 明確寫出 init，確保 CardContainer(title:) { ... } 的尾隨閉包語法一定可用
    init(title: String,
         showsChevron: Bool = true,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.showsChevron = showsChevron
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.title3.bold())
                Spacer()
                if showsChevron {
                    ChevronBadge()
                }
            }
            content
        }
        .padding(18)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }
}

struct ChevronBadge: View {
    var body: some View {
        Image(systemName: "chevron.right")
            .font(.system(size: 12, weight: .heavy))
            .foregroundStyle(.black.opacity(0.7))
            .frame(width: 26, height: 26)
            .background(Color(.systemGray2), in: Circle())
    }
}
