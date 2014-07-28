accessing
pentominoDeltaDict

	PentominoDeltaDict ifNil: [
		PentominoDeltaDict := {
			$i -> {0@0. 0@1. 0@2. 0@3. 0@4}.
			$l -> {0@0. 1@0. 2@0. 3@0. 0@1}.
			$t -> {0@0. 0@1. 0@2. 1@1. 2@1}.
			$u -> {0@0. (-1)@0. 0@1. 0@2. (-1)@2}.
			$x -> {0@0. 0@1. 0@(-1). 1@0. (-1)@0}.
			$y -> {0@0. 1@0. 2@0. 3@0. 2@(-1)}} as: Dictionary].
	 ^ PentominoDeltaDict