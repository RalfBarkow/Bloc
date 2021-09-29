"
I am Bloc's lowest level. 
My responsibility is to manage low-level services such as managing windows, event queue and drawing synchronization. 

My main responsibility is to manage the open {{gtClass:BlSpace|label=spaces}} and keep them in sync. I use a {{gtClass:BlSpaceManager}} to keep track of multiple spaces.

I am the interface used to create/delete windows. To achieve that, I use a {{gtClass:BlHost|label=Host}}, which can be customized and specified by the user (NB. I must be stopped first). For example:
```language=smalltalk
universe stop.
universe preferableHost: MyHost new.
universe start.
```

"
Class {
	#name : #BlUniverse,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'pulseLoop',
		'pulseListeners',
		'spaceManager',
		'announcer',
		'deferredActions',
		'nextPulseRequested',
		'host'
	],
	#classVars : [
		'Default',
		'Session'
	],
	#category : #'Bloc-Universe'
}
