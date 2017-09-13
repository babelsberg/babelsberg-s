api
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec
			baseline: 'Widgets' with: [
				spec
					repository: 'github://hpi-swa/widgets:master/repository';
					loads: #('full')];
			project: 'ContextS2' with: [
				spec
					className: 'ConfigurationOfContextS';
					repository: 'http://www.squeaksource.com/MetacelloRepository'];
			yourself.

		spec
			package: 'OSProcess' with: [spec repository: 'http://www.squeaksource.com/OSProcess'];
			package: 'MethodWrappers' with: [spec repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities'];
			yourself.

		spec
			package: 'Cassowary';
			package: 'Sudoku' with: [spec requires: #('Widgets' 'Constraints')];
			package: 'Puzzles' with: [spec requires: #('Sudoku')];
			package: 'Constraints-Core' with: [
				spec requires: #('MethodWrappers' 'OSProcess' 'ContextS2' 'Cassowary')];
			package: 'Constraints-Tests' with: [
				spec requires: #('Constraints-Core' 'Puzzles')];
			package: 'Constraints-Tools' with: [
				spec requires: #('Constraints-Core')];
			package: 'ConstraintsDebugger' with: [
				spec requires: #('Constraints-Core')];
			package: 'Babelsberg-Tests' with: [
				spec requires: #('Constraints-Tests')];
			yourself.
		
		spec
			group: 'default' with: #('tests');
			group: 'core' with: #('Constraints-Core' 'Constraints-Tools' 'ConstraintsDebugger' 'Puzzles');
			group: 'tests' with: #('core' 'Constraints-Tests');
			group: 'dev' with: #('Babelsberg-Tests' 'tests');
			yourself].
