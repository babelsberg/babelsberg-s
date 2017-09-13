ui - private
initializePanel
	"This code is auto-generated. DO NOT modify it because another generation step will overwrite all changes."
	
	| unnamedMorph1 unnamedMorph2 unnamedMorph3 unnamedMorph4 unnamedMorph5 unnamedMorph6 unnamedMorph7 unnamedMorph8 unnamedMorph9 |
	
	panel := UiContainer new.
	panel changeTableLayout.
	panel extent: (879@878).
	panel position: (0@0).
	panel hResizing: (#rigid).
	panel vResizing: (#rigid).
	panel minWidth: (2).
	panel minHeight: (2).
	panel cellInset: (0).
	panel cellPositioning: (#center).
	panel cellSpacing: (#none).
	panel layoutInset: (4).
	panel listCentering: (#topLeft).
	panel listDirection: (#topToBottom).
	panel listSpacing: (#none).
	panel maxCellSize: (1073741823).
	panel minCellSize: (0).
	panel wrapCentering: (#topLeft).
	panel wrapDirection: (#none).
	panel frameFractions: (0@0 corner: 1@1).
	panel frameOffsets: (0@0 corner: 0@0).
	panel balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.722)).
	panel color: (Color white).
	panel borderWidth: (0).
	panel borderStyle2: (#simple).
	panel borderColor: (Color black).
	panel setProperty: #objectName toValue: 'panel'.
	unnamedMorph1 := UiContainer new.
	unnamedMorph1 changeTableLayout.
	unnamedMorph1 extent: (877@79).
	unnamedMorph1 position: (4@4).
	unnamedMorph1 hResizing: (#spaceFill).
	unnamedMorph1 vResizing: (#rigid).
	unnamedMorph1 minWidth: (2).
	unnamedMorph1 minHeight: (2).
	unnamedMorph1 cellInset: (2).
	unnamedMorph1 cellPositioning: (#center).
	unnamedMorph1 cellSpacing: (#none).
	unnamedMorph1 layoutInset: (2).
	unnamedMorph1 listCentering: (#topLeft).
	unnamedMorph1 listDirection: (#leftToRight).
	unnamedMorph1 listSpacing: (#none).
	unnamedMorph1 maxCellSize: (1073741823).
	unnamedMorph1 minCellSize: (0).
	unnamedMorph1 wrapCentering: (#topLeft).
	unnamedMorph1 wrapDirection: (#none).
	unnamedMorph1 frameFractions: (0@0 corner: 1@1).
	unnamedMorph1 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph1 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.733)).
	unnamedMorph1 color: (Color transparent).
	unnamedMorph1 borderWidth: (0).
	unnamedMorph1 borderStyle2: (#simple).
	unnamedMorph1 borderColor: (Color black).
	unnamedMorph2 := SudokuGivenNumberCell new.
	unnamedMorph2 changeTableLayout.
	unnamedMorph2 extent: (85@75).
	unnamedMorph2 position: (6@6).
	unnamedMorph2 hResizing: (#rigid).
	unnamedMorph2 vResizing: (#rigid).
	unnamedMorph2 minWidth: (2).
	unnamedMorph2 minHeight: (2).
	unnamedMorph2 cellInset: (0).
	unnamedMorph2 cellPositioning: (#center).
	unnamedMorph2 cellSpacing: (#none).
	unnamedMorph2 layoutInset: (0).
	unnamedMorph2 listCentering: (#center).
	unnamedMorph2 listDirection: (#topToBottom).
	unnamedMorph2 listSpacing: (#none).
	unnamedMorph2 maxCellSize: (1073741823).
	unnamedMorph2 minCellSize: (0).
	unnamedMorph2 wrapCentering: (#center).
	unnamedMorph2 wrapDirection: (#none).
	unnamedMorph2 frameFractions: (0@0 corner: 1@1).
	unnamedMorph2 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph2 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	unnamedMorph1 addChild: unnamedMorph2.
	topSum1 := SudokuGivenNumberCell new.
	topSum1 changeTableLayout.
	topSum1 extent: (75@75).
	topSum1 position: (93@6).
	topSum1 hResizing: (#rigid).
	topSum1 vResizing: (#rigid).
	topSum1 minWidth: (2).
	topSum1 minHeight: (2).
	topSum1 cellInset: (0).
	topSum1 cellPositioning: (#center).
	topSum1 cellSpacing: (#none).
	topSum1 layoutInset: (0).
	topSum1 listCentering: (#center).
	topSum1 listDirection: (#topToBottom).
	topSum1 listSpacing: (#none).
	topSum1 maxCellSize: (1073741823).
	topSum1 minCellSize: (0).
	topSum1 wrapCentering: (#center).
	topSum1 wrapDirection: (#none).
	topSum1 frameFractions: (0@0 corner: 1@1).
	topSum1 frameOffsets: (0@0 corner: 0@0).
	topSum1 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum1 setProperty: #objectName toValue: 'topSum1'.
	unnamedMorph1 addChild: topSum1.
	topSum2 := SudokuGivenNumberCell new.
	topSum2 changeTableLayout.
	topSum2 extent: (75@75).
	topSum2 position: (170@6).
	topSum2 hResizing: (#rigid).
	topSum2 vResizing: (#rigid).
	topSum2 minWidth: (2).
	topSum2 minHeight: (2).
	topSum2 cellInset: (0).
	topSum2 cellPositioning: (#center).
	topSum2 cellSpacing: (#none).
	topSum2 layoutInset: (0).
	topSum2 listCentering: (#center).
	topSum2 listDirection: (#topToBottom).
	topSum2 listSpacing: (#none).
	topSum2 maxCellSize: (1073741823).
	topSum2 minCellSize: (0).
	topSum2 wrapCentering: (#center).
	topSum2 wrapDirection: (#none).
	topSum2 frameFractions: (0@0 corner: 1@1).
	topSum2 frameOffsets: (0@0 corner: 0@0).
	topSum2 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum2 setProperty: #objectName toValue: 'topSum2'.
	unnamedMorph1 addChild: topSum2.
	topSum3 := SudokuGivenNumberCell new.
	topSum3 changeTableLayout.
	topSum3 extent: (75@75).
	topSum3 position: (247@6).
	topSum3 hResizing: (#rigid).
	topSum3 vResizing: (#rigid).
	topSum3 minWidth: (2).
	topSum3 minHeight: (2).
	topSum3 cellInset: (0).
	topSum3 cellPositioning: (#center).
	topSum3 cellSpacing: (#none).
	topSum3 layoutInset: (0).
	topSum3 listCentering: (#center).
	topSum3 listDirection: (#topToBottom).
	topSum3 listSpacing: (#none).
	topSum3 maxCellSize: (1073741823).
	topSum3 minCellSize: (0).
	topSum3 wrapCentering: (#center).
	topSum3 wrapDirection: (#none).
	topSum3 frameFractions: (0@0 corner: 1@1).
	topSum3 frameOffsets: (0@0 corner: 0@0).
	topSum3 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum3 setProperty: #objectName toValue: 'topSum3'.
	unnamedMorph1 addChild: topSum3.
	topSum4 := SudokuGivenNumberCell new.
	topSum4 changeTableLayout.
	topSum4 extent: (79@75).
	topSum4 position: (324@6).
	topSum4 hResizing: (#rigid).
	topSum4 vResizing: (#rigid).
	topSum4 minWidth: (2).
	topSum4 minHeight: (2).
	topSum4 cellInset: (0).
	topSum4 cellPositioning: (#center).
	topSum4 cellSpacing: (#none).
	topSum4 layoutInset: (0).
	topSum4 listCentering: (#center).
	topSum4 listDirection: (#topToBottom).
	topSum4 listSpacing: (#none).
	topSum4 maxCellSize: (1073741823).
	topSum4 minCellSize: (0).
	topSum4 wrapCentering: (#center).
	topSum4 wrapDirection: (#none).
	topSum4 frameFractions: (0@0 corner: 1@1).
	topSum4 frameOffsets: (0@0 corner: 0@0).
	topSum4 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum4 setProperty: #objectName toValue: 'topSum4'.
	unnamedMorph1 addChild: topSum4.
	topSum5 := SudokuGivenNumberCell new.
	topSum5 changeTableLayout.
	topSum5 extent: (75@75).
	topSum5 position: (405@6).
	topSum5 hResizing: (#rigid).
	topSum5 vResizing: (#rigid).
	topSum5 minWidth: (2).
	topSum5 minHeight: (2).
	topSum5 cellInset: (0).
	topSum5 cellPositioning: (#center).
	topSum5 cellSpacing: (#none).
	topSum5 layoutInset: (0).
	topSum5 listCentering: (#center).
	topSum5 listDirection: (#topToBottom).
	topSum5 listSpacing: (#none).
	topSum5 maxCellSize: (1073741823).
	topSum5 minCellSize: (0).
	topSum5 wrapCentering: (#center).
	topSum5 wrapDirection: (#none).
	topSum5 frameFractions: (0@0 corner: 1@1).
	topSum5 frameOffsets: (0@0 corner: 0@0).
	topSum5 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum5 setProperty: #objectName toValue: 'topSum5'.
	unnamedMorph1 addChild: topSum5.
	topSum6 := SudokuGivenNumberCell new.
	topSum6 changeTableLayout.
	topSum6 extent: (75@75).
	topSum6 position: (482@6).
	topSum6 hResizing: (#rigid).
	topSum6 vResizing: (#rigid).
	topSum6 minWidth: (2).
	topSum6 minHeight: (2).
	topSum6 cellInset: (0).
	topSum6 cellPositioning: (#center).
	topSum6 cellSpacing: (#none).
	topSum6 layoutInset: (0).
	topSum6 listCentering: (#center).
	topSum6 listDirection: (#topToBottom).
	topSum6 listSpacing: (#none).
	topSum6 maxCellSize: (1073741823).
	topSum6 minCellSize: (0).
	topSum6 wrapCentering: (#center).
	topSum6 wrapDirection: (#none).
	topSum6 frameFractions: (0@0 corner: 1@1).
	topSum6 frameOffsets: (0@0 corner: 0@0).
	topSum6 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum6 setProperty: #objectName toValue: 'topSum6'.
	unnamedMorph1 addChild: topSum6.
	topSum7 := SudokuGivenNumberCell new.
	topSum7 changeTableLayout.
	topSum7 extent: (79@75).
	topSum7 position: (559@6).
	topSum7 hResizing: (#rigid).
	topSum7 vResizing: (#rigid).
	topSum7 minWidth: (2).
	topSum7 minHeight: (2).
	topSum7 cellInset: (0).
	topSum7 cellPositioning: (#center).
	topSum7 cellSpacing: (#none).
	topSum7 layoutInset: (0).
	topSum7 listCentering: (#center).
	topSum7 listDirection: (#topToBottom).
	topSum7 listSpacing: (#none).
	topSum7 maxCellSize: (1073741823).
	topSum7 minCellSize: (0).
	topSum7 wrapCentering: (#center).
	topSum7 wrapDirection: (#none).
	topSum7 frameFractions: (0@0 corner: 1@1).
	topSum7 frameOffsets: (0@0 corner: 0@0).
	topSum7 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum7 setProperty: #objectName toValue: 'topSum7'.
	unnamedMorph1 addChild: topSum7.
	topSum8 := SudokuGivenNumberCell new.
	topSum8 changeTableLayout.
	topSum8 extent: (75@75).
	topSum8 position: (640@6).
	topSum8 hResizing: (#rigid).
	topSum8 vResizing: (#rigid).
	topSum8 minWidth: (2).
	topSum8 minHeight: (2).
	topSum8 cellInset: (0).
	topSum8 cellPositioning: (#center).
	topSum8 cellSpacing: (#none).
	topSum8 layoutInset: (0).
	topSum8 listCentering: (#center).
	topSum8 listDirection: (#topToBottom).
	topSum8 listSpacing: (#none).
	topSum8 maxCellSize: (1073741823).
	topSum8 minCellSize: (0).
	topSum8 wrapCentering: (#center).
	topSum8 wrapDirection: (#none).
	topSum8 frameFractions: (0@0 corner: 1@1).
	topSum8 frameOffsets: (0@0 corner: 0@0).
	topSum8 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum8 setProperty: #objectName toValue: 'topSum8'.
	unnamedMorph1 addChild: topSum8.
	topSum9 := SudokuGivenNumberCell new.
	topSum9 changeTableLayout.
	topSum9 extent: (75@75).
	topSum9 position: (717@6).
	topSum9 hResizing: (#rigid).
	topSum9 vResizing: (#rigid).
	topSum9 minWidth: (2).
	topSum9 minHeight: (2).
	topSum9 cellInset: (0).
	topSum9 cellPositioning: (#center).
	topSum9 cellSpacing: (#none).
	topSum9 layoutInset: (0).
	topSum9 listCentering: (#center).
	topSum9 listDirection: (#topToBottom).
	topSum9 listSpacing: (#none).
	topSum9 maxCellSize: (1073741823).
	topSum9 minCellSize: (0).
	topSum9 wrapCentering: (#center).
	topSum9 wrapDirection: (#none).
	topSum9 frameFractions: (0@0 corner: 1@1).
	topSum9 frameOffsets: (0@0 corner: 0@0).
	topSum9 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	topSum9 setProperty: #objectName toValue: 'topSum9'.
	unnamedMorph1 addChild: topSum9.
	unnamedMorph3 := SudokuGivenNumberCell new.
	unnamedMorph3 changeTableLayout.
	unnamedMorph3 extent: (85@75).
	unnamedMorph3 position: (794@6).
	unnamedMorph3 hResizing: (#rigid).
	unnamedMorph3 vResizing: (#rigid).
	unnamedMorph3 minWidth: (2).
	unnamedMorph3 minHeight: (2).
	unnamedMorph3 cellInset: (0).
	unnamedMorph3 cellPositioning: (#center).
	unnamedMorph3 cellSpacing: (#none).
	unnamedMorph3 layoutInset: (0).
	unnamedMorph3 listCentering: (#center).
	unnamedMorph3 listDirection: (#topToBottom).
	unnamedMorph3 listSpacing: (#none).
	unnamedMorph3 maxCellSize: (1073741823).
	unnamedMorph3 minCellSize: (0).
	unnamedMorph3 wrapCentering: (#center).
	unnamedMorph3 wrapDirection: (#none).
	unnamedMorph3 frameFractions: (0@0 corner: 1@1).
	unnamedMorph3 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph3 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	unnamedMorph1 addChild: unnamedMorph3.
	panel addChild: unnamedMorph1.
	unnamedMorph4 := UiContainer new.
	unnamedMorph4 changeTableLayout.
	unnamedMorph4 extent: (877@719).
	unnamedMorph4 position: (4@83).
	unnamedMorph4 hResizing: (#spaceFill).
	unnamedMorph4 vResizing: (#spaceFill).
	unnamedMorph4 minWidth: (2).
	unnamedMorph4 minHeight: (2).
	unnamedMorph4 cellInset: (0).
	unnamedMorph4 cellPositioning: (#center).
	unnamedMorph4 cellSpacing: (#none).
	unnamedMorph4 layoutInset: (2).
	unnamedMorph4 listCentering: (#topLeft).
	unnamedMorph4 listDirection: (#leftToRight).
	unnamedMorph4 listSpacing: (#none).
	unnamedMorph4 maxCellSize: (1073741823).
	unnamedMorph4 minCellSize: (0).
	unnamedMorph4 wrapCentering: (#topLeft).
	unnamedMorph4 wrapDirection: (#none).
	unnamedMorph4 frameFractions: (0@0 corner: 1@1).
	unnamedMorph4 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph4 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.733)).
	unnamedMorph4 color: (Color transparent).
	unnamedMorph4 borderWidth: (0).
	unnamedMorph4 borderStyle2: (#simple).
	unnamedMorph4 borderColor: (Color black).
	unnamedMorph5 := UiContainer new.
	unnamedMorph5 changeTableLayout.
	unnamedMorph5 extent: (79@715).
	unnamedMorph5 position: (6@85).
	unnamedMorph5 hResizing: (#rigid).
	unnamedMorph5 vResizing: (#spaceFill).
	unnamedMorph5 minWidth: (2).
	unnamedMorph5 minHeight: (2).
	unnamedMorph5 cellInset: (2).
	unnamedMorph5 cellPositioning: (#center).
	unnamedMorph5 cellSpacing: (#none).
	unnamedMorph5 layoutInset: (4).
	unnamedMorph5 listCentering: (#topLeft).
	unnamedMorph5 listDirection: (#topToBottom).
	unnamedMorph5 listSpacing: (#none).
	unnamedMorph5 maxCellSize: (1073741823).
	unnamedMorph5 minCellSize: (0).
	unnamedMorph5 wrapCentering: (#topLeft).
	unnamedMorph5 wrapDirection: (#none).
	unnamedMorph5 frameFractions: (0@0 corner: 1@1).
	unnamedMorph5 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph5 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.733)).
	unnamedMorph5 color: (Color transparent).
	unnamedMorph5 borderWidth: (0).
	unnamedMorph5 borderStyle2: (#simple).
	unnamedMorph5 borderColor: (Color black).
	leftSum1 := SudokuGivenNumberCell new.
	leftSum1 changeTableLayout.
	leftSum1 extent: (75@79).
	leftSum1 position: (10@89).
	leftSum1 hResizing: (#rigid).
	leftSum1 vResizing: (#rigid).
	leftSum1 minWidth: (2).
	leftSum1 minHeight: (2).
	leftSum1 cellInset: (0).
	leftSum1 cellPositioning: (#center).
	leftSum1 cellSpacing: (#none).
	leftSum1 layoutInset: (0).
	leftSum1 listCentering: (#center).
	leftSum1 listDirection: (#topToBottom).
	leftSum1 listSpacing: (#none).
	leftSum1 maxCellSize: (1073741823).
	leftSum1 minCellSize: (0).
	leftSum1 wrapCentering: (#center).
	leftSum1 wrapDirection: (#none).
	leftSum1 frameFractions: (0@0 corner: 1@1).
	leftSum1 frameOffsets: (0@0 corner: 0@0).
	leftSum1 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum1 setProperty: #objectName toValue: 'leftSum1'.
	unnamedMorph5 addChild: leftSum1.
	leftSum2 := SudokuGivenNumberCell new.
	leftSum2 changeTableLayout.
	leftSum2 extent: (75@75).
	leftSum2 position: (10@170).
	leftSum2 hResizing: (#rigid).
	leftSum2 vResizing: (#rigid).
	leftSum2 minWidth: (2).
	leftSum2 minHeight: (2).
	leftSum2 cellInset: (0).
	leftSum2 cellPositioning: (#center).
	leftSum2 cellSpacing: (#none).
	leftSum2 layoutInset: (0).
	leftSum2 listCentering: (#center).
	leftSum2 listDirection: (#topToBottom).
	leftSum2 listSpacing: (#none).
	leftSum2 maxCellSize: (1073741823).
	leftSum2 minCellSize: (0).
	leftSum2 wrapCentering: (#center).
	leftSum2 wrapDirection: (#none).
	leftSum2 frameFractions: (0@0 corner: 1@1).
	leftSum2 frameOffsets: (0@0 corner: 0@0).
	leftSum2 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum2 setProperty: #objectName toValue: 'leftSum2'.
	unnamedMorph5 addChild: leftSum2.
	leftSum3 := SudokuGivenNumberCell new.
	leftSum3 changeTableLayout.
	leftSum3 extent: (75@75).
	leftSum3 position: (10@247).
	leftSum3 hResizing: (#rigid).
	leftSum3 vResizing: (#rigid).
	leftSum3 minWidth: (2).
	leftSum3 minHeight: (2).
	leftSum3 cellInset: (0).
	leftSum3 cellPositioning: (#center).
	leftSum3 cellSpacing: (#none).
	leftSum3 layoutInset: (0).
	leftSum3 listCentering: (#center).
	leftSum3 listDirection: (#topToBottom).
	leftSum3 listSpacing: (#none).
	leftSum3 maxCellSize: (1073741823).
	leftSum3 minCellSize: (0).
	leftSum3 wrapCentering: (#center).
	leftSum3 wrapDirection: (#none).
	leftSum3 frameFractions: (0@0 corner: 1@1).
	leftSum3 frameOffsets: (0@0 corner: 0@0).
	leftSum3 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum3 setProperty: #objectName toValue: 'leftSum3'.
	unnamedMorph5 addChild: leftSum3.
	leftSum4 := SudokuGivenNumberCell new.
	leftSum4 changeTableLayout.
	leftSum4 extent: (75@79).
	leftSum4 position: (10@324).
	leftSum4 hResizing: (#rigid).
	leftSum4 vResizing: (#rigid).
	leftSum4 minWidth: (2).
	leftSum4 minHeight: (2).
	leftSum4 cellInset: (0).
	leftSum4 cellPositioning: (#center).
	leftSum4 cellSpacing: (#none).
	leftSum4 layoutInset: (0).
	leftSum4 listCentering: (#center).
	leftSum4 listDirection: (#topToBottom).
	leftSum4 listSpacing: (#none).
	leftSum4 maxCellSize: (1073741823).
	leftSum4 minCellSize: (0).
	leftSum4 wrapCentering: (#center).
	leftSum4 wrapDirection: (#none).
	leftSum4 frameFractions: (0@0 corner: 1@1).
	leftSum4 frameOffsets: (0@0 corner: 0@0).
	leftSum4 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum4 setProperty: #objectName toValue: 'leftSum4'.
	unnamedMorph5 addChild: leftSum4.
	leftSum5 := SudokuGivenNumberCell new.
	leftSum5 changeTableLayout.
	leftSum5 extent: (75@75).
	leftSum5 position: (10@405).
	leftSum5 hResizing: (#rigid).
	leftSum5 vResizing: (#rigid).
	leftSum5 minWidth: (2).
	leftSum5 minHeight: (2).
	leftSum5 cellInset: (0).
	leftSum5 cellPositioning: (#center).
	leftSum5 cellSpacing: (#none).
	leftSum5 layoutInset: (0).
	leftSum5 listCentering: (#center).
	leftSum5 listDirection: (#topToBottom).
	leftSum5 listSpacing: (#none).
	leftSum5 maxCellSize: (1073741823).
	leftSum5 minCellSize: (0).
	leftSum5 wrapCentering: (#center).
	leftSum5 wrapDirection: (#none).
	leftSum5 frameFractions: (0@0 corner: 1@1).
	leftSum5 frameOffsets: (0@0 corner: 0@0).
	leftSum5 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum5 setProperty: #objectName toValue: 'leftSum5'.
	unnamedMorph5 addChild: leftSum5.
	leftSum6 := SudokuGivenNumberCell new.
	leftSum6 changeTableLayout.
	leftSum6 extent: (75@75).
	leftSum6 position: (10@482).
	leftSum6 hResizing: (#rigid).
	leftSum6 vResizing: (#rigid).
	leftSum6 minWidth: (2).
	leftSum6 minHeight: (2).
	leftSum6 cellInset: (0).
	leftSum6 cellPositioning: (#center).
	leftSum6 cellSpacing: (#none).
	leftSum6 layoutInset: (0).
	leftSum6 listCentering: (#center).
	leftSum6 listDirection: (#topToBottom).
	leftSum6 listSpacing: (#none).
	leftSum6 maxCellSize: (1073741823).
	leftSum6 minCellSize: (0).
	leftSum6 wrapCentering: (#center).
	leftSum6 wrapDirection: (#none).
	leftSum6 frameFractions: (0@0 corner: 1@1).
	leftSum6 frameOffsets: (0@0 corner: 0@0).
	leftSum6 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum6 setProperty: #objectName toValue: 'leftSum6'.
	unnamedMorph5 addChild: leftSum6.
	leftSum7 := SudokuGivenNumberCell new.
	leftSum7 changeTableLayout.
	leftSum7 extent: (75@79).
	leftSum7 position: (10@559).
	leftSum7 hResizing: (#rigid).
	leftSum7 vResizing: (#rigid).
	leftSum7 minWidth: (2).
	leftSum7 minHeight: (2).
	leftSum7 cellInset: (0).
	leftSum7 cellPositioning: (#center).
	leftSum7 cellSpacing: (#none).
	leftSum7 layoutInset: (0).
	leftSum7 listCentering: (#center).
	leftSum7 listDirection: (#topToBottom).
	leftSum7 listSpacing: (#none).
	leftSum7 maxCellSize: (1073741823).
	leftSum7 minCellSize: (0).
	leftSum7 wrapCentering: (#center).
	leftSum7 wrapDirection: (#none).
	leftSum7 frameFractions: (0@0 corner: 1@1).
	leftSum7 frameOffsets: (0@0 corner: 0@0).
	leftSum7 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum7 setProperty: #objectName toValue: 'leftSum7'.
	unnamedMorph5 addChild: leftSum7.
	leftSum8 := SudokuGivenNumberCell new.
	leftSum8 changeTableLayout.
	leftSum8 extent: (75@75).
	leftSum8 position: (10@640).
	leftSum8 hResizing: (#rigid).
	leftSum8 vResizing: (#rigid).
	leftSum8 minWidth: (2).
	leftSum8 minHeight: (2).
	leftSum8 cellInset: (0).
	leftSum8 cellPositioning: (#center).
	leftSum8 cellSpacing: (#none).
	leftSum8 layoutInset: (0).
	leftSum8 listCentering: (#center).
	leftSum8 listDirection: (#topToBottom).
	leftSum8 listSpacing: (#none).
	leftSum8 maxCellSize: (1073741823).
	leftSum8 minCellSize: (0).
	leftSum8 wrapCentering: (#center).
	leftSum8 wrapDirection: (#none).
	leftSum8 frameFractions: (0@0 corner: 1@1).
	leftSum8 frameOffsets: (0@0 corner: 0@0).
	leftSum8 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum8 setProperty: #objectName toValue: 'leftSum8'.
	unnamedMorph5 addChild: leftSum8.
	leftSum9 := SudokuGivenNumberCell new.
	leftSum9 changeTableLayout.
	leftSum9 extent: (75@75).
	leftSum9 position: (10@717).
	leftSum9 hResizing: (#rigid).
	leftSum9 vResizing: (#rigid).
	leftSum9 minWidth: (2).
	leftSum9 minHeight: (2).
	leftSum9 cellInset: (0).
	leftSum9 cellPositioning: (#center).
	leftSum9 cellSpacing: (#none).
	leftSum9 layoutInset: (0).
	leftSum9 listCentering: (#center).
	leftSum9 listDirection: (#topToBottom).
	leftSum9 listSpacing: (#none).
	leftSum9 maxCellSize: (1073741823).
	leftSum9 minCellSize: (0).
	leftSum9 wrapCentering: (#center).
	leftSum9 wrapDirection: (#none).
	leftSum9 frameFractions: (0@0 corner: 1@1).
	leftSum9 frameOffsets: (0@0 corner: 0@0).
	leftSum9 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	leftSum9 setProperty: #objectName toValue: 'leftSum9'.
	unnamedMorph5 addChild: leftSum9.
	unnamedMorph4 addChild: unnamedMorph5.
	grid := SudokuGUI new.
	grid changeTableLayout.
	grid extent: (715@715).
	grid position: (85@85).
	grid hResizing: (#shrinkWrap).
	grid vResizing: (#shrinkWrap).
	grid minWidth: (2).
	grid minHeight: (2).
	grid cellInset: (0).
	grid cellPositioning: (#center).
	grid cellSpacing: (#none).
	grid layoutInset: (0).
	grid listCentering: (#topLeft).
	grid listDirection: (#leftToRight).
	grid listSpacing: (#none).
	grid maxCellSize: (1073741823).
	grid minCellSize: (0).
	grid wrapCentering: (#topLeft).
	grid wrapDirection: (#none).
	grid frameFractions: (0@0 corner: 1@1).
	grid frameOffsets: (0@0 corner: 0@0).
	grid balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.733)).
	grid setProperty: #objectName toValue: 'grid'.
	unnamedMorph4 addChild: grid.
	unnamedMorph6 := UiContainer new.
	unnamedMorph6 changeTableLayout.
	unnamedMorph6 extent: (79@715).
	unnamedMorph6 position: (800@85).
	unnamedMorph6 hResizing: (#rigid).
	unnamedMorph6 vResizing: (#spaceFill).
	unnamedMorph6 minWidth: (2).
	unnamedMorph6 minHeight: (2).
	unnamedMorph6 cellInset: (2).
	unnamedMorph6 cellPositioning: (#center).
	unnamedMorph6 cellSpacing: (#none).
	unnamedMorph6 layoutInset: (0).
	unnamedMorph6 listCentering: (#topLeft).
	unnamedMorph6 listDirection: (#topToBottom).
	unnamedMorph6 listSpacing: (#none).
	unnamedMorph6 maxCellSize: (1073741823).
	unnamedMorph6 minCellSize: (0).
	unnamedMorph6 wrapCentering: (#topLeft).
	unnamedMorph6 wrapDirection: (#none).
	unnamedMorph6 frameFractions: (0@0 corner: 1@1).
	unnamedMorph6 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph6 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.733)).
	unnamedMorph6 color: (Color transparent).
	unnamedMorph6 borderWidth: (0).
	unnamedMorph6 borderStyle2: (#simple).
	unnamedMorph6 borderColor: (Color black).
	rightSum1 := SudokuGivenNumberCell new.
	rightSum1 changeTableLayout.
	rightSum1 extent: (75@83).
	rightSum1 position: (800@85).
	rightSum1 hResizing: (#rigid).
	rightSum1 vResizing: (#rigid).
	rightSum1 minWidth: (2).
	rightSum1 minHeight: (2).
	rightSum1 cellInset: (0).
	rightSum1 cellPositioning: (#center).
	rightSum1 cellSpacing: (#none).
	rightSum1 layoutInset: (0).
	rightSum1 listCentering: (#center).
	rightSum1 listDirection: (#topToBottom).
	rightSum1 listSpacing: (#none).
	rightSum1 maxCellSize: (1073741823).
	rightSum1 minCellSize: (0).
	rightSum1 wrapCentering: (#center).
	rightSum1 wrapDirection: (#none).
	rightSum1 frameFractions: (0@0 corner: 1@1).
	rightSum1 frameOffsets: (0@0 corner: 0@0).
	rightSum1 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum1 setProperty: #objectName toValue: 'rightSum1'.
	unnamedMorph6 addChild: rightSum1.
	rightSum2 := SudokuGivenNumberCell new.
	rightSum2 changeTableLayout.
	rightSum2 extent: (75@75).
	rightSum2 position: (800@170).
	rightSum2 hResizing: (#rigid).
	rightSum2 vResizing: (#rigid).
	rightSum2 minWidth: (2).
	rightSum2 minHeight: (2).
	rightSum2 cellInset: (0).
	rightSum2 cellPositioning: (#center).
	rightSum2 cellSpacing: (#none).
	rightSum2 layoutInset: (0).
	rightSum2 listCentering: (#center).
	rightSum2 listDirection: (#topToBottom).
	rightSum2 listSpacing: (#none).
	rightSum2 maxCellSize: (1073741823).
	rightSum2 minCellSize: (0).
	rightSum2 wrapCentering: (#center).
	rightSum2 wrapDirection: (#none).
	rightSum2 frameFractions: (0@0 corner: 1@1).
	rightSum2 frameOffsets: (0@0 corner: 0@0).
	rightSum2 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum2 setProperty: #objectName toValue: 'rightSum2'.
	unnamedMorph6 addChild: rightSum2.
	rightSum3 := SudokuGivenNumberCell new.
	rightSum3 changeTableLayout.
	rightSum3 extent: (75@75).
	rightSum3 position: (800@247).
	rightSum3 hResizing: (#rigid).
	rightSum3 vResizing: (#rigid).
	rightSum3 minWidth: (2).
	rightSum3 minHeight: (2).
	rightSum3 cellInset: (0).
	rightSum3 cellPositioning: (#center).
	rightSum3 cellSpacing: (#none).
	rightSum3 layoutInset: (0).
	rightSum3 listCentering: (#center).
	rightSum3 listDirection: (#topToBottom).
	rightSum3 listSpacing: (#none).
	rightSum3 maxCellSize: (1073741823).
	rightSum3 minCellSize: (0).
	rightSum3 wrapCentering: (#center).
	rightSum3 wrapDirection: (#none).
	rightSum3 frameFractions: (0@0 corner: 1@1).
	rightSum3 frameOffsets: (0@0 corner: 0@0).
	rightSum3 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum3 setProperty: #objectName toValue: 'rightSum3'.
	unnamedMorph6 addChild: rightSum3.
	rightSum4 := SudokuGivenNumberCell new.
	rightSum4 changeTableLayout.
	rightSum4 extent: (75@79).
	rightSum4 position: (800@324).
	rightSum4 hResizing: (#rigid).
	rightSum4 vResizing: (#rigid).
	rightSum4 minWidth: (2).
	rightSum4 minHeight: (2).
	rightSum4 cellInset: (0).
	rightSum4 cellPositioning: (#center).
	rightSum4 cellSpacing: (#none).
	rightSum4 layoutInset: (0).
	rightSum4 listCentering: (#center).
	rightSum4 listDirection: (#topToBottom).
	rightSum4 listSpacing: (#none).
	rightSum4 maxCellSize: (1073741823).
	rightSum4 minCellSize: (0).
	rightSum4 wrapCentering: (#center).
	rightSum4 wrapDirection: (#none).
	rightSum4 frameFractions: (0@0 corner: 1@1).
	rightSum4 frameOffsets: (0@0 corner: 0@0).
	rightSum4 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum4 setProperty: #objectName toValue: 'rightSum4'.
	unnamedMorph6 addChild: rightSum4.
	rightSum5 := SudokuGivenNumberCell new.
	rightSum5 changeTableLayout.
	rightSum5 extent: (75@75).
	rightSum5 position: (800@405).
	rightSum5 hResizing: (#rigid).
	rightSum5 vResizing: (#rigid).
	rightSum5 minWidth: (2).
	rightSum5 minHeight: (2).
	rightSum5 cellInset: (0).
	rightSum5 cellPositioning: (#center).
	rightSum5 cellSpacing: (#none).
	rightSum5 layoutInset: (0).
	rightSum5 listCentering: (#center).
	rightSum5 listDirection: (#topToBottom).
	rightSum5 listSpacing: (#none).
	rightSum5 maxCellSize: (1073741823).
	rightSum5 minCellSize: (0).
	rightSum5 wrapCentering: (#center).
	rightSum5 wrapDirection: (#none).
	rightSum5 frameFractions: (0@0 corner: 1@1).
	rightSum5 frameOffsets: (0@0 corner: 0@0).
	rightSum5 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum5 setProperty: #objectName toValue: 'rightSum5'.
	unnamedMorph6 addChild: rightSum5.
	rightSum6 := SudokuGivenNumberCell new.
	rightSum6 changeTableLayout.
	rightSum6 extent: (75@75).
	rightSum6 position: (800@482).
	rightSum6 hResizing: (#rigid).
	rightSum6 vResizing: (#rigid).
	rightSum6 minWidth: (2).
	rightSum6 minHeight: (2).
	rightSum6 cellInset: (0).
	rightSum6 cellPositioning: (#center).
	rightSum6 cellSpacing: (#none).
	rightSum6 layoutInset: (0).
	rightSum6 listCentering: (#center).
	rightSum6 listDirection: (#topToBottom).
	rightSum6 listSpacing: (#none).
	rightSum6 maxCellSize: (1073741823).
	rightSum6 minCellSize: (0).
	rightSum6 wrapCentering: (#center).
	rightSum6 wrapDirection: (#none).
	rightSum6 frameFractions: (0@0 corner: 1@1).
	rightSum6 frameOffsets: (0@0 corner: 0@0).
	rightSum6 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum6 setProperty: #objectName toValue: 'rightSum6'.
	unnamedMorph6 addChild: rightSum6.
	rightSum7 := SudokuGivenNumberCell new.
	rightSum7 changeTableLayout.
	rightSum7 extent: (75@79).
	rightSum7 position: (800@559).
	rightSum7 hResizing: (#rigid).
	rightSum7 vResizing: (#rigid).
	rightSum7 minWidth: (2).
	rightSum7 minHeight: (2).
	rightSum7 cellInset: (0).
	rightSum7 cellPositioning: (#center).
	rightSum7 cellSpacing: (#none).
	rightSum7 layoutInset: (0).
	rightSum7 listCentering: (#center).
	rightSum7 listDirection: (#topToBottom).
	rightSum7 listSpacing: (#none).
	rightSum7 maxCellSize: (1073741823).
	rightSum7 minCellSize: (0).
	rightSum7 wrapCentering: (#center).
	rightSum7 wrapDirection: (#none).
	rightSum7 frameFractions: (0@0 corner: 1@1).
	rightSum7 frameOffsets: (0@0 corner: 0@0).
	rightSum7 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum7 setProperty: #objectName toValue: 'rightSum7'.
	unnamedMorph6 addChild: rightSum7.
	rightSum8 := SudokuGivenNumberCell new.
	rightSum8 changeTableLayout.
	rightSum8 extent: (75@75).
	rightSum8 position: (800@640).
	rightSum8 hResizing: (#rigid).
	rightSum8 vResizing: (#rigid).
	rightSum8 minWidth: (2).
	rightSum8 minHeight: (2).
	rightSum8 cellInset: (0).
	rightSum8 cellPositioning: (#center).
	rightSum8 cellSpacing: (#none).
	rightSum8 layoutInset: (0).
	rightSum8 listCentering: (#center).
	rightSum8 listDirection: (#topToBottom).
	rightSum8 listSpacing: (#none).
	rightSum8 maxCellSize: (1073741823).
	rightSum8 minCellSize: (0).
	rightSum8 wrapCentering: (#center).
	rightSum8 wrapDirection: (#none).
	rightSum8 frameFractions: (0@0 corner: 1@1).
	rightSum8 frameOffsets: (0@0 corner: 0@0).
	rightSum8 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum8 setProperty: #objectName toValue: 'rightSum8'.
	unnamedMorph6 addChild: rightSum8.
	rightSum9 := SudokuGivenNumberCell new.
	rightSum9 changeTableLayout.
	rightSum9 extent: (75@75).
	rightSum9 position: (800@717).
	rightSum9 hResizing: (#rigid).
	rightSum9 vResizing: (#rigid).
	rightSum9 minWidth: (2).
	rightSum9 minHeight: (2).
	rightSum9 cellInset: (0).
	rightSum9 cellPositioning: (#center).
	rightSum9 cellSpacing: (#none).
	rightSum9 layoutInset: (0).
	rightSum9 listCentering: (#center).
	rightSum9 listDirection: (#topToBottom).
	rightSum9 listSpacing: (#none).
	rightSum9 maxCellSize: (1073741823).
	rightSum9 minCellSize: (0).
	rightSum9 wrapCentering: (#center).
	rightSum9 wrapDirection: (#none).
	rightSum9 frameFractions: (0@0 corner: 1@1).
	rightSum9 frameOffsets: (0@0 corner: 0@0).
	rightSum9 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.741)).
	rightSum9 setProperty: #objectName toValue: 'rightSum9'.
	unnamedMorph6 addChild: rightSum9.
	unnamedMorph4 addChild: unnamedMorph6.
	panel addChild: unnamedMorph4.
	unnamedMorph7 := UiContainer new.
	unnamedMorph7 changeTableLayout.
	unnamedMorph7 extent: (877@79).
	unnamedMorph7 position: (4@802).
	unnamedMorph7 hResizing: (#spaceFill).
	unnamedMorph7 vResizing: (#rigid).
	unnamedMorph7 minWidth: (2).
	unnamedMorph7 minHeight: (2).
	unnamedMorph7 cellInset: (2).
	unnamedMorph7 cellPositioning: (#center).
	unnamedMorph7 cellSpacing: (#none).
	unnamedMorph7 layoutInset: (2).
	unnamedMorph7 listCentering: (#topLeft).
	unnamedMorph7 listDirection: (#leftToRight).
	unnamedMorph7 listSpacing: (#none).
	unnamedMorph7 maxCellSize: (1073741823).
	unnamedMorph7 minCellSize: (0).
	unnamedMorph7 wrapCentering: (#topLeft).
	unnamedMorph7 wrapDirection: (#none).
	unnamedMorph7 frameFractions: (0@0 corner: 1@1).
	unnamedMorph7 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph7 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.729)).
	unnamedMorph7 color: (Color transparent).
	unnamedMorph7 borderWidth: (0).
	unnamedMorph7 borderStyle2: (#simple).
	unnamedMorph7 borderColor: (Color black).
	unnamedMorph8 := SudokuGivenNumberCell new.
	unnamedMorph8 changeTableLayout.
	unnamedMorph8 extent: (85@75).
	unnamedMorph8 position: (6@804).
	unnamedMorph8 hResizing: (#rigid).
	unnamedMorph8 vResizing: (#rigid).
	unnamedMorph8 minWidth: (2).
	unnamedMorph8 minHeight: (2).
	unnamedMorph8 cellInset: (0).
	unnamedMorph8 cellPositioning: (#center).
	unnamedMorph8 cellSpacing: (#none).
	unnamedMorph8 layoutInset: (0).
	unnamedMorph8 listCentering: (#center).
	unnamedMorph8 listDirection: (#topToBottom).
	unnamedMorph8 listSpacing: (#none).
	unnamedMorph8 maxCellSize: (1073741823).
	unnamedMorph8 minCellSize: (0).
	unnamedMorph8 wrapCentering: (#center).
	unnamedMorph8 wrapDirection: (#none).
	unnamedMorph8 frameFractions: (0@0 corner: 1@1).
	unnamedMorph8 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph8 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.733)).
	unnamedMorph7 addChild: unnamedMorph8.
	bottomSum1 := SudokuGivenNumberCell new.
	bottomSum1 changeTableLayout.
	bottomSum1 extent: (75@75).
	bottomSum1 position: (93@804).
	bottomSum1 hResizing: (#rigid).
	bottomSum1 vResizing: (#rigid).
	bottomSum1 minWidth: (2).
	bottomSum1 minHeight: (2).
	bottomSum1 cellInset: (0).
	bottomSum1 cellPositioning: (#center).
	bottomSum1 cellSpacing: (#none).
	bottomSum1 layoutInset: (0).
	bottomSum1 listCentering: (#center).
	bottomSum1 listDirection: (#topToBottom).
	bottomSum1 listSpacing: (#none).
	bottomSum1 maxCellSize: (1073741823).
	bottomSum1 minCellSize: (0).
	bottomSum1 wrapCentering: (#center).
	bottomSum1 wrapDirection: (#none).
	bottomSum1 frameFractions: (0@0 corner: 1@1).
	bottomSum1 frameOffsets: (0@0 corner: 0@0).
	bottomSum1 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum1 setProperty: #objectName toValue: 'bottomSum1'.
	unnamedMorph7 addChild: bottomSum1.
	bottomSum2 := SudokuGivenNumberCell new.
	bottomSum2 changeTableLayout.
	bottomSum2 extent: (75@75).
	bottomSum2 position: (170@804).
	bottomSum2 hResizing: (#rigid).
	bottomSum2 vResizing: (#rigid).
	bottomSum2 minWidth: (2).
	bottomSum2 minHeight: (2).
	bottomSum2 cellInset: (0).
	bottomSum2 cellPositioning: (#center).
	bottomSum2 cellSpacing: (#none).
	bottomSum2 layoutInset: (0).
	bottomSum2 listCentering: (#center).
	bottomSum2 listDirection: (#topToBottom).
	bottomSum2 listSpacing: (#none).
	bottomSum2 maxCellSize: (1073741823).
	bottomSum2 minCellSize: (0).
	bottomSum2 wrapCentering: (#center).
	bottomSum2 wrapDirection: (#none).
	bottomSum2 frameFractions: (0@0 corner: 1@1).
	bottomSum2 frameOffsets: (0@0 corner: 0@0).
	bottomSum2 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum2 setProperty: #objectName toValue: 'bottomSum2'.
	unnamedMorph7 addChild: bottomSum2.
	bottomSum3 := SudokuGivenNumberCell new.
	bottomSum3 changeTableLayout.
	bottomSum3 extent: (75@75).
	bottomSum3 position: (247@804).
	bottomSum3 hResizing: (#rigid).
	bottomSum3 vResizing: (#rigid).
	bottomSum3 minWidth: (2).
	bottomSum3 minHeight: (2).
	bottomSum3 cellInset: (0).
	bottomSum3 cellPositioning: (#center).
	bottomSum3 cellSpacing: (#none).
	bottomSum3 layoutInset: (0).
	bottomSum3 listCentering: (#center).
	bottomSum3 listDirection: (#topToBottom).
	bottomSum3 listSpacing: (#none).
	bottomSum3 maxCellSize: (1073741823).
	bottomSum3 minCellSize: (0).
	bottomSum3 wrapCentering: (#center).
	bottomSum3 wrapDirection: (#none).
	bottomSum3 frameFractions: (0@0 corner: 1@1).
	bottomSum3 frameOffsets: (0@0 corner: 0@0).
	bottomSum3 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum3 setProperty: #objectName toValue: 'bottomSum3'.
	unnamedMorph7 addChild: bottomSum3.
	bottomSum4 := SudokuGivenNumberCell new.
	bottomSum4 changeTableLayout.
	bottomSum4 extent: (79@75).
	bottomSum4 position: (324@804).
	bottomSum4 hResizing: (#rigid).
	bottomSum4 vResizing: (#rigid).
	bottomSum4 minWidth: (2).
	bottomSum4 minHeight: (2).
	bottomSum4 cellInset: (0).
	bottomSum4 cellPositioning: (#center).
	bottomSum4 cellSpacing: (#none).
	bottomSum4 layoutInset: (0).
	bottomSum4 listCentering: (#center).
	bottomSum4 listDirection: (#topToBottom).
	bottomSum4 listSpacing: (#none).
	bottomSum4 maxCellSize: (1073741823).
	bottomSum4 minCellSize: (0).
	bottomSum4 wrapCentering: (#center).
	bottomSum4 wrapDirection: (#none).
	bottomSum4 frameFractions: (0@0 corner: 1@1).
	bottomSum4 frameOffsets: (0@0 corner: 0@0).
	bottomSum4 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum4 setProperty: #objectName toValue: 'bottomSum4'.
	unnamedMorph7 addChild: bottomSum4.
	bottomSum5 := SudokuGivenNumberCell new.
	bottomSum5 changeTableLayout.
	bottomSum5 extent: (75@75).
	bottomSum5 position: (405@804).
	bottomSum5 hResizing: (#rigid).
	bottomSum5 vResizing: (#rigid).
	bottomSum5 minWidth: (2).
	bottomSum5 minHeight: (2).
	bottomSum5 cellInset: (0).
	bottomSum5 cellPositioning: (#center).
	bottomSum5 cellSpacing: (#none).
	bottomSum5 layoutInset: (0).
	bottomSum5 listCentering: (#center).
	bottomSum5 listDirection: (#topToBottom).
	bottomSum5 listSpacing: (#none).
	bottomSum5 maxCellSize: (1073741823).
	bottomSum5 minCellSize: (0).
	bottomSum5 wrapCentering: (#center).
	bottomSum5 wrapDirection: (#none).
	bottomSum5 frameFractions: (0@0 corner: 1@1).
	bottomSum5 frameOffsets: (0@0 corner: 0@0).
	bottomSum5 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum5 setProperty: #objectName toValue: 'bottomSum5'.
	unnamedMorph7 addChild: bottomSum5.
	bottomSum6 := SudokuGivenNumberCell new.
	bottomSum6 changeTableLayout.
	bottomSum6 extent: (75@75).
	bottomSum6 position: (482@804).
	bottomSum6 hResizing: (#rigid).
	bottomSum6 vResizing: (#rigid).
	bottomSum6 minWidth: (2).
	bottomSum6 minHeight: (2).
	bottomSum6 cellInset: (0).
	bottomSum6 cellPositioning: (#center).
	bottomSum6 cellSpacing: (#none).
	bottomSum6 layoutInset: (0).
	bottomSum6 listCentering: (#center).
	bottomSum6 listDirection: (#topToBottom).
	bottomSum6 listSpacing: (#none).
	bottomSum6 maxCellSize: (1073741823).
	bottomSum6 minCellSize: (0).
	bottomSum6 wrapCentering: (#center).
	bottomSum6 wrapDirection: (#none).
	bottomSum6 frameFractions: (0@0 corner: 1@1).
	bottomSum6 frameOffsets: (0@0 corner: 0@0).
	bottomSum6 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum6 setProperty: #objectName toValue: 'bottomSum6'.
	unnamedMorph7 addChild: bottomSum6.
	bottomSum7 := SudokuGivenNumberCell new.
	bottomSum7 changeTableLayout.
	bottomSum7 extent: (79@75).
	bottomSum7 position: (559@804).
	bottomSum7 hResizing: (#rigid).
	bottomSum7 vResizing: (#rigid).
	bottomSum7 minWidth: (2).
	bottomSum7 minHeight: (2).
	bottomSum7 cellInset: (0).
	bottomSum7 cellPositioning: (#center).
	bottomSum7 cellSpacing: (#none).
	bottomSum7 layoutInset: (0).
	bottomSum7 listCentering: (#center).
	bottomSum7 listDirection: (#topToBottom).
	bottomSum7 listSpacing: (#none).
	bottomSum7 maxCellSize: (1073741823).
	bottomSum7 minCellSize: (0).
	bottomSum7 wrapCentering: (#center).
	bottomSum7 wrapDirection: (#none).
	bottomSum7 frameFractions: (0@0 corner: 1@1).
	bottomSum7 frameOffsets: (0@0 corner: 0@0).
	bottomSum7 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum7 setProperty: #objectName toValue: 'bottomSum7'.
	unnamedMorph7 addChild: bottomSum7.
	bottomSum8 := SudokuGivenNumberCell new.
	bottomSum8 changeTableLayout.
	bottomSum8 extent: (75@75).
	bottomSum8 position: (640@804).
	bottomSum8 hResizing: (#rigid).
	bottomSum8 vResizing: (#rigid).
	bottomSum8 minWidth: (2).
	bottomSum8 minHeight: (2).
	bottomSum8 cellInset: (0).
	bottomSum8 cellPositioning: (#center).
	bottomSum8 cellSpacing: (#none).
	bottomSum8 layoutInset: (0).
	bottomSum8 listCentering: (#center).
	bottomSum8 listDirection: (#topToBottom).
	bottomSum8 listSpacing: (#none).
	bottomSum8 maxCellSize: (1073741823).
	bottomSum8 minCellSize: (0).
	bottomSum8 wrapCentering: (#center).
	bottomSum8 wrapDirection: (#none).
	bottomSum8 frameFractions: (0@0 corner: 1@1).
	bottomSum8 frameOffsets: (0@0 corner: 0@0).
	bottomSum8 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum8 setProperty: #objectName toValue: 'bottomSum8'.
	unnamedMorph7 addChild: bottomSum8.
	bottomSum9 := SudokuGivenNumberCell new.
	bottomSum9 changeTableLayout.
	bottomSum9 extent: (75@75).
	bottomSum9 position: (717@804).
	bottomSum9 hResizing: (#rigid).
	bottomSum9 vResizing: (#rigid).
	bottomSum9 minWidth: (2).
	bottomSum9 minHeight: (2).
	bottomSum9 cellInset: (0).
	bottomSum9 cellPositioning: (#center).
	bottomSum9 cellSpacing: (#none).
	bottomSum9 layoutInset: (0).
	bottomSum9 listCentering: (#center).
	bottomSum9 listDirection: (#topToBottom).
	bottomSum9 listSpacing: (#none).
	bottomSum9 maxCellSize: (1073741823).
	bottomSum9 minCellSize: (0).
	bottomSum9 wrapCentering: (#center).
	bottomSum9 wrapDirection: (#none).
	bottomSum9 frameFractions: (0@0 corner: 1@1).
	bottomSum9 frameOffsets: (0@0 corner: 0@0).
	bottomSum9 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	bottomSum9 setProperty: #objectName toValue: 'bottomSum9'.
	unnamedMorph7 addChild: bottomSum9.
	unnamedMorph9 := SudokuGivenNumberCell new.
	unnamedMorph9 changeTableLayout.
	unnamedMorph9 extent: (85@75).
	unnamedMorph9 position: (794@804).
	unnamedMorph9 hResizing: (#rigid).
	unnamedMorph9 vResizing: (#rigid).
	unnamedMorph9 minWidth: (2).
	unnamedMorph9 minHeight: (2).
	unnamedMorph9 cellInset: (0).
	unnamedMorph9 cellPositioning: (#center).
	unnamedMorph9 cellSpacing: (#none).
	unnamedMorph9 layoutInset: (0).
	unnamedMorph9 listCentering: (#center).
	unnamedMorph9 listDirection: (#topToBottom).
	unnamedMorph9 listSpacing: (#none).
	unnamedMorph9 maxCellSize: (1073741823).
	unnamedMorph9 minCellSize: (0).
	unnamedMorph9 wrapCentering: (#center).
	unnamedMorph9 wrapDirection: (#none).
	unnamedMorph9 frameFractions: (0@0 corner: 1@1).
	unnamedMorph9 frameOffsets: (0@0 corner: 0@0).
	unnamedMorph9 balloonColor: ((TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.737)).
	unnamedMorph7 addChild: unnamedMorph9.
	panel addChild: unnamedMorph7.
	panel setProperty: #uiClassName toValue: 'SudokuGUIOutsideSum'.