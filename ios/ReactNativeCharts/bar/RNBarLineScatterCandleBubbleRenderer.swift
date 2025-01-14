//
//  BarLineScatterCandleBubbleRenderer.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics
import DGCharts

@objc(RNBarLineScatterCandleBubbleRenderer)
open class RNBarLineScatterCandleBubbleRenderer: BarLineScatterCandleBubbleRenderer
{
    internal var _xBounds = XBounds() // Reusable XBounds object

    public override init(animator: Animator, viewPortHandler: ViewPortHandler)
    {
        super.init(animator: animator, viewPortHandler: viewPortHandler)
    }

    /// Checks if the provided entry object is in bounds for drawing considering the current animation phase.
    internal func isInBoundsX(entry e: ChartDataEntry, dataSet: BarLineScatterCandleBubbleChartDataSetProtocol) -> Bool
    {
        let entryIndex = dataSet.entryIndex(entry: e)
        return Double(entryIndex) < Double(dataSet.entryCount) * animator.phaseX
    }

    /// Calculates and returns the x-bounds for the given DataSet in terms of index in their values array.
    /// This includes minimum and maximum visible x, as well as range.
    internal func xBounds(chart: BarLineScatterCandleBubbleChartDataProvider,
                          dataSet: BarLineScatterCandleBubbleChartDataSetProtocol,
                          animator: Animator?) -> XBounds
    {
        return XBounds(chart: chart, dataSet: dataSet, animator: animator)
    }

    /// - Returns: `true` if the DataSet values should be drawn, `false` if not.
    internal func shouldDrawValues(forDataSet set: ChartDataSetProtocol) -> Bool
    {
        return set.isVisible && (set.isDrawValuesEnabled || set.isDrawIconsEnabled)
    }

}
