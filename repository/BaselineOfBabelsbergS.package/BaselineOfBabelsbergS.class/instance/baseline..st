api
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec baseline: 'Widgets' with: [
			spec
				repository: 'github://hpi-swa/widgets:master/repository';
				loads: #('full')].
		
		spec project: 'ContextS2' with: [
			spec
				className: 'ConfigurationOfContextS';
				repository: 'http://www.squeaksource.com/MetacelloRepository'].

		spec package: 'OSProcess' with: [
			spec repository: 'http://www.squeaksource.com/OSProcess'].

		spec package: 'MethodWrappers' with: [
			spec repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities'].

		spec package: 'Cassowary'.
		spec package: 'Sudoku' with: [spec requires: #('Widgets' 'Constraints')].
		spec package: 'Puzzles' with: [spec requires: #('Sudoku')].
		spec package: 'Constraints' with: [
			spec requires: #('MethodWrappers' 'OSProcess' 'ContextS2' 'Cassowary')].
		spec package: 'ConstraintsDebugger' with: [
			spec requires: #('Constraints')].
		spec package: 'Babelsberg-Tests' with: [
			spec requires: #('Constraints')].
		
		spec
			group: 'default' with: #('core');
			group: 'core' with: #('Constraints' 'ConstraintsDebugger' 'Puzzles');
			group: 'dev' with: #('Babelsberg-Tests')].
