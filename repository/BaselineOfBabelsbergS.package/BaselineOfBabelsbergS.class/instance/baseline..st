as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'Widgets' with: [
			spec
				className: 'BaselineOfWidgets';
				repository: 'github://marceltaeumel/widgets:master/repository';
				loads: #(full)].
		
		spec project: 'ContextS2' with: [
			spec
				className: 'ConfigurationOfContextS';
				repository: 'http://www.squeaksource.com/MetacelloRepository'].

		spec package: 'OSProcess' with: [
			spec repository: 'http://www.squeaksource.com/OSProcess'].

		spec package: 'MethodWrappers' with: [
			spec repository: 'http://hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities'].

		spec package: 'Cassowary'.
		spec package: 'Sudoku' with: [spec requires: #('Widgets')].
		spec package: 'Puzzles' with: [spec requires: #('Sudoku')].
		spec package: 'Constraints' with: [
			spec requires: #('MethodWrappers' 'OSProcess' 'ContextS2' 'Cassowary' 'Puzzles')].
		
		spec
			group: 'default' with: #('core');
			group: 'core' with: #('Constraints')].
