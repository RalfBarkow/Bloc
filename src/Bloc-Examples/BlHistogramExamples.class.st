"
# Histogram
A histogram is an accurate representation of the distribution of numerical data. It is an estimate of the probability distribution of a continuous variable and was first introduced by Karl Pearson. It differs from a bar graph, in the sense that a bar graph relates two variables, but a histogram relates only one.

The bins (intervals) are adjacent.

<https://en.wikipedia.org/wiki/Histogram>

By default, {{gtClass:BlHistogram}} is set up to represent a symmetric, unimodal distribution:
{{gtExample:BlHistogramExamples>>#default|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

## Orientation

The orientation of the histogram can be changed by sending a corresponding message

### Bottom to top
{{gtMethod:BlHistogram>>#beBottomToTop}} (which is a default orientation):
{{gtExample:BlHistogramExamples>>#bottomToTop|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

### Top to bottom
{{gtMethod:BlHistogram>>#beTopToBottom}}
{{gtExample:BlHistogramExamples>>#topToBottom|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

### Left to right
{{gtMethod:BlHistogram>>#beLeftToRight}}
{{gtExample:BlHistogramExamples>>#leftToRight|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

### Right to left
{{gtMethod:BlHistogram>>#beRightToLeft}}
{{gtExample:BlHistogramExamples>>#rightToLeft|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

"
Class {
	#name : #BlHistogramExamples,
	#superclass : #BlGeometryExamples,
	#category : #'Bloc-Examples-! Documentation examples'
}
