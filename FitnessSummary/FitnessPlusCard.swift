import SwiftUI

struct FitnessPlusCard: View {
    var tag = "每月免費試用計畫"
    var title = "與 Kim 練習 HIIT"
    var subtitle = "10 分鐘・懷舊金曲"
    var pageCount = 5

    var body: some View {
        ZStack(alignment: .topLeading) {
            AssetImage(name: "fitnessHero", fallbackSymbol: "figure.highintensity.intervaltraining")

            LinearGradient(
                colors: [.black.opacity(0.55), .clear, .black.opacity(0.75)],
                startPoint: .top, endPoint: .bottom)

            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    HStack(spacing: 2) {
                        Image(systemName: "applelogo")
                        Text("Fitness+")
                    }
                    .font(.title2.bold())
                    Spacer()
                    Image(systemName: "chevron.right")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.fitLime)
                }

                Spacer()

                Text(tag)
                    .font(.subheadline)
                    .foregroundStyle(Color.fitLime)
                Text(title)
                    .font(.title.bold())
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))

                HStack(spacing: 10) {
                    ForEach(0..<pageCount, id: \.self) { index in
                        Circle()
                            .fill(index == 0 ? Color.white : Color.white.opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 10)
            }
            .foregroundStyle(.white)
            .padding(18)
        }
        .frame(height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }
}
