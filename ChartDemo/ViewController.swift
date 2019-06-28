//
//  ViewController.swift
//  ChartDemo
//
//  Created by Cynoteck on 27/11/18.
//  Copyright © 2018 Cynoteck. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
   
    @IBOutlet weak var historicView: BarChartView!
    
    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 50.0, 25.0, 57.0, 60.0, 28.0, 17.0, 47.0]
    let unitsBought = [10.0, 14.0, 60.0, 13.0, 2.0, 10.0, 15.0, 18.0, 25.0, 05.0, 10.0, 19.0]
    let unitsPurchased = [10.0, 14.0, 60.0, 13.0, 2.0, 10.0, 15.0, 18.0, 25.0, 05.0, 10.0, 19.0]
    let xaxisValue: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
//        let labels = ["3 Week", "2 Week", "Last Week", "This Week"]
//        let myScores = [85, 90, 95, 80]
//        let groupScores = [90, 91, 90, 91]
//
//
//        var myDataEntries : [BarChartDataEntry] = []
//        var groupDataEntries : [BarChartDataEntry] = []
//
//        for i in 0..<labels.count {
//
//
//            let dataEntry1 = BarChartDataEntry(x: Double(i), yValues: [Double(myScores[i])]) //labels[i]
//            myDataEntries.append(dataEntry1)
//            let dataEntry2 = BarChartDataEntry(x: Double(i + 30), y: Double(groupScores[i]))
//
//            groupDataEntries.append(dataEntry2)
//        }
//
//        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//
//
//
//
//        let chartDataSetMine = BarChartDataSet(values: myDataEntries, label: "My Score")
//        chartDataSetMine.colors = [UIColor.orange]
//
//        let chartDataSetGroup = BarChartDataSet(values: groupDataEntries, label: "Group Average")
//        chartDataSetGroup.colors = [UIColor.green]
//
//        var dataSet : [BarChartDataSet] = []
//        dataSet.append(chartDataSetMine)
//        dataSet.append(chartDataSetGroup)
//
//        chartDataSetGroup.drawValuesEnabled = false
//
//        historicView.fitBars = true
//
//        let data = BarChartData(dataSets: dataSet)
//
//
//        data.barWidth = 1.5
//        data.groupBars(fromX: 0, groupSpace: 1.5, barSpace: 0.9)
//
//        historicView.animate(xAxisDuration: 2.0)
//        historicView.xAxis.centerAxisLabelsEnabled = true
//
//        historicView.animate(yAxisDuration: 2.0)
//
//
//        historicView.data = data
//
//        historicView.xAxis.labelPosition = XAxis.LabelPosition.bottom
//        historicView.xAxis.drawLabelsEnabled = true
//
//        historicView.rightAxis.enabled = false
//        historicView.leftAxis.enabled = false
//
//        historicView.xAxis.drawGridLinesEnabled = false
//        historicView.xAxis.drawAxisLineEnabled = false
//        //historyView.xAxis.drawLabelsEnabled = false
//
//        let disAccess = historicView.xAxis
//
//        disAccess.forceLabelsEnabled = true
    }
        
    func setupView() {
        
        //legend
        let legend = historicView.legend
        legend.enabled = true
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.orientation = .vertical
        legend.drawInside = true
        legend.yOffset = 10.0;
        legend.xOffset = 10.0;
        legend.yEntrySpace = 0.0;
        legend.textColor = UIColor.black
        
        // Y - Axis Setup
        let yaxis = historicView.leftAxis
        yaxis.spaceTop = 0.35
        yaxis.axisMinimum = 0
        yaxis.drawGridLinesEnabled = false
        yaxis.labelTextColor = UIColor.black
        yaxis.axisLineColor = UIColor.black
        
        historicView.rightAxis.enabled = false
        
        // X - Axis Setup
        let xaxis = historicView.xAxis
        let formatter = CustomLabelsXAxisValueFormatter()//custom value formatter
        formatter.labels = self.xaxisValue
        xaxis.valueFormatter = formatter
        
        xaxis.drawGridLinesEnabled = false
        xaxis.labelPosition = .bottom
        xaxis.labelTextColor = UIColor.black
        xaxis.centerAxisLabelsEnabled = true
        xaxis.axisLineColor = UIColor.black
        xaxis.granularityEnabled = true
        xaxis.enabled = true
        
        
        historicView.delegate = self
        historicView.noDataText = "You need to provide data for the chart."
        historicView.noDataTextColor = UIColor.black
        historicView.chartDescription?.textColor = UIColor.black
        
        setChart()
    }
    
    func setChart() {
        historicView.noDataText = "Loading...!!"
        var dataEntries: [BarChartDataEntry] = []
        var dataEntries1: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        
        for i in 0..<self.xaxisValue.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i) , y: Double(self.unitsSold[i]))
            dataEntries.append(dataEntry)
            
            let dataEntry1 = BarChartDataEntry(x: Double(i) , y: Double(self.unitsBought[i]))
            dataEntries1.append(dataEntry1)
            
            let dataEntry2 = BarChartDataEntry(x: Double(i) , y: Double(self.unitsPurchased[i]))
            dataEntries2.append(dataEntry2)
            
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Sold")
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "Bought")
        let chartDataSet2 = BarChartDataSet(values: dataEntries2, label: "Purchased")
        
        let dataSets: [BarChartDataSet] = [chartDataSet,chartDataSet1,chartDataSet2]
        chartDataSet.colors = [UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 0.5)]
        chartDataSet1.colors = [UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.8)]
        chartDataSet2.colors = [UIColor(red: 254/255, green: 207/255, blue: 42/255, alpha: 0.8)]
        
        
        let chartData = BarChartData(dataSets: dataSets)
        
        let groupSpace = 0.4
        let barSpace = 0.03
        let barWidth = 0.2
        
        chartData.barWidth = barWidth
        
        historicView.xAxis.axisMinimum = 0.0
        historicView.xAxis.axisMaximum = 0.0 + chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(self.xaxisValue.count)
        
        chartData.groupBars(fromX: 0.0, groupSpace: groupSpace, barSpace: barSpace)
        
        historicView.xAxis.granularity = historicView.xAxis.axisMaximum / Double(self.xaxisValue.count)
        
        historicView.data = chartData
        
        historicView.notifyDataSetChanged()
        historicView.setVisibleXRangeMaximum(4)
        historicView.animate(yAxisDuration: 1.0, easingOption: .linear)
        chartData.setValueTextColor(UIColor.black) //
    }
        
    
    
}


