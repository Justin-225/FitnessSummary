import SwiftUI

/// 讀取 Assets 圖片；圖片還沒加進專案時，會顯示灰底 + SF Symbol 當預設圖。
/// 使用時請自己加 .frame(...) 與 .clipShape(...)。
struct AssetImage: View {
    let name: String
    var fallbackSymbol: String = "photo"

    var body: some View {
        Color(.systemGray5)
            .overlay {
                Image(systemName: fallbackSymbol)
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .overlay {
                Image(name)
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
    }
}
