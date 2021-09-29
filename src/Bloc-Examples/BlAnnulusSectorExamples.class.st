"
# Annulus sector
In mathematics, an annulus (the Latin word for ""little ring"" is anulus / annulus, with plural anuli / annuli) is a ring-shaped object, a region bounded by two concentric circles.

<https://en.wikipedia.org/wiki/Annulus_(mathematics)>

By default, {{gtClass:BlAnnulusSector}} is set up to represent a sector of the annulus:
{{gtExample:BlAnnulusSectorExamples>>#default|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

The geometry allows users to customize the sector via:
 - {{gtMethod:BlAnnulusSector>>#startAngle:}} - start angle given in degrees counting clockwise from the right most point
 - {{gtMethod:BlAnnulusSector>>#endAngle:}} - end angle given in degrees counting clockwise from the right most point
 - {{gtMethod:BlAnnulusSector>>#innerRadius:}} - the size of the inner circle given as a fraction [0..1] of the maximum possible radius
 - {{gtMethod:BlAnnulusSector>>#outerRadius:}} - the size of the outer circle given as a fraction [0..1] of the maximum possible radius

We can control the sector by playing with `startAngle:` and `endAngle:`
{{gtExample:BlAnnulusSectorExamples>>#annulusSectorTopRight|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}
{{gtExample:BlAnnulusSectorExamples>>#annulusSectorBottomRight|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}
{{gtExample:BlAnnulusSectorExamples>>#annulusSectorBottomLeft|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}
{{gtExample:BlAnnulusSectorExamples>>#annulusSectorTopLeft|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

If the overall sector is equal or more than 360 degrees then the sector turns into a annulus:
{{gtExample:BlAnnulusSectorExamples>>#annulus|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

If inner radius is 0, then the annulus sector degrades to circle sector:
{{gtExample:BlAnnulusSectorExamples>>#circleSector|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

This we can create a pac-man shaped sector:
{{gtExample:BlAnnulusSectorExamples>>#pacman|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

If in addition to that the angle is >=360 we get a circle:
{{gtExample:BlAnnulusSectorExamples>>#circle|codeExpanded=false|previewShow=#gtLiveFor:|previewExpanded=true|previewHeight=100}}

"
Class {
	#name : #BlAnnulusSectorExamples,
	#superclass : #BlGeometryExamples,
	#category : #'Bloc-Examples-! Documentation examples'
}
