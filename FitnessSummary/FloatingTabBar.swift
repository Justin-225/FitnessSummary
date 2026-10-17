import SwiftUI

enum FitnessTab: CaseIterable {
    case summary, fitnessPlus, workout, sharing

    var title: String {
        switch self {
        case .summary: return "摘要"
        case .fitnessPlus: return "Fitness+"
        case .workout: return "體能訓練"
        case .sharing: return "分享"
        }
    }

    // 原 App 的圖示是自製的，這裡先用相近的 SF Symbol，之後可換成自己的 asset
    var symbol: String {
        switch self {
        case .summary: return "circle"
        case .fitnessPlus: return "figure.run.circle"
        case .workout: return "figure.run.circle.fill"
        case .sharing: return "person.2.fill"
        }
    }
}

struct FloatingTabBar: View {
    let selected: FitnessTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(FitnessTab.allCases, id: \.self) { tab in
                VStack(spacing: 2) {
                    Image(systemName: tab.symbol)
                        .font(.system(size: 26, weight: tab == .summary ? .heavy : .regular))
                        .frame(height: 30)
                    Text(tab.title)
                        .font(.caption.weight(.semibold))
                }
                .foregroundStyle(tab == selected ? Color.fitLime : Color.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background {
                    if tab == selected {
                        Capsule().fill(Color.primary.opacity(0.12))
                    }
                }
            }
        }
        .padding(6)
        .background(.ultraThinMaterial, in: Capsule())
        .overlay(Capsule().stroke(Color.primary.opacity(0.12), lineWidth: 1))
        .padding(.horizontal, 22)
        .padding(.bottom, 4)
    }
}
