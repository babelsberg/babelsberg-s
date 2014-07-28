fork and exec
nice: inc
	"Change the scheduling priority of this OS process by the given nice increment.
	A positive increment decreases the priority. Only the superuser can specify
	a negative value to increase the priority. A typical use is to increase the
	nice value by 1 in order to make the Squeak VM run at lower priority. This
	may be useful for a background Squeak doing an image save or other non-
	interactive process."

	"OSProcess accessor nice: 1"

	^ self primNice: inc
