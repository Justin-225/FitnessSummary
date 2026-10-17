import SwiftUI

/// 全站共用顏色。背景與卡片用系統語意色，淺色 / 深色模式會自動切換。
extension Color {
    static let fitLime   = Color(red: 0.75, green: 1.00, blue: 0.29)   // 強調綠
    static let fitRed    = Color(red: 0.98, green: 0.20, blue: 0.35)   // 活動
    static let fitPurple = Color(red: 0.64, green: 0.55, blue: 0.89)   // 步數
    static let fitBlue   = Color(red: 0.25, green: 0.66, blue: 0.97)   // 距離
    static let fitPink   = Color(red: 0.85, green: 0.55, blue: 0.85)   // 跑步配速

    static let pageBackground = Color(.systemGroupedBackground)
    static let cardBackground = Color(.secondarySystemGroupedBackground)
}
