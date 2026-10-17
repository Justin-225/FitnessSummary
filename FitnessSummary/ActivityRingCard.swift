import SwiftUI

struct ActivityRingCard: View {
    let current: Int
    let goal: Int

    private var progress: Double {
        guard goal > 0 else { return 0 }
        return Double(current) / Double(goal)
    }

    var body: some View {
        CardContainer(title: "活動記錄圓圈", showsChevron: false) {
            HStack(spacing: 28) {
                ActivityRing(progress: progress)
                    .frame(width: 138, height: 138)

                VStack(alignment: .leading, spacing: 0) {
                    Text("活動")
                        .font(.title3)
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("\(current)/\(goal)")
                            .font(.system(size: 40, weight: .semibold))
                        Text("大卡")
                            .font(.title3.bold())
                    }
                    .foregroundStyle(Color.fitRed)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 14)
        }
    }
}

struct ActivityRing: View {
    let progress: Double
    private let lineWidth: CGFloat = 28

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.fitRed.opacity(0.2), lineWidth: lineWidth)
                .padding(lineWidth / 2)

            Circle()
                .trim(from: 0, to: max(progress, 0.001))
                .stroke(Color.fitRed, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .padding(lineWidth / 2)

            // 圓圈起點的箭頭
            Capsule()
                .fill(Color.fitRed)
                .frame(width: 35, height: 27)
                .overlay {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.black)
                }
                .offset(y: -55)
        }
    }
}
