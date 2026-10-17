import SwiftUI

/// 一天 24 小時的細直線圖表。values 為 24 個 0...1 的數值，0 代表沒有資料。
struct HourlyBarChart: View {
    let color: Color
    let values: [Double]
    private let chartHeight: CGFloat = 56

    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 0) {
                ForEach(0..<24, id: \.self) { hour in
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 1)
                        if hour < values.count, values[hour] > 0 {
                            Capsule()
                                .fill(color)
                                .frame(width: 3, height: max(4, values[hour] * chartHeight))
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(height: chartHeight)

            HStack(spacing: 0) {
                ForEach([0, 6, 12, 18], id: \.self) { hour in
                    Text("\(hour)時")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }

    /// 範例資料：凌晨有一點點、中午有一根
    static let sample: [Double] = {
        var v = Array(repeating: 0.0, count: 24)
        v[1] = 0.05; v[2] = 0.08; v[3] = 0.05
        v[12] = 0.8; v[13] = 0.05
        return v
    }()
}
