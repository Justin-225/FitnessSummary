import SwiftUI

struct MedalCard: View {
    let caption: String
    let detail: String

    var body: some View {
        CardContainer(title: "獎章") {
            VStack(spacing: 4) {
                Spacer(minLength: 0)
                medal
                Text(caption)
                    .font(.footnote)
                Text(detail)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
    }

    /// 獎章圖片放在 Assets 的 "medal"；沒有圖片時顯示金色圓形當預設圖
    private var medal: some View {
        Circle()
            .fill(LinearGradient(
                colors: [Color(red: 0.85, green: 0.75, blue: 0.35),
                         Color(red: 0.35, green: 0.30, blue: 0.10)],
                startPoint: .top, endPoint: .bottom))
            .overlay {
                Image(systemName: "figure.run")
                    .font(.system(size: 34))
                    .foregroundStyle(.white.opacity(0.9))
            }
            .overlay {
                Image("medal")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 80, height: 80)
    }
}
