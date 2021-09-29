"
# Opacity

It is possible to change transparency of the element and all its children by setting the `opacity` property. Opacity is represented by a float number within the closed interval [0...1].
**NB: Opacity is a purely visual property, it is not taken into account during event dispatch phase, thus even transparent elements still receive mouse events**

When opacity is set to 0 an element is considered to be fully transparent, thus {{gtMethod:BlElement>>#isTransparent}} returns true:
{{gtExample:BlOpacityExamples>>#makeTransparent}}
If opacity is set to 1, the element is considered to be opaque, {{gtMethod:BlElement>>#isOpaque}} returns true:
{{gtExample:BlOpacityExamples>>#makeOpaque}}
The last but not least state of transparency is when opacity property has a value between 0 and 1, but not equal to them. In this case we call the element translucent and {{gtMethod:BlElement>>#isTranslucent}} returns true:
{{gtExample:BlOpacityExamples>>#makeTranslucent}}
In the following example we show how to change and query `opacity` of the element:
```
|element|
element := BlElement new background: Color black.
element opacity: 0.5.
self assert: element opacity equals: 0.5.
element
```

"
Class {
	#name : #BlOpacityExamples,
	#superclass : #Object,
	#category : #'Bloc-Examples-! Documentation examples'
}
