import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MyApp());
}

//MyApp is an object, the build method is a method for it
//MaterialApp is the flutter default "root" app widget, which you can then build pages on using Scaffold
//Scaffold can have a bunch of features like AppBar, which in turn has features like its title
//Text is the lowest widget in the chain, which takes a direct variable as an argument
class MyApp extends StatelessWidget {
  //overrides a stateless widget method of the same name
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dog Weight Over Time'),
        ),
        body: Card(child: TimeSeriesRangeAnnotationMarginChart.withSampleData()),
      ),
    );
  }
}


//This is the main class, the widget name is TimeSeriesRangeAnnotationMarginChart (I'm sorry)
class TimeSeriesRangeAnnotationMarginChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeSeriesRangeAnnotationMarginChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesRangeAnnotationMarginChart.withSampleData() {
    return new TimeSeriesRangeAnnotationMarginChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,

        // Allow enough space in the left and right chart margins for the
        // annotations.
        //To be honest I'm not sure what this does but you probably don't want to mess with it too much
        layoutConfig: new charts.LayoutConfig(
            leftMarginSpec: new charts.MarginSpec.fixedPixel(60),
            topMarginSpec: new charts.MarginSpec.fixedPixel(20),
            rightMarginSpec: new charts.MarginSpec.fixedPixel(60),
            bottomMarginSpec: new charts.MarginSpec.fixedPixel(20)),
        behaviors: [
          // Define one domain and two measure annotations configured to render
          // labels in the chart margins.
          new charts.RangeAnnotation([
            ///In case you wanted to add a vertical differentiator, here you go, but there's no need for this
            ///I have it here just in case
            /*
            new charts.RangeAnnotationSegment(
                new DateTime(2017, 10, 4),
                new DateTime(2017, 10, 15),
                charts.RangeAnnotationAxisType.domain,
                startLabel: 'D1 Start',
                endLabel: 'D1 End',
                labelAnchor: charts.AnnotationLabelAnchor.end,
                color: charts.MaterialPalette.gray.shade200,
                // Override the default vertical direction for domain labels.
                labelDirection: charts.AnnotationLabelDirection.horizontal),
             */
            new charts.RangeAnnotationSegment(
                25, 35, charts.RangeAnnotationAxisType.measure,
                /// Labels the start and end of the range annotation. Simple enough, innit?
                startLabel: '',
                endLabel: 'Unhealthy Zone',
                labelAnchor: charts.AnnotationLabelAnchor.end,
                color: charts.MaterialPalette.red.shadeDefault)
          ], defaultLabelPosition: charts.AnnotationLabelPosition.margin),
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesDogWeights, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesDogWeights(new DateTime(2020, 8, 1), 19),
      new TimeSeriesDogWeights(new DateTime(2020, 8, 5), 19),
      new TimeSeriesDogWeights(new DateTime(2020, 8, 10), 20),
      new TimeSeriesDogWeights(new DateTime(2020, 8, 15), 19),
      new TimeSeriesDogWeights(new DateTime(2020, 8, 20), 20),
      new TimeSeriesDogWeights(new DateTime(2020, 8, 25), 21),
      new TimeSeriesDogWeights(new DateTime(2020, 8, 30), 21),
      new TimeSeriesDogWeights(new DateTime(2020, 9, 1), 22),
      new TimeSeriesDogWeights(new DateTime(2020, 9, 10), 21),
    ];

    /// honestly I don't have a clue what this does
    return [
      new charts.Series<TimeSeriesDogWeights, DateTime>(
        id: 'weight',
        domainFn: (TimeSeriesDogWeights weight, _) => weight.time,
        measureFn: (TimeSeriesDogWeights weight, _) => weight.weight,
        data: data,
      )
    ];
  }
}

/// This just defines the data type that we're putting in the chart
class TimeSeriesDogWeights {
  final DateTime time;
  final int weight;

  TimeSeriesDogWeights(this.time, this.weight);
}
