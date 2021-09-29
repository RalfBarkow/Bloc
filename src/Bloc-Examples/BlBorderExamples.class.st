"
# Border

Border is another essential visual property in addition to the {{gtClass:BlBackground}}. It is represented by {{gtClass:BlBorder}} which encapsulates various border properties such as paint, width, style and opacity.
**All border instances are immutable objects.**

The simplest way to create a border is to use Color.
{{gtExample:BlBorderExamples>>#colorGrayBorder}}
In addition users can provide a custom width along side with the paint, it is the most common way to create a border:
{{gtExample:BlBorderExamples>>#colorGrayBorderWithExplicitWidth}}

## Immutability

As it was mentioned previously the border is immutable. Any change to its state once created results in {{gtClass:BlImmutableObjectChangeError}}.
The reason for the border to be immutable is to simplify overall design, decrease complexity and prevent users from making trivial mistakes. Some border properties influence the geometry of the element (stroked bounds) which means that every time the border width is changed we should somehow notify and invalidate the element that uses that border. Either the user would have to send some invalidation message to the element or the border should know its element. If we make users be responsible for manual invalidation sooner or later it may happen that they forget or just will have a lack of understanding of such details therefore they will start to think that Bloc does not work properly. That is why a clean and nice solution is to make border immutable and enfore users to use {{gtMethod:BlElement>>#border:}} every time he or she wants to change the border.

In the following example we show what happens if user tries to change the width of the existing border:
{{gtExample:BlBorderExamples>>#changeWidthError}}
## Changing border's properties

The obvious downside of the immutability is the fact that it is not possible to mutate one specific border's property. To address this issue border provides a set of `copyWith*:` methods that create a new instance of the border with one one property modified.
Assume the following example in which we create a new border with a different width preserving all other properties:
{{gtExample:BlBorderExamples>>#copyWithWidth}}


"
Class {
	#name : #BlBorderExamples,
	#superclass : #Object,
	#category : #'Bloc-Examples-! Documentation examples'
}
