import SwiftUI

/// 步數、步行距離共用的卡片（用 property 客製標題、數值、單位、顏色）
struct MetricCard: View {
    let title: String
    let value: String
    var unit: String = ""
    let color: Color
    var values: [Double] = HourlyBarChart.sample

    var body: some View {
        CardContainer(title: title) {
            Text("今天")
                .font(.subheadline)

            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(size: 44, weight: .semibold, design: .rounded))
                if !unit.isEmpty {
                    Text(unit)
                        .font(.title3.bold())
                }
            }
            .foregroundStyle(color)
            .minimumScaleFactor(0.6)
            .lineLimit(1)

            HourlyBarChart(color: color, values: values)
                .padding(.top, 6)
        }
    }
}
