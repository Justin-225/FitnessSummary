import SwiftUI

/// 綠色文字的膠囊按鈕（編輯摘要、查看所有類別）
struct ActionButton: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title3.bold())
            .foregroundStyle(Color.fitLime)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.cardBackground, in: Capsule())
    }
}
