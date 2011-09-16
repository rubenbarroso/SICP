(rule (wheel ?person)
      (and (supervisor ?middle-manager ?person)
           (supervisor ?x ?middle-manager)))

If we follow the unification algorithm, this is easy. The unification of the query and the rule results in a frame with the binding ?person = ?who.
With such frame, the first and query of the rule produces the following output stream of extended frames, one per each supervisor assertion in the database:

1) ?middle-manager = (Hacker Alyssa P), ?person = (Bitdiddle Ben)
2) ?middle-manager = (Fect Cy D), ?person = (Bitdiddle Ben)
3) ?middle-manager = (Tweakit Lem E), ?person = (Bitdiddle Ben)
4) ?middle-manager = (Reasoner Louis), ?person = (Hacker Alyssa P)
5) ?middle-manager = (Bitdiddle Ben), ?person = (Warbucks Oliver)
6) ?middle-manager = (Scrooge Eben), ?person = (Warbucks Oliver)
7) ?middle-manager = (Cratchet Robert), ?person = (Scrooge Eben)
8) ?middle-manager = (Aull DeWitt), ?person = (Warbucks Oliver)

The second and query matches all the supervisor assertions in the database for every extended frame coming out of the first and query, resulting in:

1) ?middle-manager = (Hacker Alyssa P), ?person = (Bitdiddle Ben), ?x = (Reasoner Louis)
2) No matches / No output frames
3) No matches / No output frames
4) No matches / No output frames
5) ?middle-manager = (Bitdiddle Ben), ?person = (Warbucks Oliver), ?x = (Hacker Alyssa P)
   ?middle-manager = (Bitdiddle Ben), ?person = (Warbucks Oliver), ?x = (Fect Cy D)
   ?middle-manager = (Bitdiddle Ben), ?person = (Warbucks Oliver), ?x = (Tweakit Lem E)
6) ?middle-manager = (Scrooge Eben), ?person = (Warbucks Oliver), ?x = (Cratchet Robert)
7) No matches / No output frames
8) No matches / No output frames

We can see in the output stream of extended frames coming out of the second and query -and thus out of the whole query-, that Oliver Warbucks appears four times.

